# SPDX-License-Identifier: GPL-2.0-or-later
# CompilerForCAP: Speed up computations in CAP categories
#
# Implementations
#
InstallGlobalFunction( CapJitIsCallToGlobalFunction, function ( tree, condition )
  local condition_func;
    
    if IsString( condition ) then
        
        condition_func := gvar -> gvar = condition;
        
    elif IsFunction( condition ) then
        
        condition_func := condition;
        
    else
        
        Error( "<condition> must be a string or a function" );
        
    fi;
    
    return IsRecord( tree ) and tree.type = "EXPR_FUNCCALL" and tree.funcref.type = "EXPR_REF_GVAR" and condition_func( tree.funcref.gvar );
    
end );

InstallGlobalFunction( CapJitResultFuncCombineChildren, function ( tree, result, additional_arguments )
  local key;
    
    if IsList( result ) then
        
        return result;
        
    elif IsRecord( result ) then
        
        tree := ShallowCopy( tree );

        for key in RecNames( result ) do
            
            tree.(key) := result.(key);

        od;
        
        return tree;

    else
        
        Error( "this should never happen" );
        
    fi;
    
end );

InstallGlobalFunction( CapJitContainsRefToFVAROutsideOfFuncStack, function ( tree )
  local result_func, additional_arguments_func;
  
    result_func := function ( tree, result, func_id_stack )
      local type, level;
        
        if IsList( result ) then
            
            return true in result;

        elif IsRecord( result ) then
            
            if PositionSublist( tree.type, "FVAR" ) <> fail then
                
                if not tree.func_id in func_id_stack then
                    
                    return true;
                    
                fi;
                
            fi;
            
            return ForAny( RecNames( result ), key -> result.(key) = true );
            
        else
            
            Error( "this should never happen" );
            
        fi;
        
    end;

    additional_arguments_func := function ( tree, key, func_id_stack )
        
        if IsRecord( tree ) and tree.type = "EXPR_FUNC" then
            
            Assert( 0, IsBound( tree.id ) );
            
            return Concatenation( func_id_stack, [ tree.id ] );
            
        else
            
            return func_id_stack;
            
        fi;
        
    end;
    
    return CapJitIterateOverTree( tree, ReturnFirst, result_func, additional_arguments_func, [ ] );
    
end );

BindGlobal( "CAP_JIT_INTERNAL_GLOBAL_VARIABLE_COUNTER", 1 );
MakeReadWriteGlobal( "CAP_JIT_INTERNAL_GLOBAL_VARIABLE_COUNTER" );
InstallGlobalFunction( CapJitGetOrCreateGlobalVariable, function ( value )
  local gvar, i;
    
    # check if value is already bound to a global variable
    for i in [ 1 .. CAP_JIT_INTERNAL_GLOBAL_VARIABLE_COUNTER - 1 ] do
        
        gvar := Concatenation( "CAP_JIT_INTERNAL_GLOBAL_VARIABLE_", String( i ) );

        if IsIdenticalObj( value, ValueGlobal( gvar ) ) then
            
            return gvar;
            
        fi;
        
    od;
    
    # create new global variable
    gvar := Concatenation( "CAP_JIT_INTERNAL_GLOBAL_VARIABLE_", String( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_COUNTER ) );
    
    BindGlobal( gvar, value );

    CAP_JIT_INTERNAL_GLOBAL_VARIABLE_COUNTER := CAP_JIT_INTERNAL_GLOBAL_VARIABLE_COUNTER + 1;
    
    return gvar;
    
end );

