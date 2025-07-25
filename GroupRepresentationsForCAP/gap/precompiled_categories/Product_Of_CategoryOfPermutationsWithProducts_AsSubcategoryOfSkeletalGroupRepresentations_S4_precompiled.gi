# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_Product_Of_CategoryOfPermutationsWithProducts_AsSubcategoryOfSkeletalGroupRepresentations_S4_precompiled", function ( cat )
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg3_1 );
    deduped_6_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg2_1 );
    deduped_5_1 := deduped_7_1[1];
    deduped_4_1 := deduped_6_1[1];
    hoisted_2_1 := deduped_7_1[3];
    hoisted_3_1 := List( [ 1 .. deduped_5_1 ], function ( n_2 )
            return hoisted_2_1[n_2];
        end );
    hoisted_1_1 := deduped_6_1[3];
    return deduped_4_1 = deduped_5_1 and deduped_6_1[2] = deduped_7_1[2] and ForAll( [ 1 .. deduped_4_1 ], function ( i_2 )
              return CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[CAP_JIT_INCOMPLETE_LOGIC( i_2 )] ) = hoisted_3_1[i_2];
          end );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.IsEqualForObjects :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg3_1 );
    deduped_8_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg2_1 );
    deduped_7_1 := deduped_9_1[1];
    deduped_6_1 := deduped_8_1[1];
    deduped_5_1 := [ 1 .. deduped_6_1 ];
    hoisted_3_1 := deduped_9_1[3];
    hoisted_4_1 := List( [ 1 .. deduped_7_1 ], function ( n_2 )
            return hoisted_3_1[n_2];
        end );
    hoisted_1_1 := deduped_8_1[3];
    hoisted_2_1 := List( deduped_5_1, function ( n_2 )
            return hoisted_1_1[n_2];
        end );
    return deduped_6_1 = deduped_7_1 and deduped_8_1[2] = deduped_9_1[2] and ForAll( deduped_5_1, function ( i_2 )
              return hoisted_2_1[i_2] = hoisted_4_1[i_2];
          end );
end
########
        
    ;
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfListOfColumns( arg3_1 );
    deduped_6_1 := TripleOfNrSupportListOfSupportListOfListOfColumns( arg2_1 );
    deduped_5_1 := deduped_7_1[1];
    deduped_4_1 := deduped_6_1[1];
    hoisted_2_1 := deduped_7_1[3];
    hoisted_3_1 := List( [ 1 .. deduped_5_1 ], function ( n_2 )
            return hoisted_2_1[n_2];
        end );
    hoisted_1_1 := deduped_6_1[3];
    return deduped_4_1 = deduped_5_1 and deduped_6_1[2] = deduped_7_1[2] and ForAll( [ 1 .. deduped_4_1 ], function ( i_2 )
              return CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[CAP_JIT_INCOMPLETE_LOGIC( i_2 )] ) = hoisted_3_1[i_2];
          end );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.IsEqualForMorphisms :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := TripleOfNrSupportListOfSupportListOfListOfColumns( arg3_1 );
    deduped_8_1 := TripleOfNrSupportListOfSupportListOfListOfColumns( arg2_1 );
    deduped_7_1 := deduped_9_1[1];
    deduped_6_1 := deduped_8_1[1];
    deduped_5_1 := [ 1 .. deduped_6_1 ];
    hoisted_3_1 := deduped_9_1[3];
    hoisted_4_1 := List( [ 1 .. deduped_7_1 ], function ( n_2 )
            return hoisted_3_1[n_2];
        end );
    hoisted_1_1 := deduped_8_1[3];
    hoisted_2_1 := List( deduped_5_1, function ( n_2 )
            return hoisted_1_1[n_2];
        end );
    return deduped_6_1 = deduped_7_1 and deduped_8_1[2] = deduped_9_1[2] and ForAll( deduped_5_1, function ( i_2 )
              return hoisted_2_1[i_2] = hoisted_4_1[i_2];
          end );
