# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfPermutationsWithProducts_precompiled", function ( cat )
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return NumberElements( arg2_1 ) = NumberElements( arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ListOfColumns( arg2_1 ) = ListOfColumns( arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    return 0 <= NumberElements( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := ListOfColumns( alpha_1 );
    deduped_1_1 := NumberElements( Source( alpha_1 ) );
    if not ForAll( deduped_2_1, function ( col_2 )
                 return 1 <= col_2[1] and 1 <= col_2[2];
             end ) then
        return false;
    elif not ForAll( deduped_2_1, function ( col_2 )
                 return col_2[1] <= col_2[2];
             end ) then
        return false;
    elif not ForAll( deduped_2_1, function ( pair_2 )
                 return pair_2[1] <= deduped_1_1 and pair_2[2] <= deduped_1_1;
             end ) then
        return false;
    elif not NumberElements( Target( alpha_1 ) ) = Sum( List( deduped_2_1, function ( col_2 )
                     return col_2[2] - col_2[1] + 1;
                 end ) ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, NumberElements, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, ListOfColumns, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return NumberElements( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return ListOfColumns( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1;
    deduped_1_1 := NumberElements( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, ListOfColumns, [ [ NTuple( 2, 1, deduped_1_1 ) ], CapJitTypedExpression( [  ], function (  )
                    return rec(
                        filter := IsList,
                        element_type := rec(
                            filter := IsNTuple,
                            element_types := [ rec(
                                    filter := IsInt ), rec(
                                    filter := IsInt ) ] ) );
                end ) ][BooleanToInteger( deduped_1_1 = 0 ) + 1] );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, NumberElements, 0 );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ListOfColumns, CapJitTypedExpression( [  ], function (  )
              return rec(
                  filter := IsList,
                  element_type := rec(
                      filter := IsNTuple,
                      element_types := [ rec(
                              filter := IsInt ), rec(
                              filter := IsInt ) ] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, NumberElements, Sum( List( objects_1, NumberElements ) ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := List( objects_1, NumberElements );
    deduped_2_1 := deduped_3_1[k_1];
    deduped_1_1 := Sum( deduped_3_1{[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], ListOfColumns, [ [ NTuple( 2, deduped_1_1 + 1, deduped_1_1 + deduped_2_1 ) ], CapJitTypedExpression( [  ], function (  )
                    return rec(
                        filter := IsList,
                        element_type := rec(
                            filter := IsNTuple,
                            element_types := [ rec(
                                    filter := IsInt ), rec(
                                    filter := IsInt ) ] ) );
                end ) ][BooleanToInteger( deduped_2_1 = 0 ) + 1] );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ListOfColumns, Concatenation( List( tau_1, ListOfColumns ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1;
    hoisted_1_1 := List( objects_1, NumberElements );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ListOfColumns, Concatenation( List( [ 1 .. Length( L_1 ) ], function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := Sum( List( [ 1 .. i_2 - 1 ], function ( j_3 )
                          return hoisted_1_1[j_3];
                      end ) );
                return CAP_JIT_INCOMPLETE_LOGIC( List( ListOfColumns( CAP_JIT_INCOMPLETE_LOGIC( L_1[i_2] ) ), function ( col_3 )
                          return col_3 + hoisted_1_2;
                      end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectProductFunctorialWithGivenDirectProducts :=
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1;
    hoisted_1_1 := List( objects_1, NumberElements );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ListOfColumns, Concatenation( List( [ 1 .. Length( L_1 ) ], function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := Sum( List( [ 1 .. i_2 - 1 ], function ( j_3 )
                          return hoisted_1_1[j_3];
                      end ) );
                return List( L_1, function ( logic_new_func_x_3 )
                          return List( ListOfColumns( logic_new_func_x_3 ), function ( col_4 )
                                  return col_4 + hoisted_1_2;
                              end );
                      end )[i_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddTensorUnit( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, NumberElements, 1 );
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local deduped_1_1;
    deduped_1_1 := NumberElements( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, ListOfColumns, [ [ NTuple( 2, 1, deduped_1_1 ) ], CapJitTypedExpression( [  ], function (  )
                    return rec(
                        filter := IsList,
                        element_type := rec(
                            filter := IsNTuple,
                            element_types := [ rec(
                                    filter := IsInt ), rec(
                                    filter := IsInt ) ] ) );
                end ) ][BooleanToInteger( deduped_1_1 = 0 ) + 1] );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local deduped_1_1;
    deduped_1_1 := NumberElements( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, ListOfColumns, [ [ NTuple( 2, 1, deduped_1_1 ) ], CapJitTypedExpression( [  ], function (  )
                    return rec(
                        filter := IsList,
                        element_type := rec(
                            filter := IsNTuple,
                            element_types := [ rec(
                                    filter := IsInt ), rec(
                                    filter := IsInt ) ] ) );
                end ) ][BooleanToInteger( deduped_1_1 = 0 ) + 1] );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, NumberElements, NumberElements( arg2_1 ) * NumberElements( arg3_1 ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := ListOfColumns( alpha_1 );
    deduped_11_1 := ListOfColumns( beta_1 );
    deduped_10_1 := NumberElements( Source( beta_1 ) );
    deduped_9_1 := deduped_11_1[1];
    deduped_8_1 := [ 1 .. Length( deduped_12_1 ) ];
    deduped_7_1 := deduped_9_1[1];
    deduped_6_1 := deduped_9_1[2];
    if Length( deduped_11_1 ) = 1 and deduped_6_1 - deduped_7_1 + 1 = deduped_10_1 then
        return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ListOfColumns, List( deduped_8_1, function ( i_2 )
                  local deduped_1_2;
                  deduped_1_2 := deduped_12_1[i_2];
                  return NTuple( 2, deduped_7_1 + deduped_10_1 * (deduped_1_2[1] - 1), deduped_6_1 + deduped_10_1 * (deduped_1_2[2] - 1) );
              end ) );
    else
        return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ListOfColumns, Concatenation( List( deduped_8_1, function ( i_2 )
                    local deduped_1_2;
                    deduped_1_2 := deduped_12_1[i_2];
                    return Concatenation( List( [ deduped_1_2[1] .. deduped_1_2[2] ], function ( j_3 )
                              return deduped_11_1 + deduped_10_1 * (j_3 - 1);
                          end ) );
                end ) ) );
    fi;
    return;
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryOfPermutationsWithProducts_precompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( args... )
    local CAP_NAMED_ARGUMENTS, current_options, result, s;
    CAP_NAMED_ARGUMENTS := rec(
         );
    if IsEmpty( OptionsStack ) then
        current_options := rec(
             );
    else
        current_options := Last( OptionsStack );
    fi;
    for s in specification do
        if IsBound( current_options.(s[1]) ) then
            CAP_NAMED_ARGUMENTS.(s[1]) := current_options.(s[1]);
            if not s[1] in CAP_INTERNAL_GLOBAL_OPTIONS then
                Unbind( current_options.(s[1]) );
            fi;
        else
            CAP_NAMED_ARGUMENTS.(s[1]) := s[2];
        fi;
    od;
    result := CallFuncListWrap( func, Concatenation( [ CAP_NAMED_ARGUMENTS ], args ) );
    if Length( result ) = 1 then
        return result[1];
    fi;
    Assert( 0, Length( result ) = 0 );
    return;
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryOfPermutationsWithProducts_precompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