InstallGlobalFunction( CapJitThrowErrorOnSideEffects, function ( tree )
  local number_of_assignments, nams, pre_func, additional_arguments_func, i, j;
    
    # modified inplace
    number_of_assignments := [ ];
    nams := [ ];
    
    pre_func := function ( tree, func_id_stack )
      local statement, next_statement, i;
        
        if IsRecord( tree ) then
            
            # make sure we deal with an enhanced syntax tree
            if PositionSublist( tree.type, "HVAR" ) <> fail or PositionSublist( tree.type, "LVAR" ) <> fail then
                
                Error( "tree contains reference to HVAR or LVAR, this is not supported. Please use an enhanced syntax tree" );
                
            fi;
            
            # exclude most common statements and expression indicating possible side effects
            if tree.type in [ "STAT_ASS_GVAR", "EXPR_ISB_GVAR", "STAT_UNB_GVAR", "EXPR_ISB_FVAR", "EXPR_UNB_FVAR", "STAT_PROCCALL" ] then

                Error( Concatenation( "tree includes statements or expressions which indicate possible side effects: ", tree.type ) );

            fi;
            
            # make sure that fvars reference only functions in the current function stack
            if PositionSublist( tree.type, "FVAR" ) <> fail then
                
                Assert( 0, IsBound( tree.func_id ) );
                
                if not tree.func_id in func_id_stack then
                    
                    Error( Concatenation( "tree contains reference to an fvar with inital name ", tree.initial_name, " outside of the current function stack, this is not well-defined" ) );
                    
                fi;
                
            fi;

            # make sure for loop only loops over local variables
            if tree.type = "STAT_FOR" then
                
                if tree.variable.type <> "EXPR_REF_FVAR" or tree.variable.func_id <> Last( func_id_stack ) then
                    
                    Error( "tree contains for loop over non-local variable, this is not supported" );
                    
                fi;
                
            fi;
            
            # initialize number_of_assignments and nams per function
            if tree.type = "EXPR_FUNC" and not IsBound( number_of_assignments[tree.id] ) then
                
                number_of_assignments[tree.id] := Concatenation( ListWithIdenticalEntries( tree.narg, 1 ), ListWithIdenticalEntries( tree.nloc, 0 ) );
                nams[tree.id] := tree.nams;
                
            fi;
            
            # make sure that only local variables are assigned, increase number_of_assignments
            if tree.type = "STAT_ASS_FVAR" then
                
                if tree.func_id <> Last( func_id_stack ) then
                    
                    Error( Concatenation( "tree contains an assignment of a higher variable with initial name ", tree.initial_name, ", this is not supported" ) );
                    
                fi;

                Assert( 0, IsBound( number_of_assignments[tree.func_id][tree.pos] ) );
                
                number_of_assignments[tree.func_id][tree.pos] := number_of_assignments[tree.func_id][tree.pos] + 1;
                
            fi;
            
            # do not count rapid reassignments
            if tree.type = "STAT_SEQ_STAT" then
                
                for i in [ 1 .. Length( tree.statements ) - 1 ] do
                    
                    statement := tree.statements[i];
                    next_statement := tree.statements[i + 1];
                    
                    if statement.type = "STAT_ASS_FVAR" and next_statement.type = "STAT_ASS_FVAR" and statement.func_id = next_statement.func_id and statement.pos = next_statement.pos then
                        
                        if IsBound( number_of_assignments[statement.func_id] ) then
                            
                            Assert( 0, IsBound( number_of_assignments[statement.func_id][statement.pos] ) );
                            
                            number_of_assignments[statement.func_id][statement.pos] := number_of_assignments[statement.func_id][statement.pos] - 1;
                            
                        fi;
                        
                    fi;
                    
                od;
                
            fi;
            
        fi;
            
        return tree;
        
    end;
    
    additional_arguments_func := function ( tree, key, func_id_stack )
        
        if IsRecord( tree ) and tree.type = "EXPR_FUNC" then
            
            Assert( 0, IsBound( tree.id ) );
            
            return Concatenation( func_id_stack, [ tree.id ] );
            
        else
            
            return func_id_stack;
            
        fi;
        
    end;
    
    CapJitIterateOverTree( tree, pre_func, ReturnTrue, additional_arguments_func, [ ] );
    
    # make sure no variables is assigned more than once
    for i in [ 1 .. Length( number_of_assignments ) ] do
        
        if IsBound( number_of_assignments[i] ) then
            
            for j in [ 1 .. Length( number_of_assignments[i] ) ] do
                
                if number_of_assignments[i][j] >= 2 then
                    
                    Error( Concatenation( "a local variable with name ", nams[i][j], " is assigned more than once (not as a part of a rapid reassignment), this is not supported" ) );
                    
                fi;
                
            od;
            
        fi;
        
    od;
    
end );

InstallGlobalFunction( CapJitFindNodeDeep, function ( tree, condition_func )
  local result_func, additional_arguments_func;
    
    result_func := function ( tree, result, path )
      local key, type;
        
        if IsList( result ) then
            
            return First( result, r -> r <> fail );
            
        elif IsRecord( result ) then
        
            for key in RecNames( result ) do
                
                if result.(key) <> fail then
                    
                    return result.(key);
                
                fi;
                    
            od;

            # none of the descendants fulfills condition, otherwise we would already have returned above
            if condition_func( tree, path ) then
                
                return path;
                
            fi;
            
            # neither this record nor any of its descendants fulfills the condition
            return fail;

        else
            
            Error( "this should never happen" );
            
        fi;
        
    end;

    additional_arguments_func := function ( tree, key, path )
        
        return Concatenation( path, [ key ] );
        
    end;
  
    return CapJitIterateOverTree( tree, ReturnFirst, result_func, additional_arguments_func, [ ] );

end );

InstallGlobalFunction( CapJitGetNodeByPath, function ( tree, path )
    
    if Length( path ) = 0 then
        
        return tree;
        
    elif IsList( tree ) then
        
        Assert( 0, IsPosInt( path[1] ) and path[1] <= Length( tree ) );

        return CapJitGetNodeByPath( tree[path[1]], path{[ 2 .. Length( path ) ]} );

    else
       
        Assert( 0, IsBound( tree.(path[1]) ) );
        
        return CapJitGetNodeByPath( tree.(path[1]), path{[ 2 .. Length( path ) ]} );
        
    fi;
    
end );