end
########
        
    ;
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg2_1 );
    deduped_7_1 := deduped_8_1[2];
    deduped_6_1 := deduped_8_1[1];
    deduped_5_1 := [ 1 .. deduped_6_1 ];
    hoisted_3_1 := deduped_8_1[3];
    deduped_4_1 := List( deduped_5_1, function ( n_2 )
            return hoisted_3_1[n_2];
        end );
    hoisted_1_1 := NrIrreducibleCharacters( cat_1 );
    if deduped_6_1 <> Length( deduped_7_1 ) or deduped_6_1 <> deduped_6_1 then
        return false;
    elif not ForAll( deduped_7_1, function ( n_2 )
                 return 1 <= n_2 and n_2 <= hoisted_1_1;
             end ) then
        return false;
    elif not ForAll( [ 1 .. deduped_6_1 - 1 ], function ( n_2 )
                 return deduped_7_1[n_2] < deduped_7_1[n_2 + 1];
             end ) then
        return false;
    elif not ForAll( deduped_5_1, function ( n_2 )
                 return 0 <= deduped_4_1[n_2];
             end ) then
        return false;
    elif ForAny( deduped_5_1, function ( n_2 )
              return deduped_4_1[n_2] = 0;
          end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_4_1, deduped_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1;
    deduped_15_1 := TripleOfNrSupportListOfSupportListOfListOfColumns( alpha_1 );
    deduped_14_1 := TripleOfNrSupportListOfSupportListOfNumberElements( Source( alpha_1 ) );
    deduped_13_1 := deduped_15_1[3];
    deduped_12_1 := deduped_15_1[2];
    deduped_11_1 := deduped_15_1[1];
    deduped_10_1 := [ 1 .. deduped_11_1 ];
    hoisted_9_1 := List( deduped_13_1, function ( logic_new_func_list_2 )
            return Sum( List( logic_new_func_list_2, function ( col_3 )
                      return col_3[2] - col_3[1] + 1;
                  end ) );
        end );
    hoisted_7_1 := [ 0 ];
    hoisted_4_1 := deduped_14_1[3];
    hoisted_6_1 := List( [ 1 .. deduped_14_1[1] ], function ( n_2 )
            return hoisted_4_1[n_2];
        end );
    deduped_5_1 := deduped_14_1[2];
    deduped_8_1 := List( deduped_10_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_12_1[n_2];
            return [ hoisted_7_1, hoisted_6_1{Positions( deduped_5_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_5_1 ) + 1][1];
        end );
    hoisted_1_1 := NrIrreducibleCharacters( cat_1 );
    if deduped_11_1 <> Length( deduped_12_1 ) or deduped_11_1 <> deduped_11_1 then
        return false;
    elif not ForAll( deduped_12_1, function ( n_2 )
                 return 1 <= n_2 and n_2 <= hoisted_1_1;
             end ) then
        return false;
    elif not ForAll( [ 1 .. deduped_11_1 - 1 ], function ( n_2 )
                 return deduped_12_1[n_2] < deduped_12_1[n_2 + 1];
             end ) then
        return false;
    elif not ForAll( deduped_10_1, function ( n_2 )
                 local deduped_1_2, deduped_2_2;
                 deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_13_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] );
                 deduped_1_2 := deduped_8_1[n_2];
                 if not ForAll( deduped_2_2, function ( col_3 )
                              return 1 <= col_3[1] and 1 <= col_3[2];
                          end ) then
                     return false;
                 elif not ForAll( deduped_2_2, function ( col_3 )
                              return col_3[1] <= col_3[2];
                          end ) then
                     return false;
                 elif not ForAll( deduped_2_2, function ( pair_3 )
                              return pair_3[1] <= deduped_1_2 and pair_3[2] <= deduped_1_2;
                          end ) then
                     return false;
                 elif not true then
                     return false;
                 else
                     return true;
                 fi;
                 return;
             end ) then
        return false;
    elif ForAny( deduped_10_1, function ( n_2 )
              return deduped_8_1[n_2] = 0 and CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] ) = 0;
          end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.IsWellDefinedForMorphisms :=
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1;
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfListOfColumns( alpha_1 );
    deduped_16_1 := TripleOfNrSupportListOfSupportListOfNumberElements( Source( alpha_1 ) );
    deduped_15_1 := deduped_17_1[3];
    deduped_14_1 := deduped_17_1[2];
    deduped_13_1 := deduped_17_1[1];
    deduped_12_1 := [ 1 .. deduped_13_1 ];
    hoisted_10_1 := List( deduped_15_1, function ( logic_new_func_list_2 )
            return Sum( List( logic_new_func_list_2, function ( col_3 )
                      return col_3[2] - col_3[1] + 1;
                  end ) );
        end );
    hoisted_11_1 := List( deduped_12_1, function ( n_2 )
            return hoisted_10_1[n_2];
        end );
    hoisted_8_1 := [ 0 ];
    hoisted_5_1 := deduped_16_1[3];
    hoisted_7_1 := List( [ 1 .. deduped_16_1[1] ], function ( n_2 )
            return hoisted_5_1[n_2];
        end );
    deduped_6_1 := deduped_16_1[2];
    deduped_9_1 := List( deduped_12_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_14_1[n_2];
            return [ hoisted_8_1, hoisted_7_1{Positions( deduped_6_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_6_1 ) + 1][1];
        end );
    hoisted_4_1 := List( deduped_12_1, function ( n_2 )
            return deduped_15_1[n_2];
        end );
    hoisted_1_1 := NrIrreducibleCharacters( cat_1 );
    if deduped_13_1 <> Length( deduped_14_1 ) or deduped_13_1 <> deduped_13_1 then
        return false;
    elif not ForAll( deduped_14_1, function ( n_2 )
                 return 1 <= n_2 and n_2 <= hoisted_1_1;
             end ) then
        return false;
    elif not ForAll( [ 1 .. deduped_13_1 - 1 ], function ( n_2 )
                 return deduped_14_1[n_2] < deduped_14_1[n_2 + 1];
             end ) then
        return false;
    elif not ForAll( deduped_12_1, function ( n_2 )
                 local deduped_1_2, deduped_2_2;
                 deduped_2_2 := hoisted_4_1[n_2];
                 deduped_1_2 := deduped_9_1[n_2];
                 if not ForAll( deduped_2_2, function ( col_3 )
                              return 1 <= col_3[1] and 1 <= col_3[2];
                          end ) then
                     return false;
                 elif not ForAll( deduped_2_2, function ( col_3 )
                              return col_3[1] <= col_3[2];
                          end ) then
                     return false;
                 elif not ForAll( deduped_2_2, function ( pair_3 )
                              return pair_3[1] <= deduped_1_2 and pair_3[2] <= deduped_1_2;
                          end ) then
                     return false;
                 elif not true then
                     return false;
                 else
                     return true;
                 fi;
                 return;
             end ) then
        return false;
    elif ForAny( deduped_12_1, function ( n_2 )
              return deduped_9_1[n_2] = 0 and hoisted_11_1[n_2] = 0;
          end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    ;
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfNumberElements, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, TripleOfNrSupportListOfSupportListOfListOfColumns, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return TripleOfNrSupportListOfSupportListOfNumberElements( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return TripleOfNrSupportListOfSupportListOfListOfColumns( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := TripleOfNrSupportListOfSupportListOfNumberElements( a_1 );
    deduped_3_1 := deduped_4_1[1];
    hoisted_2_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    hoisted_1_1 := deduped_4_1[3];
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_3_1, deduped_4_1[2], List( [ 1 .. deduped_3_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] );
                return CAP_JIT_INCOMPLETE_LOGIC( [ [ NTuple( 2, 1, deduped_1_2 ) ], hoisted_2_1 ][BooleanToInteger( deduped_1_2 = 0 ) + 1] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.IdentityMorphism :=
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfNumberElements( a_1 );
    deduped_6_1 := deduped_7_1[1];
    deduped_5_1 := [ 1 .. deduped_6_1 ];
    hoisted_3_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    hoisted_1_1 := deduped_7_1[3];
    hoisted_2_1 := List( deduped_5_1, function ( n_2 )
            return hoisted_1_1[n_2];
        end );
    hoisted_4_1 := List( deduped_5_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := hoisted_2_1[n_2];
            return [ [ NTuple( 2, 1, deduped_1_2 ) ], hoisted_3_1 ][BooleanToInteger( deduped_1_2 = 0 ) + 1];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_6_1, deduped_7_1[2], List( deduped_5_1, function ( n_2 )
                return hoisted_4_1[n_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1;
    deduped_1_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsInt ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfNumberElements, NTuple( 3, 0, deduped_1_1, deduped_1_1 ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := TripleOfNrSupportListOfSupportListOfNumberElements( T_1 );
    deduped_4_1 := deduped_5_1[2];
    deduped_3_1 := Length( deduped_4_1 );
    hoisted_1_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    hoisted_2_1 := List( [ 1 .. deduped_5_1[1] ], function ( i_2 )
            return hoisted_1_1;
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_3_1, deduped_4_1, List( [ 1 .. deduped_3_1 ], function ( n_2 )
                return hoisted_2_1[n_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, objects_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := Union( List( objects_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfNumberElements( x_2 )[2];
          end ) );
    deduped_3_1 := Length( deduped_4_1 );
    hoisted_2_1 := [ 0 ];
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfNumberElements, NTuple( 3, deduped_3_1, deduped_4_1, List( [ 1 .. deduped_3_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_4_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( objects_1, function ( x_3 )
                            local hoisted_1_3, deduped_2_3, deduped_3_3;
                            deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                            deduped_2_3 := deduped_3_3[2];
                            hoisted_1_3 := deduped_3_3[3];
                            return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                              return hoisted_1_3[n_4];
                                          end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectProduct :=
        
########
function ( cat_1, objects_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Union( List( objects_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfNumberElements( x_2 )[2];
          end ) );
    deduped_5_1 := Length( deduped_6_1 );
    deduped_4_1 := [ 1 .. deduped_5_1 ];
    hoisted_2_1 := [ 0 ];
    hoisted_3_1 := List( deduped_4_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_6_1[n_2];
            return Sum( List( objects_1, function ( x_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3;
                      deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                      deduped_2_3 := deduped_3_3[2];
                      hoisted_1_3 := deduped_3_3[3];
                      return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                        return hoisted_1_3[n_4];
                                    end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                  end ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfNumberElements, NTuple( 3, deduped_5_1, deduped_6_1, List( deduped_4_1, function ( n_2 )
                return hoisted_3_1[n_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfNumberElements( P_1 );
    deduped_6_1 := deduped_7_1[2];
    deduped_5_1 := deduped_7_1[1];
    hoisted_4_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := [ 0 ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_5_1, deduped_6_1, List( [ 1 .. deduped_5_1 ], function ( n_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_1_2 := deduped_6_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                deduped_4_2 := List( objects_1, function ( x_3 )
                        local hoisted_1_3, deduped_2_3, deduped_3_3;
                        deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                        deduped_2_3 := deduped_3_3[2];
                        hoisted_1_3 := deduped_3_3[3];
                        return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                          return hoisted_1_3[n_4];
                                      end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                    end );
                deduped_3_2 := deduped_4_2[k_1];
                deduped_2_2 := Sum( deduped_4_2{hoisted_3_1} );
                return CAP_JIT_INCOMPLETE_LOGIC( [ [ NTuple( 2, deduped_2_2 + 1, deduped_2_2 + deduped_3_2 ) ], hoisted_4_1 ][BooleanToInteger( deduped_3_2 = 0 ) + 1] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ProjectionInFactorOfDirectProductWithGivenDirectProduct :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := TripleOfNrSupportListOfSupportListOfNumberElements( P_1 );
    deduped_8_1 := deduped_9_1[2];
    deduped_7_1 := deduped_9_1[1];
    deduped_6_1 := [ 1 .. deduped_7_1 ];
    hoisted_4_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := [ 0 ];
    hoisted_5_1 := List( deduped_6_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
            deduped_1_2 := deduped_8_1[i_2];
            deduped_4_2 := List( objects_1, function ( x_3 )
                    local hoisted_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                    deduped_2_3 := deduped_3_3[2];
                    hoisted_1_3 := deduped_3_3[3];
                    return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                      return hoisted_1_3[n_4];
                                  end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                end );
            deduped_3_2 := deduped_4_2[k_1];
            deduped_2_2 := Sum( deduped_4_2{hoisted_3_1} );
            return [ [ NTuple( 2, deduped_2_2 + 1, deduped_2_2 + deduped_3_2 ) ], hoisted_4_1 ][BooleanToInteger( deduped_3_2 = 0 ) + 1];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_7_1, deduped_8_1, List( deduped_6_1, function ( n_2 )
                return hoisted_5_1[n_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := Union2( TripleOfNrSupportListOfSupportListOfNumberElements( T_1 )[2], TripleOfNrSupportListOfSupportListOfNumberElements( P_1 )[2] );
    deduped_3_1 := Length( deduped_4_1 );
    hoisted_2_1 := [ CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsNTuple,
                        element_types := [ rec(
                                filter := IsInt ), rec(
                                filter := IsInt ) ] ) );
            end ) ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_3_1, deduped_4_1, List( [ 1 .. deduped_3_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_4_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( tau_1, function ( x_3 )
                            local hoisted_1_3, deduped_2_3, deduped_3_3;
                            deduped_3_3 := TripleOfNrSupportListOfSupportListOfListOfColumns( x_3 );
                            deduped_2_3 := deduped_3_3[2];
                            hoisted_1_3 := deduped_3_3[3];
                            return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                              return hoisted_1_3[n_4];
                                          end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismIntoDirectProductWithGivenDirectProduct :=
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Union2( TripleOfNrSupportListOfSupportListOfNumberElements( T_1 )[2], TripleOfNrSupportListOfSupportListOfNumberElements( P_1 )[2] );
    deduped_5_1 := Length( deduped_6_1 );
    deduped_4_1 := [ 1 .. deduped_5_1 ];
    hoisted_2_1 := [ CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsNTuple,
                        element_types := [ rec(
                                filter := IsInt ), rec(
                                filter := IsInt ) ] ) );
            end ) ];
    hoisted_3_1 := List( deduped_4_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_6_1[n_2];
            return Concatenation( List( tau_1, function ( x_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3;
                      deduped_3_3 := TripleOfNrSupportListOfSupportListOfListOfColumns( x_3 );
                      deduped_2_3 := deduped_3_3[2];
                      hoisted_1_3 := deduped_3_3[3];
                      return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                        return hoisted_1_3[n_4];
                                    end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_5_1, deduped_6_1, List( deduped_4_1, function ( n_2 )
                return hoisted_3_1[n_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Union( List( L_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfListOfColumns( x_2 )[2];
          end ) );
    deduped_5_1 := Length( deduped_6_1 );
    hoisted_4_1 := [ 1 .. Length( L_1 ) ];
    hoisted_3_1 := [ CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsList,
                        element_type := rec(
                            filter := IsNTuple,
                            element_types := [ rec(
                                    filter := IsInt ), rec(
                                    filter := IsInt ) ] ) ) );
            end ) ];
    hoisted_2_1 := [ 0 ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_5_1, deduped_6_1, List( [ 1 .. deduped_5_1 ], function ( n_2 )
                local deduped_1_2, hoisted_2_2;
                deduped_1_2 := deduped_6_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                hoisted_2_2 := List( objects_1, function ( x_3 )
                        local hoisted_1_3, deduped_2_3, deduped_3_3;
                        deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                        deduped_2_3 := deduped_3_3[2];
                        hoisted_1_3 := deduped_3_3[3];
                        return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                          return hoisted_1_3[n_4];
                                      end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                    end );
                return CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( hoisted_4_1, function ( i_3 )
                            local hoisted_1_3, hoisted_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := TripleOfNrSupportListOfSupportListOfListOfColumns( CAP_JIT_INCOMPLETE_LOGIC( L_1[i_3] ) );
                            deduped_3_3 := deduped_4_3[2];
                            hoisted_1_3 := Sum( List( [ 1 .. i_3 - 1 ], function ( j_4 )
                                      return hoisted_2_2[j_4];
                                  end ) );
                            hoisted_2_3 := List( deduped_4_3[3], function ( logic_new_func_list_4 )
                                    return List( logic_new_func_list_4, function ( col_5 )
                                            return col_5 + hoisted_1_3;
                                        end );
                                end );
                            return CAP_JIT_INCOMPLETE_LOGIC( [ hoisted_3_1, List( [ 1 .. deduped_4_3[1] ], function ( n_4 )
                                                return hoisted_2_3[n_4];
                                            end ){Positions( deduped_3_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_3_3 ) + 1][1] );
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectProductFunctorialWithGivenDirectProducts :=
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Union( List( L_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfListOfColumns( x_2 )[2];
          end ) );
    deduped_7_1 := Length( deduped_8_1 );
    deduped_6_1 := [ 1 .. deduped_7_1 ];
    hoisted_4_1 := [ 1 .. Length( L_1 ) ];
    hoisted_3_1 := [ CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsList,
                        element_type := rec(
                            filter := IsNTuple,
                            element_types := [ rec(
                                    filter := IsInt ), rec(
                                    filter := IsInt ) ] ) ) );
            end ) ];
    hoisted_2_1 := [ 0 ];
    hoisted_5_1 := List( deduped_6_1, function ( n_2 )
            local deduped_1_2, hoisted_2_2;
            deduped_1_2 := deduped_8_1[n_2];
            hoisted_2_2 := List( objects_1, function ( x_3 )
                    local hoisted_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                    deduped_2_3 := deduped_3_3[2];
                    hoisted_1_3 := deduped_3_3[3];
                    return [ hoisted_2_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                      return hoisted_1_3[n_4];
                                  end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                end );
            return Concatenation( List( hoisted_4_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := Sum( List( [ 1 .. i_3 - 1 ], function ( j_4 )
                                return hoisted_2_2[j_4];
                            end ) );
                      return List( L_1, function ( x_4 )
                                local hoisted_1_4, deduped_2_4, deduped_3_4;
                                deduped_3_4 := TripleOfNrSupportListOfSupportListOfListOfColumns( x_4 );
                                deduped_2_4 := deduped_3_4[2];
                                hoisted_1_4 := List( deduped_3_4[3], function ( logic_new_func_list_5 )
                                        return List( logic_new_func_list_5, function ( col_6 )
                                                return col_6 + hoisted_1_3;
                                            end );
                                    end );
                                return [ hoisted_3_1, List( [ 1 .. deduped_3_4[1] ], function ( n_5 )
                                                  return hoisted_1_4[n_5];
                                              end ){Positions( deduped_2_4, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_4 ) + 1][1];
                            end )[i_3];
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_7_1, deduped_8_1, List( deduped_6_1, function ( n_2 )
                return hoisted_5_1[n_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, deduped_13_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1;
    deduped_22_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_21_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg3_1 );
    deduped_20_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg2_1 );
    deduped_19_1 := [ 1 .. deduped_21_1[1] ];
    deduped_18_1 := [ 1 .. deduped_20_1[1] ];
    deduped_7_1 := [ 1 .. Length( deduped_22_1 ) ];
    deduped_6_1 := [ 1 .. NrIrreducibleCharacters( cat_1 ) ];
    deduped_4_1 := deduped_21_1[2];
    deduped_3_1 := deduped_20_1[2];
    deduped_17_1 := Union( List( deduped_18_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_3_1[i_2];
              return Union( List( deduped_19_1, function ( j_3 )
                        local hoisted_1_3, hoisted_2_3;
                        hoisted_1_3 := deduped_4_1[j_3];
                        hoisted_2_3 := List( deduped_6_1, function ( k_4 )
                                return IsZero( SGREPS_ScalarProduct( deduped_22_1, k_4, hoisted_1_2, hoisted_1_3 ) );
                            end );
                        return Filtered( deduped_7_1, function ( i_4 )
                                return not hoisted_2_3[i_4];
                            end );
                    end ) );
          end ) );
    deduped_16_1 := Length( deduped_17_1 );
    deduped_13_1 := [ 0 ];
    hoisted_11_1 := deduped_21_1[3];
    hoisted_12_1 := List( deduped_19_1, function ( n_2 )
            return hoisted_11_1[n_2];
        end );
    hoisted_9_1 := deduped_20_1[3];
    hoisted_10_1 := List( deduped_18_1, function ( n_2 )
            return hoisted_9_1[n_2];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfNumberElements, NTuple( 3, deduped_16_1, deduped_17_1, List( [ 1 .. deduped_16_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_17_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_18_1, function ( i_3 )
                            local deduped_1_3, hoisted_2_3, deduped_4_3;
                            deduped_1_3 := deduped_3_1[i_3];
                            deduped_4_3 := Union( List( deduped_19_1, function ( j_4 )
                                      local hoisted_1_4, hoisted_2_4;
                                      hoisted_1_4 := deduped_4_1[j_4];
                                      hoisted_2_4 := List( deduped_6_1, function ( k_5 )
                                              return IsZero( SGREPS_ScalarProduct( deduped_22_1, k_5, deduped_1_3, hoisted_1_4 ) );
                                          end );
                                      return Filtered( deduped_7_1, function ( i_5 )
                                              return not hoisted_2_4[i_5];
                                          end );
                                  end ) );
                            hoisted_2_3 := hoisted_10_1[i_3];
                            return [ deduped_13_1, List( [ 1 .. Length( deduped_4_3 ) ], function ( n_4 )
                                              local deduped_1_4;
                                              deduped_1_4 := deduped_4_3[CAP_JIT_INCOMPLETE_LOGIC( n_4 )];
                                              return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_19_1, function ( j_5 )
                                                          local deduped_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5, deduped_5_5;
                                                          deduped_1_5 := deduped_4_1[j_5];
                                                          hoisted_2_5 := List( deduped_6_1, function ( k_6 )
                                                                  return IsZero( SGREPS_ScalarProduct( deduped_22_1, k_6, deduped_1_3, deduped_1_5 ) );
                                                              end );
                                                          deduped_5_5 := Filtered( deduped_7_1, function ( i_6 )
                                                                  return not hoisted_2_5[i_6];
                                                              end );
                                                          hoisted_4_5 := hoisted_2_3 * hoisted_12_1[j_5];
                                                          hoisted_3_5 := List( deduped_6_1, function ( k_6 )
                                                                    return SGREPS_ScalarProduct( deduped_22_1, k_6, deduped_1_3, deduped_1_5 );
                                                                end ){deduped_5_5};
                                                          return [ deduped_13_1, List( [ 1 .. Length( deduped_5_5 ) ], function ( n_6 )
                                                                            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_5[CAP_JIT_INCOMPLETE_LOGIC( n_6 )] * hoisted_4_5 );
                                                                        end ){Positions( deduped_5_5, deduped_1_4 )} ][BooleanToInteger( deduped_1_4 in deduped_5_5 ) + 1][1];
                                                      end ) ) );
                                          end ){Positions( deduped_4_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_4_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.TensorProductOnObjects :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, deduped_13_1, hoisted_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1;
    deduped_24_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_23_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg3_1 );
    deduped_22_1 := TripleOfNrSupportListOfSupportListOfNumberElements( arg2_1 );
    deduped_21_1 := [ 1 .. deduped_23_1[1] ];
    deduped_20_1 := [ 1 .. deduped_22_1[1] ];
    deduped_7_1 := [ 1 .. Length( deduped_24_1 ) ];
    deduped_6_1 := [ 1 .. NrIrreducibleCharacters( cat_1 ) ];
    deduped_4_1 := deduped_23_1[2];
    deduped_3_1 := deduped_22_1[2];
    deduped_19_1 := Union( List( deduped_20_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_3_1[i_2];
              return Union( List( deduped_21_1, function ( j_3 )
                        local hoisted_1_3, hoisted_2_3;
                        hoisted_1_3 := deduped_4_1[j_3];
                        hoisted_2_3 := List( deduped_6_1, function ( k_4 )
                                return IsZero( SGREPS_ScalarProduct( deduped_24_1, k_4, hoisted_1_2, hoisted_1_3 ) );
                            end );
                        return Filtered( deduped_7_1, function ( i_4 )
                                return not hoisted_2_3[i_4];
                            end );
                    end ) );
          end ) );
    deduped_18_1 := Length( deduped_19_1 );
    deduped_17_1 := [ 1 .. deduped_18_1 ];
    deduped_13_1 := [ 0 ];
    hoisted_11_1 := deduped_23_1[3];
    hoisted_12_1 := List( deduped_21_1, function ( n_2 )
            return hoisted_11_1[n_2];
        end );
    hoisted_9_1 := deduped_22_1[3];
    hoisted_10_1 := List( deduped_20_1, function ( n_2 )
            return hoisted_9_1[n_2];
        end );
    hoisted_16_1 := List( deduped_17_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_19_1[n_2];
            return Sum( List( deduped_20_1, function ( i_3 )
                      local deduped_1_3, hoisted_2_3, hoisted_4_3, hoisted_5_3, deduped_6_3, deduped_7_3;
                      deduped_1_3 := deduped_3_1[i_3];
                      deduped_7_3 := Union( List( deduped_21_1, function ( j_4 )
                                local hoisted_1_4, hoisted_2_4;
                                hoisted_1_4 := deduped_4_1[j_4];
                                hoisted_2_4 := List( deduped_6_1, function ( k_5 )
                                        return IsZero( SGREPS_ScalarProduct( deduped_24_1, k_5, deduped_1_3, hoisted_1_4 ) );
                                    end );
                                return Filtered( deduped_7_1, function ( i_5 )
                                        return not hoisted_2_4[i_5];
                                    end );
                            end ) );
                      deduped_6_3 := [ 1 .. Length( deduped_7_3 ) ];
                      hoisted_2_3 := hoisted_10_1[i_3];
                      hoisted_4_3 := List( deduped_6_3, function ( n_4 )
                              local deduped_1_4;
                              deduped_1_4 := deduped_7_3[n_4];
                              return Sum( List( deduped_21_1, function ( j_5 )
                                        local deduped_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5, hoisted_5_5, hoisted_6_5, deduped_7_5, deduped_8_5;
                                        deduped_1_5 := deduped_4_1[j_5];
                                        hoisted_2_5 := List( deduped_6_1, function ( k_6 )
                                                return IsZero( SGREPS_ScalarProduct( deduped_24_1, k_6, deduped_1_3, deduped_1_5 ) );
                                            end );
                                        deduped_8_5 := Filtered( deduped_7_1, function ( i_6 )
                                                return not hoisted_2_5[i_6];
                                            end );
                                        deduped_7_5 := [ 1 .. Length( deduped_8_5 ) ];
                                        hoisted_4_5 := hoisted_2_3 * hoisted_12_1[j_5];
                                        hoisted_3_5 := List( deduped_6_1, function ( k_6 )
                                                  return SGREPS_ScalarProduct( deduped_24_1, k_6, deduped_1_3, deduped_1_5 );
                                              end ){deduped_8_5};
                                        hoisted_5_5 := List( deduped_7_5, function ( n_6 )
                                                return hoisted_3_5[n_6] * hoisted_4_5;
                                            end );
                                        hoisted_6_5 := List( deduped_7_5, function ( n_6 )
                                                return hoisted_5_5[n_6];
                                            end );
                                        return [ deduped_13_1, List( deduped_7_5, function ( n_6 )
                                                          return hoisted_6_5[n_6];
                                                      end ){Positions( deduped_8_5, deduped_1_4 )} ][BooleanToInteger( deduped_1_4 in deduped_8_5 ) + 1][1];
                                    end ) );
                          end );
                      hoisted_5_3 := List( deduped_6_3, function ( n_4 )
                              return hoisted_4_3[n_4];
                          end );
                      return [ deduped_13_1, List( deduped_6_3, function ( n_4 )
                                        return hoisted_5_3[n_4];
                                    end ){Positions( deduped_7_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_7_3 ) + 1][1];
                  end ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfNumberElements, NTuple( 3, deduped_18_1, deduped_19_1, List( deduped_17_1, function ( n_2 )
                return hoisted_16_1[n_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddRightDistributivityExpandingWithGivenObjects( cat,
        
########
function ( cat_1, s_1, L_1, a_1, r_1 )
    local deduped_1_1, deduped_3_1, deduped_4_1, hoisted_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_15_1, hoisted_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, hoisted_22_1, hoisted_23_1, hoisted_25_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1;
    deduped_38_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    deduped_37_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_36_1 := TripleOfNrSupportListOfSupportListOfNumberElements( a_1 );
    deduped_35_1 := [ 1 .. Length( L_1 ) ];
    deduped_34_1 := deduped_36_1[1];
    deduped_33_1 := TripleOfNrSupportListOfSupportListOfNumberElements( s_1 )[2];
    deduped_32_1 := [ 1 .. deduped_34_1 ];
    deduped_31_1 := Union2( deduped_33_1, TripleOfNrSupportListOfSupportListOfNumberElements( r_1 )[2] );
    deduped_30_1 := Length( deduped_31_1 );
    deduped_29_1 := Union( List( L_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfNumberElements( x_2 )[2];
          end ) );
    deduped_28_1 := Length( deduped_29_1 );
    deduped_27_1 := [ 1 .. deduped_28_1 ];
    hoisted_25_1 := [ deduped_38_1 ];
    deduped_8_1 := [ 0 ];
    hoisted_22_1 := NTuple( 3, deduped_28_1, deduped_29_1, List( deduped_27_1, function ( n_2 )
              local deduped_1_2;
              deduped_1_2 := deduped_29_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
              return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( L_1, function ( x_3 )
                          local hoisted_1_3, deduped_2_3, deduped_3_3;
                          deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                          deduped_2_3 := deduped_3_3[2];
                          hoisted_1_3 := deduped_3_3[3];
                          return [ deduped_8_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                            return hoisted_1_3[n_4];
                                        end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                      end ) ) );
          end ) );
    hoisted_23_1 := List( deduped_35_1, function ( i_2 )
            return hoisted_22_1;
        end );
    hoisted_6_1 := deduped_36_1[3];
    deduped_7_1 := List( deduped_32_1, function ( n_2 )
            return hoisted_6_1[n_2];
        end );
    deduped_1_1 := deduped_36_1[2];
    deduped_21_1 := List( deduped_32_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_1_1[n_2];
            return [ deduped_8_1, deduped_7_1{Positions( deduped_1_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_1_1 ) + 1][1];
        end );
    deduped_18_1 := List( deduped_32_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_7_1[n_2];
            return [ [ NTuple( 2, 1, deduped_1_2 ) ], deduped_38_1 ][BooleanToInteger( deduped_1_2 = 0 ) + 1];
        end );
    deduped_20_1 := List( deduped_32_1, function ( n_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_18_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] );
        end );
    deduped_19_1 := List( deduped_32_1, function ( n_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( Length( deduped_18_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] ) );
        end );
    hoisted_17_1 := [ 1, 0 ];
    hoisted_15_1 := List( deduped_35_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := [ 1 .. i_2 - 1 ];
            return NTuple( 3, deduped_28_1, deduped_29_1, List( deduped_27_1, function ( n_3 )
                      local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                      deduped_1_3 := deduped_29_1[CAP_JIT_INCOMPLETE_LOGIC( n_3 )];
                      deduped_4_3 := List( L_1, function ( x_4 )
                              local hoisted_1_4, deduped_2_4, deduped_3_4;
                              deduped_3_4 := TripleOfNrSupportListOfSupportListOfNumberElements( x_4 );
                              deduped_2_4 := deduped_3_4[2];
                              hoisted_1_4 := deduped_3_4[3];
                              return [ deduped_8_1, List( [ 1 .. deduped_3_4[1] ], function ( n_5 )
                                                return hoisted_1_4[n_5];
                                            end ){Positions( deduped_2_4, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_2_4 ) + 1][1];
                          end );
                      deduped_3_3 := deduped_4_3[i_2];
                      deduped_2_3 := Sum( deduped_4_3{hoisted_1_2} );
                      return CAP_JIT_INCOMPLETE_LOGIC( [ [ NTuple( 2, deduped_2_3 + 1, deduped_2_3 + deduped_3_3 ) ], deduped_38_1 ][BooleanToInteger( deduped_3_3 = 0 ) + 1] );
                  end ) );
        end );
    deduped_4_1 := [ 1 .. Length( deduped_37_1 ) ];
    deduped_3_1 := [ 1 .. NrIrreducibleCharacters( cat_1 ) ];
    hoisted_9_1 := List( L_1, function ( summand_2 )
            local deduped_1_2, hoisted_2_2, hoisted_3_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2;
            deduped_9_2 := TripleOfNrSupportListOfSupportListOfNumberElements( summand_2 );
            deduped_8_2 := [ 1 .. deduped_9_2[1] ];
            deduped_1_2 := deduped_9_2[2];
            deduped_7_2 := Union( List( deduped_8_2, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_1_2[i_3];
                      return Union( List( deduped_32_1, function ( j_4 )
                                local hoisted_1_4, hoisted_2_4;
                                hoisted_1_4 := deduped_1_1[j_4];
                                hoisted_2_4 := List( deduped_3_1, function ( k_5 )
                                        return IsZero( SGREPS_ScalarProduct( deduped_37_1, k_5, hoisted_1_3, hoisted_1_4 ) );
                                    end );
                                return Filtered( deduped_4_1, function ( i_5 )
                                        return not hoisted_2_4[i_5];
                                    end );
                            end ) );
                  end ) );
            deduped_6_2 := Length( deduped_7_2 );
            hoisted_2_2 := deduped_9_2[3];
            hoisted_3_2 := List( deduped_8_2, function ( n_3 )
                    return hoisted_2_2[n_3];
                end );
            return NTuple( 3, deduped_6_2, deduped_7_2, List( [ 1 .. deduped_6_2 ], function ( n_3 )
                      local deduped_1_3;
                      deduped_1_3 := deduped_7_2[CAP_JIT_INCOMPLETE_LOGIC( n_3 )];
                      return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_8_2, function ( i_4 )
                                  local deduped_1_4, hoisted_2_4, deduped_4_4;
                                  deduped_1_4 := deduped_1_2[i_4];
                                  deduped_4_4 := Union( List( deduped_32_1, function ( j_5 )
                                            local hoisted_1_5, hoisted_2_5;
                                            hoisted_1_5 := deduped_1_1[j_5];
                                            hoisted_2_5 := List( deduped_3_1, function ( k_6 )
                                                    return IsZero( SGREPS_ScalarProduct( deduped_37_1, k_6, deduped_1_4, hoisted_1_5 ) );
                                                end );
                                            return Filtered( deduped_4_1, function ( i_6 )
                                                    return not hoisted_2_5[i_6];
                                                end );
                                        end ) );
                                  hoisted_2_4 := hoisted_3_2[i_4];
                                  return [ deduped_8_1, List( [ 1 .. Length( deduped_4_4 ) ], function ( n_5 )
                                                    local deduped_1_5;
                                                    deduped_1_5 := deduped_4_4[CAP_JIT_INCOMPLETE_LOGIC( n_5 )];
                                                    return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_32_1, function ( j_6 )
                                                                local deduped_1_6, hoisted_2_6, hoisted_3_6, hoisted_4_6, deduped_5_6;
                                                                deduped_1_6 := deduped_1_1[j_6];
                                                                hoisted_2_6 := List( deduped_3_1, function ( k_7 )
                                                                        return IsZero( SGREPS_ScalarProduct( deduped_37_1, k_7, deduped_1_4, deduped_1_6 ) );
                                                                    end );
                                                                deduped_5_6 := Filtered( deduped_4_1, function ( i_7 )
                                                                        return not hoisted_2_6[i_7];
                                                                    end );
                                                                hoisted_4_6 := hoisted_2_4 * deduped_7_1[j_6];
                                                                hoisted_3_6 := List( deduped_3_1, function ( k_7 )
                                                                          return SGREPS_ScalarProduct( deduped_37_1, k_7, deduped_1_4, deduped_1_6 );
                                                                      end ){deduped_5_6};
                                                                return [ deduped_8_1, List( [ 1 .. Length( deduped_5_6 ) ], function ( n_7 )
                                                                                  return CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_6[CAP_JIT_INCOMPLETE_LOGIC( n_7 )] * hoisted_4_6 );
                                                                              end ){Positions( deduped_5_6, deduped_1_5 )} ][BooleanToInteger( deduped_1_5 in deduped_5_6 ) + 1][1];
                                                            end ) ) );
                                                end ){Positions( deduped_4_4, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_4_4 ) + 1][1];
                              end ) ) );
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_30_1, deduped_31_1, List( [ 1 .. deduped_30_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_31_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_35_1, function ( i_3 )
                            local deduped_3_3, hoisted_4_3, deduped_5_3, deduped_7_3, hoisted_8_3, hoisted_9_3, hoisted_10_3, deduped_11_3, hoisted_12_3, hoisted_13_3, deduped_15_3, deduped_16_3, deduped_17_3, deduped_18_3, deduped_19_3, deduped_20_3, deduped_21_3;
                            deduped_21_3 := hoisted_23_1[i_3];
                            deduped_20_3 := hoisted_15_1[i_3];
                            deduped_19_3 := deduped_20_3[3];
                            deduped_18_3 := [ 1 .. deduped_20_3[1] ];
                            deduped_17_3 := Union2( deduped_33_1, hoisted_9_1[i_3][2] );
                            deduped_16_3 := List( deduped_18_3, function ( i_4 )
                                    return deduped_34_1;
                                end );
                            deduped_15_3 := [ 1 .. deduped_16_3[1] ];
                            hoisted_10_3 := deduped_21_3[3];
                            hoisted_12_3 := List( [ 1 .. deduped_21_3[1] ], function ( n_4 )
                                    return hoisted_10_3[n_4];
                                end );
                            deduped_11_3 := deduped_21_3[2];
                            deduped_3_3 := deduped_20_3[2];
                            hoisted_13_3 := List( deduped_18_3, function ( i_4 )
                                    local hoisted_1_4, deduped_2_4;
                                    deduped_2_4 := deduped_3_3[CAP_JIT_INCOMPLETE_LOGIC( i_4 )];
                                    hoisted_1_4 := CAP_JIT_INCOMPLETE_LOGIC( [ deduped_8_1, hoisted_12_3{Positions( deduped_11_3, deduped_2_4 )} ][BooleanToInteger( deduped_2_4 in deduped_11_3 ) + 1][1] );
                                    return List( deduped_32_1, function ( j_5 )
                                            return hoisted_1_4 * deduped_21_1[j_5];
                                        end );
                                end );
                            deduped_7_3 := List( deduped_18_3, function ( n_4 )
                                    return deduped_19_3[n_4];
                                end );
                            hoisted_4_3 := List( deduped_19_3, Length );
                            deduped_5_3 := List( deduped_18_3, function ( n_4 )
                                    return hoisted_4_3[n_4];
                                end );
                            hoisted_9_3 := List( deduped_18_3, function ( i_4 )
                                    local deduped_1_4, deduped_2_4;
                                    deduped_2_4 := [ 1 .. deduped_5_3[i_4] ];
                                    deduped_1_4 := deduped_7_3[i_4];
                                    return List( deduped_32_1, function ( j_5 )
                                            local deduped_5_5, deduped_6_5, deduped_7_5, deduped_8_5, deduped_9_5;
                                            deduped_9_5 := deduped_21_1[j_5];
                                            deduped_8_5 := deduped_20_1[j_5];
                                            deduped_7_5 := deduped_8_5[1];
                                            deduped_6_5 := deduped_7_5[1];
                                            deduped_5_5 := deduped_7_5[2];
                                            if deduped_19_1[j_5] = 1 and deduped_5_5 - deduped_6_5 + 1 = deduped_9_5 then
                                                return List( deduped_2_4, function ( i_6 )
                                                        local deduped_1_6;
                                                        deduped_1_6 := deduped_1_4[i_6];
                                                        return NTuple( 2, deduped_6_5 + deduped_9_5 * (deduped_1_6[1] - 1), deduped_5_5 + deduped_9_5 * (deduped_1_6[2] - 1) );
                                                    end );
                                            else
                                                return Concatenation( List( deduped_2_4, function ( i_6 )
                                                          local deduped_1_6;
                                                          deduped_1_6 := deduped_1_4[i_6];
                                                          return Concatenation( List( [ deduped_1_6[1] .. deduped_1_6[2] ], function ( j_7 )
                                                                    return deduped_8_5 + deduped_9_5 * (j_7 - 1);
                                                                end ) );
                                                      end ) );
                                            fi;
                                            return;
                                        end );
                                end );
                            hoisted_8_3 := List( deduped_18_3, function ( i_4 )
                                    local hoisted_2_4, hoisted_3_4, deduped_4_4;
                                    deduped_4_4 := deduped_5_3[i_4];
                                    hoisted_3_4 := [ 1 .. deduped_4_4 ];
                                    hoisted_2_4 := deduped_7_3[i_4];
                                    return List( deduped_32_1, function ( j_5 )
                                            local deduped_3_5, deduped_4_5, deduped_5_5;
                                            deduped_5_5 := deduped_21_1[j_5];
                                            deduped_4_5 := deduped_20_1[j_5];
                                            deduped_3_5 := deduped_4_5[1];
                                            if deduped_19_1[j_5] = 1 and deduped_3_5[2] - deduped_3_5[1] + 1 = deduped_5_5 then
                                                return deduped_4_4;
                                            else
                                                return Sum( List( hoisted_3_4, function ( i_6 )
                                                          local deduped_1_6;
                                                          deduped_1_6 := hoisted_2_4[i_6];
                                                          return Sum( List( [ deduped_1_6[1] .. deduped_1_6[2] ], function ( j_7 )
                                                                    return Length( deduped_4_5 + deduped_5_5 * (j_7 - 1) );
                                                                end ) );
                                                      end ) );
                                            fi;
                                            return;
                                        end );
                                end );
                            return [ hoisted_25_1, List( [ 1 .. Length( deduped_17_3 ) ], function ( n_4 )
                                              local deduped_1_4, deduped_2_4, hoisted_3_4;
                                              deduped_1_4 := deduped_17_3[CAP_JIT_INCOMPLETE_LOGIC( n_4 )];
                                              deduped_2_4 := List( deduped_18_3, function ( i_5 )
                                                      local hoisted_1_5, hoisted_2_5;
                                                      hoisted_2_5 := deduped_3_3[i_5];
                                                      hoisted_1_5 := hoisted_13_3[i_5];
                                                      return List( deduped_32_1, function ( j_6 )
                                                              return hoisted_1_5[j_6] * SGREPS_ScalarProduct( deduped_37_1, deduped_1_4, hoisted_2_5, deduped_1_1[j_6] );
                                                          end );
                                                  end );
                                              hoisted_3_4 := List( deduped_18_3, function ( i_5 )
                                                      local hoisted_1_5;
                                                      hoisted_1_5 := deduped_2_4[CAP_JIT_INCOMPLETE_LOGIC( i_5 )];
                                                      return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_15_3, function ( j_6 )
                                                                  return hoisted_1_5[j_6];
                                                              end ) ) );
                                                  end );
                                              return CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_18_3, function ( i_5 )
                                                          local hoisted_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5, hoisted_5_5, hoisted_6_5, deduped_7_5;
                                                          deduped_7_5 := CAP_JIT_INCOMPLETE_LOGIC( i_5 );
                                                          hoisted_6_5 := Sum( List( [ 1 .. i_5 - 1 ], function ( j_6 )
                                                                    return hoisted_3_4[j_6];
                                                                end ) );
                                                          hoisted_4_5 := deduped_2_4[deduped_7_5];
                                                          hoisted_5_5 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_15_3, function ( j_6 )
                                                                    return hoisted_4_5[j_6];
                                                                end ) );
                                                          hoisted_3_5 := hoisted_9_3[deduped_7_5];
                                                          hoisted_2_5 := hoisted_8_3[deduped_7_5];
                                                          hoisted_1_5 := deduped_3_3[deduped_7_5];
                                                          return CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( [ 1 .. deduped_16_3[deduped_7_5] ], function ( i_6 )
                                                                      local deduped_1_6, hoisted_6_6, deduped_7_6, deduped_8_6, deduped_9_6, deduped_10_6, deduped_11_6, deduped_12_6, deduped_13_6, deduped_14_6;
                                                                      deduped_14_6 := CAP_JIT_INCOMPLETE_LOGIC( i_6 );
                                                                      deduped_13_6 := [ 1 .. hoisted_2_5[deduped_14_6] ];
                                                                      deduped_12_6 := SGREPS_ScalarProduct( deduped_37_1, deduped_1_4, hoisted_1_5, deduped_1_1[deduped_14_6] );
                                                                      deduped_11_6 := BooleanToInteger( deduped_12_6 = 0 ) + 1;
                                                                      deduped_10_6 := [ [ NTuple( 2, 1, deduped_12_6 ) ], deduped_38_1 ][deduped_11_6];
                                                                      deduped_9_6 := deduped_10_6[1];
                                                                      deduped_8_6 := deduped_9_6[1];
                                                                      deduped_7_6 := deduped_9_6[2];
                                                                      hoisted_6_6 := Sum( List( [ 1 .. i_6 - 1 ], function ( j_7 )
                                                                                return hoisted_5_5[j_7];
                                                                            end ) );
                                                                      deduped_1_6 := hoisted_3_5[deduped_14_6];
                                                                      return CAP_JIT_INCOMPLETE_LOGIC( List( CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                                                                    if hoisted_17_1[deduped_11_6] = 1 and deduped_7_6 - deduped_8_6 + 1 = deduped_12_6 then
                                                                                        return List( deduped_13_6, function ( i_8 )
                                                                                                local deduped_1_8;
                                                                                                deduped_1_8 := deduped_1_6[i_8];
                                                                                                return NTuple( 2, deduped_8_6 + deduped_12_6 * (deduped_1_8[1] - 1), deduped_7_6 + deduped_12_6 * (deduped_1_8[2] - 1) );
                                                                                            end );
                                                                                    else
                                                                                        return Concatenation( List( deduped_13_6, function ( i_8 )
                                                                                                  local deduped_1_8;
                                                                                                  deduped_1_8 := deduped_1_6[i_8];
                                                                                                  return Concatenation( List( [ deduped_1_8[1] .. deduped_1_8[2] ], function ( j_9 )
                                                                                                            return deduped_10_6 + deduped_12_6 * (j_9 - 1);
                                                                                                        end ) );
                                                                                              end ) );
                                                                                    fi;
                                                                                    return;
                                                                                end )(  ), function ( col_7 )
                                                                                return col_7 + hoisted_6_6 + hoisted_6_5;
                                                                            end ) );
                                                                  end ) ) );
                                                      end ) ) );
                                          end ){Positions( deduped_17_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_17_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.RightDistributivityExpandingWithGivenObjects :=
        
########
function ( cat_1, s_1, L_1, a_1, r_1 )
    local deduped_1_1, deduped_3_1, deduped_4_1, hoisted_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_15_1, hoisted_17_1, deduped_18_1, hoisted_19_1, deduped_20_1, hoisted_21_1, deduped_22_1, deduped_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_28_1, hoisted_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1;
    deduped_43_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsNTuple,
                    element_types := [ rec(
                            filter := IsInt ), rec(
                            filter := IsInt ) ] ) );
        end );
    deduped_42_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_41_1 := TripleOfNrSupportListOfSupportListOfNumberElements( a_1 );
    deduped_40_1 := [ 1 .. Length( L_1 ) ];
    deduped_39_1 := deduped_41_1[1];
    deduped_38_1 := TripleOfNrSupportListOfSupportListOfNumberElements( s_1 )[2];
    deduped_37_1 := [ 1 .. deduped_39_1 ];
    deduped_36_1 := Union2( deduped_38_1, TripleOfNrSupportListOfSupportListOfNumberElements( r_1 )[2] );
    deduped_35_1 := Length( deduped_36_1 );
    deduped_34_1 := [ 1 .. deduped_35_1 ];
    deduped_33_1 := Union( List( L_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfNumberElements( x_2 )[2];
          end ) );
    deduped_32_1 := Length( deduped_33_1 );
    deduped_31_1 := [ 1 .. deduped_32_1 ];
    hoisted_28_1 := [ deduped_43_1 ];
    deduped_8_1 := [ 0 ];
    hoisted_24_1 := List( deduped_31_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_33_1[n_2];
            return Sum( List( L_1, function ( x_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3;
                      deduped_3_3 := TripleOfNrSupportListOfSupportListOfNumberElements( x_3 );
                      deduped_2_3 := deduped_3_3[2];
                      hoisted_1_3 := deduped_3_3[3];
                      return [ deduped_8_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                        return hoisted_1_3[n_4];
                                    end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                  end ) );
        end );
    hoisted_25_1 := NTuple( 3, deduped_32_1, deduped_33_1, List( deduped_31_1, function ( n_2 )
              return hoisted_24_1[n_2];
          end ) );
    hoisted_26_1 := List( deduped_40_1, function ( i_2 )
            return hoisted_25_1;
        end );
    hoisted_6_1 := deduped_41_1[3];
    deduped_7_1 := List( deduped_37_1, function ( n_2 )
            return hoisted_6_1[n_2];
        end );
    deduped_1_1 := deduped_41_1[2];
    deduped_23_1 := List( deduped_37_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_1_1[n_2];
            return [ deduped_8_1, deduped_7_1{Positions( deduped_1_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_1_1 ) + 1][1];
        end );
    deduped_18_1 := List( deduped_37_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_7_1[n_2];
            return [ [ NTuple( 2, 1, deduped_1_2 ) ], deduped_43_1 ][BooleanToInteger( deduped_1_2 = 0 ) + 1];
        end );
    hoisted_21_1 := List( deduped_37_1, function ( n_2 )
            return deduped_18_1[n_2];
        end );
    deduped_22_1 := List( deduped_37_1, function ( n_2 )
            return hoisted_21_1[n_2];
        end );
    hoisted_19_1 := List( deduped_37_1, function ( n_2 )
            return Length( deduped_18_1[n_2] );
        end );
    deduped_20_1 := List( deduped_37_1, function ( n_2 )
            return hoisted_19_1[n_2];
        end );
    hoisted_17_1 := [ 1, 0 ];
    hoisted_15_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := [ 1 .. i_2 - 1 ];
            hoisted_2_2 := List( deduped_31_1, function ( i_3 )
                    local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                    deduped_1_3 := deduped_33_1[i_3];
                    deduped_4_3 := List( L_1, function ( x_4 )
                            local hoisted_1_4, deduped_2_4, deduped_3_4;
                            deduped_3_4 := TripleOfNrSupportListOfSupportListOfNumberElements( x_4 );
                            deduped_2_4 := deduped_3_4[2];
                            hoisted_1_4 := deduped_3_4[3];
                            return [ deduped_8_1, List( [ 1 .. deduped_3_4[1] ], function ( n_5 )
                                              return hoisted_1_4[n_5];
                                          end ){Positions( deduped_2_4, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_2_4 ) + 1][1];
                        end );
                    deduped_3_3 := deduped_4_3[i_2];
                    deduped_2_3 := Sum( deduped_4_3{hoisted_1_2} );
                    return [ [ NTuple( 2, deduped_2_3 + 1, deduped_2_3 + deduped_3_3 ) ], deduped_43_1 ][BooleanToInteger( deduped_3_3 = 0 ) + 1];
                end );
            return NTuple( 3, deduped_32_1, deduped_33_1, List( deduped_31_1, function ( n_3 )
                      return hoisted_2_2[n_3];
                  end ) );
        end );
    deduped_4_1 := [ 1 .. Length( deduped_42_1 ) ];
    deduped_3_1 := [ 1 .. NrIrreducibleCharacters( cat_1 ) ];
    hoisted_9_1 := List( L_1, function ( summand_2 )
            local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2;
            deduped_11_2 := TripleOfNrSupportListOfSupportListOfNumberElements( summand_2 );
            deduped_10_2 := [ 1 .. deduped_11_2[1] ];
            deduped_1_2 := deduped_11_2[2];
            deduped_9_2 := Union( List( deduped_10_2, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_1_2[i_3];
                      return Union( List( deduped_37_1, function ( j_4 )
                                local hoisted_1_4, hoisted_2_4;
                                hoisted_1_4 := deduped_1_1[j_4];
                                hoisted_2_4 := List( deduped_3_1, function ( k_5 )
                                        return IsZero( SGREPS_ScalarProduct( deduped_42_1, k_5, hoisted_1_3, hoisted_1_4 ) );
                                    end );
                                return Filtered( deduped_4_1, function ( i_5 )
                                        return not hoisted_2_4[i_5];
                                    end );
                            end ) );
                  end ) );
            deduped_8_2 := Length( deduped_9_2 );
            deduped_7_2 := [ 1 .. deduped_8_2 ];
            hoisted_2_2 := deduped_11_2[3];
            hoisted_3_2 := List( deduped_10_2, function ( n_3 )
                    return hoisted_2_2[n_3];
                end );
            hoisted_6_2 := List( deduped_7_2, function ( n_3 )
                    local deduped_1_3;
                    deduped_1_3 := deduped_9_2[n_3];
                    return Sum( List( deduped_10_2, function ( i_4 )
                              local deduped_1_4, hoisted_2_4, hoisted_4_4, hoisted_5_4, deduped_6_4, deduped_7_4;
                              deduped_1_4 := deduped_1_2[i_4];
                              deduped_7_4 := Union( List( deduped_37_1, function ( j_5 )
                                        local hoisted_1_5, hoisted_2_5;
                                        hoisted_1_5 := deduped_1_1[j_5];
                                        hoisted_2_5 := List( deduped_3_1, function ( k_6 )
                                                return IsZero( SGREPS_ScalarProduct( deduped_42_1, k_6, deduped_1_4, hoisted_1_5 ) );
                                            end );
                                        return Filtered( deduped_4_1, function ( i_6 )
                                                return not hoisted_2_5[i_6];
                                            end );
                                    end ) );
                              deduped_6_4 := [ 1 .. Length( deduped_7_4 ) ];
                              hoisted_2_4 := hoisted_3_2[i_4];
                              hoisted_4_4 := List( deduped_6_4, function ( n_5 )
                                      local deduped_1_5;
                                      deduped_1_5 := deduped_7_4[n_5];
                                      return Sum( List( deduped_37_1, function ( j_6 )
                                                local deduped_1_6, hoisted_2_6, hoisted_3_6, hoisted_4_6, hoisted_5_6, hoisted_6_6, deduped_7_6, deduped_8_6;
                                                deduped_1_6 := deduped_1_1[j_6];
                                                hoisted_2_6 := List( deduped_3_1, function ( k_7 )
                                                        return IsZero( SGREPS_ScalarProduct( deduped_42_1, k_7, deduped_1_4, deduped_1_6 ) );
                                                    end );
                                                deduped_8_6 := Filtered( deduped_4_1, function ( i_7 )
                                                        return not hoisted_2_6[i_7];
                                                    end );
                                                deduped_7_6 := [ 1 .. Length( deduped_8_6 ) ];
                                                hoisted_4_6 := hoisted_2_4 * deduped_7_1[j_6];
                                                hoisted_3_6 := List( deduped_3_1, function ( k_7 )
                                                          return SGREPS_ScalarProduct( deduped_42_1, k_7, deduped_1_4, deduped_1_6 );
                                                      end ){deduped_8_6};
                                                hoisted_5_6 := List( deduped_7_6, function ( n_7 )
                                                        return hoisted_3_6[n_7] * hoisted_4_6;
                                                    end );
                                                hoisted_6_6 := List( deduped_7_6, function ( n_7 )
                                                        return hoisted_5_6[n_7];
                                                    end );
                                                return [ deduped_8_1, List( deduped_7_6, function ( n_7 )
                                                                  return hoisted_6_6[n_7];
                                                              end ){Positions( deduped_8_6, deduped_1_5 )} ][BooleanToInteger( deduped_1_5 in deduped_8_6 ) + 1][1];
                                            end ) );
                                  end );
                              hoisted_5_4 := List( deduped_6_4, function ( n_5 )
                                      return hoisted_4_4[n_5];
                                  end );
                              return [ deduped_8_1, List( deduped_6_4, function ( n_5 )
                                                return hoisted_5_4[n_5];
                                            end ){Positions( deduped_7_4, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_7_4 ) + 1][1];
                          end ) );
                end );
            return NTuple( 3, deduped_8_2, deduped_9_2, List( deduped_7_2, function ( n_3 )
                      return hoisted_6_2[n_3];
                  end ) );
        end );
    hoisted_30_1 := List( deduped_34_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_36_1[n_2];
            return Concatenation( List( deduped_40_1, function ( i_3 )
                      local deduped_3_3, hoisted_4_3, deduped_5_3, deduped_7_3, hoisted_8_3, hoisted_9_3, hoisted_10_3, deduped_11_3, hoisted_12_3, hoisted_13_3, hoisted_14_3, deduped_16_3, hoisted_17_3, hoisted_18_3, deduped_19_3, deduped_20_3, deduped_21_3, deduped_22_3, deduped_23_3, deduped_24_3, deduped_25_3;
                      deduped_25_3 := hoisted_26_1[i_3];
                      deduped_24_3 := hoisted_15_1[i_3];
                      deduped_23_3 := deduped_24_3[3];
                      deduped_22_3 := [ 1 .. deduped_24_3[1] ];
                      deduped_21_3 := Union2( deduped_38_1, hoisted_9_1[i_3][2] );
                      deduped_20_3 := List( deduped_22_3, function ( i_4 )
                              return deduped_39_1;
                          end );
                      deduped_19_3 := [ 1 .. Length( deduped_21_3 ) ];
                      deduped_16_3 := [ 1 .. deduped_20_3[1] ];
                      hoisted_10_3 := deduped_25_3[3];
                      hoisted_12_3 := List( [ 1 .. deduped_25_3[1] ], function ( n_4 )
                              return hoisted_10_3[n_4];
                          end );
                      deduped_11_3 := deduped_25_3[2];
                      deduped_3_3 := deduped_24_3[2];
                      hoisted_13_3 := List( deduped_22_3, function ( n_4 )
                              local deduped_1_4;
                              deduped_1_4 := deduped_3_3[n_4];
                              return [ deduped_8_1, hoisted_12_3{Positions( deduped_11_3, deduped_1_4 )} ][BooleanToInteger( deduped_1_4 in deduped_11_3 ) + 1][1];
                          end );
                      hoisted_14_3 := List( deduped_22_3, function ( i_4 )
                              local hoisted_1_4;
                              hoisted_1_4 := hoisted_13_3[i_4];
                              return List( deduped_37_1, function ( j_5 )
                                      return hoisted_1_4 * deduped_23_1[j_5];
                                  end );
                          end );
                      deduped_7_3 := List( deduped_22_3, function ( n_4 )
                              return deduped_23_3[n_4];
                          end );
                      hoisted_4_3 := List( deduped_23_3, Length );
                      deduped_5_3 := List( deduped_22_3, function ( n_4 )
                              return hoisted_4_3[n_4];
                          end );
                      hoisted_9_3 := List( deduped_22_3, function ( i_4 )
                              local deduped_1_4, deduped_2_4;
                              deduped_2_4 := [ 1 .. deduped_5_3[i_4] ];
                              deduped_1_4 := deduped_7_3[i_4];
                              return List( deduped_37_1, function ( j_5 )
                                      local deduped_5_5, deduped_6_5, deduped_7_5, deduped_8_5, deduped_9_5;
                                      deduped_9_5 := deduped_23_1[j_5];
                                      deduped_8_5 := deduped_22_1[j_5];
                                      deduped_7_5 := deduped_8_5[1];
                                      deduped_6_5 := deduped_7_5[1];
                                      deduped_5_5 := deduped_7_5[2];
                                      if deduped_20_1[j_5] = 1 and deduped_5_5 - deduped_6_5 + 1 = deduped_9_5 then
                                          return List( deduped_2_4, function ( i_6 )
                                                  local deduped_1_6;
                                                  deduped_1_6 := deduped_1_4[i_6];
                                                  return NTuple( 2, deduped_6_5 + deduped_9_5 * (deduped_1_6[1] - 1), deduped_5_5 + deduped_9_5 * (deduped_1_6[2] - 1) );
                                              end );
                                      else
                                          return Concatenation( List( deduped_2_4, function ( i_6 )
                                                    local deduped_1_6;
                                                    deduped_1_6 := deduped_1_4[i_6];
                                                    return Concatenation( List( [ deduped_1_6[1] .. deduped_1_6[2] ], function ( j_7 )
                                                              return deduped_8_5 + deduped_9_5 * (j_7 - 1);
                                                          end ) );
                                                end ) );
                                      fi;
                                      return;
                                  end );
                          end );
                      hoisted_8_3 := List( deduped_22_3, function ( i_4 )
                              local hoisted_2_4, hoisted_3_4, deduped_4_4;
                              deduped_4_4 := deduped_5_3[i_4];
                              hoisted_3_4 := [ 1 .. deduped_4_4 ];
                              hoisted_2_4 := deduped_7_3[i_4];
                              return List( deduped_37_1, function ( j_5 )
                                      local deduped_3_5, deduped_4_5, deduped_5_5;
                                      deduped_5_5 := deduped_23_1[j_5];
                                      deduped_4_5 := deduped_22_1[j_5];
                                      deduped_3_5 := deduped_4_5[1];
                                      if deduped_20_1[j_5] = 1 and deduped_3_5[2] - deduped_3_5[1] + 1 = deduped_5_5 then
                                          return deduped_4_4;
                                      else
                                          return Sum( List( hoisted_3_4, function ( i_6 )
                                                    local deduped_1_6;
                                                    deduped_1_6 := hoisted_2_4[i_6];
                                                    return Sum( List( [ deduped_1_6[1] .. deduped_1_6[2] ], function ( j_7 )
                                                              return Length( deduped_4_5 + deduped_5_5 * (j_7 - 1) );
                                                          end ) );
                                                end ) );
                                      fi;
                                      return;
                                  end );
                          end );
                      hoisted_17_3 := List( deduped_19_3, function ( k_4 )
                              local deduped_1_4, deduped_2_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4;
                              deduped_1_4 := deduped_21_3[k_4];
                              deduped_2_4 := List( deduped_22_3, function ( i_5 )
                                      local hoisted_1_5, hoisted_2_5;
                                      hoisted_2_5 := deduped_3_3[i_5];
                                      hoisted_1_5 := hoisted_14_3[i_5];
                                      return List( deduped_37_1, function ( j_6 )
                                              return hoisted_1_5[j_6] * SGREPS_ScalarProduct( deduped_42_1, deduped_1_4, hoisted_2_5, deduped_1_1[j_6] );
                                          end );
                                  end );
                              hoisted_4_4 := List( deduped_22_3, function ( i_5 )
                                      local hoisted_1_5;
                                      hoisted_1_5 := deduped_2_4[i_5];
                                      return Sum( List( deduped_16_3, function ( j_6 )
                                                return hoisted_1_5[j_6];
                                            end ) );
                                  end );
                              hoisted_5_4 := List( deduped_22_3, function ( i_5 )
                                      return hoisted_4_4[i_5];
                                  end );
                              hoisted_6_4 := List( deduped_22_3, function ( i_5 )
                                      return hoisted_5_4[i_5];
                                  end );
                              hoisted_3_4 := List( deduped_22_3, function ( i_5 )
                                      local hoisted_1_5;
                                      hoisted_1_5 := deduped_2_4[i_5];
                                      return List( deduped_16_3, function ( j_6 )
                                              return hoisted_1_5[j_6];
                                          end );
                                  end );
                              return Concatenation( List( deduped_22_3, function ( i_5 )
                                        local hoisted_1_5;
                                        hoisted_1_5 := Sum( List( [ 1 .. i_5 - 1 ], function ( j_6 )
                                                  return hoisted_6_4[j_6];
                                              end ) );
                                        return List( deduped_22_3, function ( i_6 )
                                                  local hoisted_1_6;
                                                  hoisted_1_6 := hoisted_3_4[i_6];
                                                  return Concatenation( List( [ 1 .. deduped_20_3[i_6] ], function ( i_7 )
                                                            local hoisted_1_7;
                                                            hoisted_1_7 := Sum( List( [ 1 .. i_7 - 1 ], function ( j_8 )
                                                                      return hoisted_1_6[j_8];
                                                                  end ) );
                                                            return List( deduped_22_3, function ( i_8 )
                                                                        local hoisted_1_8, hoisted_2_8, hoisted_3_8;
                                                                        hoisted_3_8 := hoisted_9_3[i_8];
                                                                        hoisted_2_8 := hoisted_8_3[i_8];
                                                                        hoisted_1_8 := deduped_3_3[i_8];
                                                                        return List( deduped_37_1, function ( j_9 )
                                                                                local deduped_1_9, deduped_6_9, deduped_7_9, deduped_8_9, deduped_9_9, deduped_10_9, deduped_11_9, deduped_12_9;
                                                                                deduped_12_9 := [ 1 .. hoisted_2_8[j_9] ];
                                                                                deduped_11_9 := SGREPS_ScalarProduct( deduped_42_1, deduped_1_4, hoisted_1_8, deduped_1_1[j_9] );
                                                                                deduped_10_9 := BooleanToInteger( deduped_11_9 = 0 ) + 1;
                                                                                deduped_9_9 := [ [ NTuple( 2, 1, deduped_11_9 ) ], deduped_43_1 ][deduped_10_9];
                                                                                deduped_8_9 := deduped_9_9[1];
                                                                                deduped_7_9 := deduped_8_9[1];
                                                                                deduped_6_9 := deduped_8_9[2];
                                                                                deduped_1_9 := hoisted_3_8[j_9];
                                                                                return List( CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                                                                            if hoisted_17_1[deduped_10_9] = 1 and deduped_6_9 - deduped_7_9 + 1 = deduped_11_9 then
                                                                                                return List( deduped_12_9, function ( i_11 )
                                                                                                        local deduped_1_11;
                                                                                                        deduped_1_11 := deduped_1_9[i_11];
                                                                                                        return NTuple( 2, deduped_7_9 + deduped_11_9 * (deduped_1_11[1] - 1), deduped_6_9 + deduped_11_9 * (deduped_1_11[2] - 1) );
                                                                                                    end );
                                                                                            else
                                                                                                return Concatenation( List( deduped_12_9, function ( i_11 )
                                                                                                          local deduped_1_11;
                                                                                                          deduped_1_11 := deduped_1_9[i_11];
                                                                                                          return Concatenation( List( [ deduped_1_11[1] .. deduped_1_11[2] ], function ( j_12 )
                                                                                                                    return deduped_9_9 + deduped_11_9 * (j_12 - 1);
                                                                                                                end ) );
                                                                                                      end ) );
                                                                                            fi;
                                                                                            return;
                                                                                        end )(  ), function ( col_10 )
                                                                                        return col_10 + hoisted_1_7 + hoisted_1_5;
                                                                                    end );
                                                                            end );
                                                                    end )[i_6][i_7];
                                                        end ) );
                                              end )[i_5];
                                    end ) );
                          end );
                      hoisted_18_3 := List( deduped_19_3, function ( i_4 )
                              return hoisted_17_3[i_4];
                          end );
                      return [ hoisted_28_1, List( deduped_19_3, function ( n_4 )
                                        return hoisted_18_3[n_4];
                                    end ){Positions( deduped_21_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_21_3 ) + 1][1];
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, TripleOfNrSupportListOfSupportListOfListOfColumns, NTuple( 3, deduped_35_1, deduped_36_1, List( deduped_34_1, function ( n_2 )
                return hoisted_30_1[n_2];
            end ) ) );
end
########
        
    ;
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "Product_Of_CategoryOfPermutationsWithProducts_AsSubcategoryOfSkeletalGroupRepresentations_S4_precompiled", function ( irreducible_characters )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( irreducible_characters )
    return ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( irreducible_characters : no_precompiled_code := true );
end;
        
        
    
    cat := category_constructor( irreducible_characters : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_Product_Of_CategoryOfPermutationsWithProducts_AsSubcategoryOfSkeletalGroupRepresentations_S4_precompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
