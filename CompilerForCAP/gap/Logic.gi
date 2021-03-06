# SPDX-License-Identifier: GPL-2.0-or-later
# CompilerForCAP: Speed up computations in CAP categories
#
# Implementations
#
BindGlobal( "CAP_JIT_LOGIC_FUNCTIONS", [ ] );

InstallGlobalFunction( CapJitAddLogicFunction, function ( func )
    
    if not IsFunction( func ) then
        
        Error( "a logic function must be a function" );
        
    fi;
    
    if not NumberArgumentsFunction( func ) in [ -2, -1, 2 ] then
        
        Error( "a logic function must be callable with two arguments" );
        
    fi;
    
    Add( CAP_JIT_LOGIC_FUNCTIONS, func );
    
end );

InstallGlobalFunction( CapJitAppliedLogic, function ( tree, jit_args )
  local logic_function;
    
    for logic_function in CAP_JIT_LOGIC_FUNCTIONS do
        
        tree := CallFuncList( logic_function, [ tree, jit_args ] );
        
    od;
    
    tree := CapJitAppliedLogicTemplates( tree, jit_args );
    
    return tree;
    
end );

# Concatenation( [ a, b, ... ], [ c, d, ... ], ... ) => [ a, b, ..., c, d, ... ]
CapJitAddLogicFunction( function ( tree, jit_args )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for concatenation of lists." );
    
    pre_func := function ( tree, additional_arguments )
      local args;
        
        if CapJitIsCallToGlobalFunction( tree, "Concatenation" ) then
            
            args := tree.args;
            
            if ForAll( args, a -> a.type = "EXPR_LIST" ) then
                
                return rec(
                    type := "EXPR_LIST",
                    list := Concatenation( List( args, a -> a.list ) ),
                );
                
            fi;

        fi;
            
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

# CallFuncList( func, [ a, b, ... ] ) => func( a, b, ... )
CapJitAddLogicFunction( function ( tree, jit_args )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for CallFuncList." );
    
    pre_func := function ( tree, additional_arguments )
      local args;
        
        if CapJitIsCallToGlobalFunction( tree, "CallFuncList" ) then
            
            args := tree.args;
            
            if args[2].type = "EXPR_LIST" then
                
                return rec(
                    type := "EXPR_FUNCCALL",
                    funcref := args[1],
                    args := args[2].list,
                );
                
            fi;
            
        fi;
        
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

# AttributeGetter( ObjectifyWithAttributes( ..., Attribute, value, ... ) ) => value
CapJitAddLogicFunction( function ( tree, jit_args )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for attribute getters." );
    
    pre_func := function ( tree, additional_arguments )
      local args, object, value, pos;
        
        if CapJitIsCallToGlobalFunction( tree, gvar -> IsAttribute( ValueGlobal( gvar ) ) ) then
            
            args := tree.args;
            
            # an attribute getter only has a single argument
            Assert( 0, Length( args ) = 1 );
            
            object := args[1];

            if CapJitIsCallToGlobalFunction( object, "ObjectifyWithAttributes" ) then
                
                pos := PositionProperty( object.args, a -> a.type = "EXPR_REF_GVAR" and a.gvar = tree.funcref.gvar );
                
                if pos <> fail then
                    
                    Assert( 0, IsBound( object.args[pos + 1] ) );
                    
                    return object.args[pos + 1];
                    
                fi;
                
            fi;

        fi;
            
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

# if <condition> then <body>; return <value>; fi; <more statements>
# =>
# if <condition> then <body>; return <value>; else <more statements>; fi
CapJitAddLogicFunction( function ( tree, jit_args )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for ifs." );
    
    pre_func := function ( tree, additional_arguments )
      local statements, i, statement, new_branch;
        
        if IsRecord( tree ) and tree.type = "EXPR_FUNC" then
            
            statements := tree.stats.statements;

            # find if ... then ...; return ...; elif ...; return ...; fi; (excluding the last statement)
            i := 1;
            while i <= Length( statements ) - 1 do
                
                statement := statements[i];
                
                if StartsWith( statement.type, "STAT_IF" ) and ForAll( statement.branches, b -> Last( b.body.statements ).type = "STAT_RETURN_OBJ" ) then
                    # we are in the main sequence of statements of a function => we are not inside of a loop
                    # and all branches end with a return statement
                    # => we reach the remaining statements iff none of the conditions of the branches match

                    if Last( statement.branches ).condition.type = "EXPR_TRUE" then
                        
                        Error( "found unreachable code, this is not yet handled" );

                    else
                        
                        Assert( 0, not EndsWith( statement.type, "_ELSE" ) );
                        
                        # put remaining statements into an else branch
                        statement.type := Concatenation( statement.type, "_ELSE" );
                        
                        new_branch := rec(
                            type := "BRANCH_IF",
                            condition := rec(
                                type := "EXPR_TRUE",
                            ),
                            body := rec(
                                type := "STAT_SEQ_STAT",
                                statements := statements{[ i + 1 .. Length( statements ) ]},
                            ),
                        );
                        
                        Add( statement.branches, new_branch );
                        
                        statements := statements{[ 1 .. i ]};

                        tree := ShallowCopy( tree );
                        tree.stats := ShallowCopy( tree.stats );
                        tree.stats.statements := statements;
                        
                    fi;
                    
                fi;
                
                i := i + 1;
                
            od;
            
        fi;
            
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );
