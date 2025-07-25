function ( cat_1, source_1, list_of_morphisms_1, range_1 )
    local deduped_1_1, hoisted_3_1, hoisted_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, hoisted_9_1, deduped_10_1, hoisted_11_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1;
    deduped_18_1 := TripleOfNrSupportListOfSupportListOfRanks( range_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfRanks( source_1 );
    deduped_16_1 := UnderlyingSplittingField( cat_1 );
    deduped_15_1 := [ 1 .. Length( list_of_morphisms_1 ) ];
    deduped_1_1 := List( list_of_morphisms_1, function ( x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := TripleOfNrSupportListOfSupportListOfMatrices( x_2 );
            deduped_2_2 := deduped_3_2[1];
            hoisted_1_2 := deduped_3_2[3];
            return NTuple( 3, deduped_2_2, deduped_3_2[2], List( [ 1 .. deduped_2_2 ], function ( n_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_1_2[n_3];
                      return CreateCapCategoryMorphismWithAttributes( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_3, CreateCapCategoryObjectWithAttributes( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_3, RankOfObject, NumberRows( deduped_1_3 ) ), CreateCapCategoryObjectWithAttributes( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_3, RankOfObject, NumberColumns( deduped_1_3 ) ), UnderlyingMatrix, deduped_1_3 );
                  end ) );
        end );
    deduped_14_1 := Union( List( deduped_15_1, function ( i_2 )
              return deduped_1_1[i_2][2];
          end ) );
    deduped_13_1 := Length( deduped_14_1 );
    hoisted_9_1 := deduped_18_1[3];
    hoisted_11_1 := List( [ 1 .. deduped_18_1[1] ], function ( n_2 )
            return hoisted_9_1[n_2];
        end );
    deduped_10_1 := deduped_18_1[2];
    deduped_8_1 := [ 0 ];
    hoisted_5_1 := deduped_17_1[3];
    hoisted_7_1 := List( [ 1 .. deduped_17_1[1] ], function ( n_2 )
            return hoisted_5_1[n_2];
        end );
    deduped_6_1 := deduped_17_1[2];
    hoisted_3_1 := [ HomalgZeroMatrix( 0, 0, deduped_16_1 ) ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, TripleOfNrSupportListOfSupportListOfMatrices, NTuple( 3, deduped_13_1, deduped_14_1, List( [ 1 .. deduped_13_1 ], function ( n_2 )
                local deduped_2_2;
                deduped_2_2 := deduped_14_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_15_1, function ( j_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := deduped_1_1[j_3];
                            deduped_1_3 := deduped_2_3[2];
                            return [ hoisted_3_1, List( deduped_2_3[3], UnderlyingMatrix ){Positions( deduped_1_3, deduped_2_2 )} ][BooleanToInteger( deduped_2_2 in deduped_1_3 ) + 1][1];
                        end ), HomalgZeroMatrix( [ deduped_8_1, hoisted_7_1{Positions( deduped_6_1, deduped_2_2 )} ][BooleanToInteger( deduped_2_2 in deduped_6_1 ) + 1][1], [ deduped_8_1, hoisted_11_1{Positions( deduped_10_1, deduped_2_2 )} ][BooleanToInteger( deduped_2_2 in deduped_10_1 ) + 1][1], deduped_16_1 ) ) );
            end ) ) );
end 
