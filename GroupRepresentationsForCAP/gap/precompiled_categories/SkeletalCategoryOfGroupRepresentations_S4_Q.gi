# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SkeletalCategoryOfGroupRepresentations_S4_Q", function ( cat )
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1;
    deduped_20_1 := TripleOfNrSupportListOfSupportListOfRanks( arg3_1 );
    deduped_19_1 := TripleOfNrSupportListOfSupportListOfRanks( arg2_1 );
    deduped_18_1 := [ 1 .. deduped_20_1[1] ];
    deduped_17_1 := [ 1 .. deduped_19_1[1] ];
    deduped_6_1 := [ 1 .. NrIrreducibleCharacters( cat_1 ) ];
    deduped_5_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_4_1 := deduped_20_1[2];
    deduped_3_1 := deduped_19_1[2];
    deduped_16_1 := Union( List( deduped_17_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_3_1[i_2];
              return Union( List( deduped_18_1, function ( j_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := deduped_4_1[j_3];
                        return Filtered( deduped_6_1, function ( k_4 )
                                return not CAP_JIT_INCOMPLETE_LOGIC( IsZero( SGREPS_ScalarProduct( deduped_5_1, CAP_JIT_INCOMPLETE_LOGIC( k_4 ), hoisted_1_2, hoisted_1_3 ) ) );
                            end );
                    end ) );
          end ) );
    deduped_15_1 := Length( deduped_16_1 );
    deduped_12_1 := [ 0 ];
    hoisted_10_1 := deduped_20_1[3];
    hoisted_11_1 := List( deduped_18_1, function ( n_2 )
            return hoisted_10_1[n_2];
        end );
    hoisted_8_1 := deduped_19_1[3];
    hoisted_9_1 := List( deduped_17_1, function ( n_2 )
            return hoisted_8_1[n_2];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_15_1, deduped_16_1, List( [ 1 .. deduped_15_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_16_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_17_1, function ( i_3 )
                            local deduped_1_3, hoisted_2_3, deduped_4_3;
                            deduped_1_3 := deduped_3_1[i_3];
                            deduped_4_3 := Union( List( deduped_18_1, function ( j_4 )
                                      local hoisted_1_4;
                                      hoisted_1_4 := deduped_4_1[j_4];
                                      return Filtered( deduped_6_1, function ( k_5 )
                                              return not CAP_JIT_INCOMPLETE_LOGIC( IsZero( SGREPS_ScalarProduct( deduped_5_1, CAP_JIT_INCOMPLETE_LOGIC( k_5 ), deduped_1_3, hoisted_1_4 ) ) );
                                          end );
                                  end ) );
                            hoisted_2_3 := hoisted_9_1[i_3];
                            return [ deduped_12_1, List( [ 1 .. Length( deduped_4_3 ) ], function ( n_4 )
                                              local deduped_1_4;
                                              deduped_1_4 := deduped_4_3[CAP_JIT_INCOMPLETE_LOGIC( n_4 )];
                                              return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_18_1, function ( j_5 )
                                                          local deduped_1_5, hoisted_3_5, deduped_4_5;
                                                          deduped_1_5 := deduped_4_1[j_5];
                                                          deduped_4_5 := Filtered( deduped_6_1, function ( k_6 )
                                                                  return not CAP_JIT_INCOMPLETE_LOGIC( IsZero( SGREPS_ScalarProduct( deduped_5_1, CAP_JIT_INCOMPLETE_LOGIC( k_6 ), deduped_1_3, deduped_1_5 ) ) );
                                                              end );
                                                          hoisted_3_5 := hoisted_2_3 * hoisted_11_1[j_5];
                                                          return [ deduped_12_1, List( [ 1 .. Length( deduped_4_5 ) ], function ( n_6 )
                                                                            return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( SGREPS_ScalarProduct( deduped_5_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_4_5[CAP_JIT_INCOMPLETE_LOGIC( n_6 )] ), deduped_1_3, deduped_1_5 ) ) * hoisted_3_5 );
                                                                        end ){Positions( deduped_4_5, deduped_1_4 )} ][BooleanToInteger( deduped_1_4 in deduped_4_5 ) + 1][1];
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
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1;
    deduped_22_1 := TripleOfNrSupportListOfSupportListOfRanks( arg3_1 );
    deduped_21_1 := TripleOfNrSupportListOfSupportListOfRanks( arg2_1 );
    deduped_20_1 := [ 1 .. deduped_22_1[1] ];
    deduped_19_1 := [ 1 .. deduped_21_1[1] ];
    deduped_6_1 := [ 1 .. NrIrreducibleCharacters( cat_1 ) ];
    deduped_5_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_4_1 := deduped_22_1[2];
    deduped_3_1 := deduped_21_1[2];
    deduped_18_1 := Union( List( deduped_19_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_3_1[i_2];
              return Union( List( deduped_20_1, function ( j_3 )
                        local hoisted_1_3, hoisted_2_3;
                        hoisted_1_3 := deduped_4_1[j_3];
                        hoisted_2_3 := List( deduped_6_1, function ( k_4 )
                                return IsZero( SGREPS_ScalarProduct( deduped_5_1, k_4, hoisted_1_2, hoisted_1_3 ) );
                            end );
                        return Filtered( deduped_6_1, function ( k_4 )
                                return not hoisted_2_3[k_4];
                            end );
                    end ) );
          end ) );
    deduped_17_1 := Length( deduped_18_1 );
    deduped_16_1 := [ 1 .. deduped_17_1 ];
    deduped_12_1 := [ 0 ];
    hoisted_10_1 := deduped_22_1[3];
    hoisted_11_1 := List( deduped_20_1, function ( n_2 )
            return hoisted_10_1[n_2];
        end );
    hoisted_8_1 := deduped_21_1[3];
    hoisted_9_1 := List( deduped_19_1, function ( n_2 )
            return hoisted_8_1[n_2];
        end );
    hoisted_15_1 := List( deduped_16_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_18_1[n_2];
            return Sum( List( deduped_19_1, function ( i_3 )
                      local deduped_1_3, hoisted_2_3, hoisted_4_3, hoisted_5_3, deduped_6_3, deduped_7_3;
                      deduped_1_3 := deduped_3_1[i_3];
                      deduped_7_3 := Union( List( deduped_20_1, function ( j_4 )
                                local hoisted_1_4, hoisted_2_4;
                                hoisted_1_4 := deduped_4_1[j_4];
                                hoisted_2_4 := List( deduped_6_1, function ( k_5 )
                                        return IsZero( SGREPS_ScalarProduct( deduped_5_1, k_5, deduped_1_3, hoisted_1_4 ) );
                                    end );
                                return Filtered( deduped_6_1, function ( k_5 )
                                        return not hoisted_2_4[k_5];
                                    end );
                            end ) );
                      deduped_6_3 := [ 1 .. Length( deduped_7_3 ) ];
                      hoisted_2_3 := hoisted_9_1[i_3];
                      hoisted_4_3 := List( deduped_6_3, function ( n_4 )
                              local deduped_1_4;
                              deduped_1_4 := deduped_7_3[n_4];
                              return Sum( List( deduped_20_1, function ( j_5 )
                                        local deduped_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5, hoisted_5_5, hoisted_6_5, hoisted_7_5, deduped_8_5, deduped_9_5;
                                        deduped_1_5 := deduped_4_1[j_5];
                                        hoisted_2_5 := List( deduped_6_1, function ( k_6 )
                                                return IsZero( SGREPS_ScalarProduct( deduped_5_1, k_6, deduped_1_3, deduped_1_5 ) );
                                            end );
                                        deduped_9_5 := Filtered( deduped_6_1, function ( k_6 )
                                                return not hoisted_2_5[k_6];
                                            end );
                                        deduped_8_5 := [ 1 .. Length( deduped_9_5 ) ];
                                        hoisted_5_5 := hoisted_2_3 * hoisted_11_1[j_5];
                                        hoisted_3_5 := List( deduped_6_1, function ( k_6 )
                                                return SGREPS_ScalarProduct( deduped_5_1, k_6, deduped_1_3, deduped_1_5 );
                                            end );
                                        hoisted_4_5 := List( deduped_9_5, function ( k_6 )
                                                return hoisted_3_5[k_6];
                                            end );
                                        hoisted_6_5 := List( deduped_8_5, function ( n_6 )
                                                return hoisted_4_5[n_6] * hoisted_5_5;
                                            end );
                                        hoisted_7_5 := List( deduped_8_5, function ( n_6 )
                                                return hoisted_6_5[n_6];
                                            end );
                                        return [ deduped_12_1, List( deduped_8_5, function ( n_6 )
                                                          return hoisted_7_5[n_6];
                                                      end ){Positions( deduped_9_5, deduped_1_4 )} ][BooleanToInteger( deduped_1_4 in deduped_9_5 ) + 1][1];
                                    end ) );
                          end );
                      hoisted_5_3 := List( deduped_6_3, function ( n_4 )
                              return hoisted_4_3[n_4];
                          end );
                      return [ deduped_12_1, List( deduped_6_3, function ( n_4 )
                                        return hoisted_5_3[n_4];
                                    end ){Positions( deduped_7_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_7_3 ) + 1][1];
                  end ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_17_1, deduped_18_1, List( deduped_16_1, function ( n_2 )
                return hoisted_15_1[n_2];
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

BindGlobal( "SkeletalCategoryOfGroupRepresentations_S4_Q", function ( group, homalg_field )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( group, homalg_field )
    return SkeletalCategoryOfGroupRepresentations( group, homalg_field );
end;
        
        
    
    cat := category_constructor( group, homalg_field : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_SkeletalCategoryOfGroupRepresentations_S4_Q( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
