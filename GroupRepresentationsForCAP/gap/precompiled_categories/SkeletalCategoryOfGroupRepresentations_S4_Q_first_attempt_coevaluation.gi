# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SkeletalCategoryOfGroupRepresentations_S4_Q", function ( cat )
    
    ##
    AddCoevaluationForDualWithGivenTensorProduct( cat,
        
########
function ( cat_1, s_1, a_1, r_1 )
    local deduped_1_1, hoisted_3_1, hoisted_4_1, deduped_6_1, hoisted_9_1, deduped_10_1, hoisted_11_1, deduped_14_1, deduped_15_1, hoisted_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, deduped_21_1, deduped_24_1, hoisted_25_1, hoisted_26_1, deduped_27_1, deduped_28_1, hoisted_30_1, hoisted_31_1, hoisted_35_1, deduped_36_1, hoisted_37_1, hoisted_39_1, hoisted_40_1, hoisted_42_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_48_1, hoisted_49_1, hoisted_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1;
    deduped_85_1 := UnderlyingSplittingField( cat_1 );
    deduped_84_1 := DecompositionIntoSimpleObjects( a_1 );
    deduped_83_1 := TripleOfNrSupportListOfSupportListOfRanks( a_1 );
    deduped_82_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_81_1 := TripleOfNrSupportListOfSupportListOfRanks( r_1 );
    deduped_80_1 := Support( r_1 );
    deduped_79_1 := NrSupport( r_1 );
    deduped_78_1 := TripleOfNrSupportListOfSupportListOfRanks( s_1 );
    deduped_77_1 := [ 1 .. NrSupport( a_1 ) ];
    deduped_76_1 := [ 1 .. NrSupport( r_1 ) ];
    deduped_75_1 := deduped_83_1[1];
    deduped_74_1 := deduped_81_1[2];
    deduped_73_1 := TripleOfNrSupportListOfSupportListOfMatrices( SGREPS_CoevaluationForDual_1_Morphism( cat_1, s_1, a_1, r_1 ) );
    deduped_72_1 := deduped_78_1[2];
    deduped_71_1 := [ 1 .. deduped_75_1 ];
    deduped_70_1 := deduped_73_1[2];
    deduped_69_1 := Union2( deduped_72_1, deduped_70_1 );
    deduped_68_1 := Union( List( deduped_84_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfRanks( x_2 )[2];
          end ) );
    deduped_67_1 := Length( deduped_68_1 );
    hoisted_4_1 := deduped_83_1[2];
    deduped_66_1 := List( deduped_71_1, function ( i_2 )
            return SafeUniquePosition( deduped_82_1, ComplexConjugate( deduped_82_1[hoisted_4_1[i_2]] ) );
        end );
    deduped_65_1 := SortingPerm( deduped_66_1 );
    deduped_64_1 := Permuted( deduped_83_1[3], deduped_65_1 );
    deduped_63_1 := Permuted( deduped_66_1, deduped_65_1 );
    deduped_62_1 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_75_1, deduped_63_1, deduped_64_1 ) );
    deduped_61_1 := DecompositionIntoSimpleObjects( deduped_62_1 );
    deduped_60_1 := Union( List( deduped_61_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfRanks( x_2 )[2];
          end ) );
    deduped_59_1 := Length( deduped_60_1 );
    deduped_10_1 := [ 0 ];
    deduped_58_1 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_67_1, deduped_68_1, List( [ 1 .. deduped_67_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_68_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_84_1, function ( x_3 )
                            local hoisted_1_3, deduped_2_3, deduped_3_3;
                            deduped_3_3 := TripleOfNrSupportListOfSupportListOfRanks( x_3 );
                            deduped_2_3 := deduped_3_3[2];
                            hoisted_1_3 := deduped_3_3[3];
                            return [ deduped_10_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                              return hoisted_1_3[n_4];
                                          end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                        end ) ) );
            end ) ) );
    deduped_57_1 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_59_1, deduped_60_1, List( [ 1 .. deduped_59_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_60_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_61_1, function ( x_3 )
                            local hoisted_1_3, deduped_2_3, deduped_3_3;
                            deduped_3_3 := TripleOfNrSupportListOfSupportListOfRanks( x_3 );
                            deduped_2_3 := deduped_3_3[2];
                            hoisted_1_3 := deduped_3_3[3];
                            return [ deduped_10_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                              return hoisted_1_3[n_4];
                                          end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                        end ) ) );
            end ) ) );
    hoisted_30_1 := [ 1 .. Length( DecompositionIntoSimpleObjects( a_1 ) ) ];
    deduped_28_1 := [ 1 .. NrSupport( deduped_58_1 ) ];
    deduped_27_1 := [ 1 .. NrSupport( deduped_62_1 ) ];
    hoisted_26_1 := Support( deduped_62_1 );
    hoisted_25_1 := Components( deduped_62_1 );
    deduped_24_1 := Support( deduped_58_1 );
    deduped_1_1 := Components( a_1 );
    deduped_21_1 := [ 1 .. Sum( List( deduped_77_1, function ( i_2 )
                  return deduped_1_1[i_2];
              end ) ) ];
    hoisted_20_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsInt ) );
        end );
    deduped_19_1 := Support( r_1 );
    hoisted_17_1 := [ 1 .. Length( deduped_61_1 ) ];
    deduped_15_1 := [ 1 .. NrSupport( deduped_57_1 ) ];
    deduped_14_1 := Support( deduped_57_1 );
    hoisted_11_1 := [ 1 ];
    hoisted_9_1 := List( deduped_71_1, function ( n_2 )
            return deduped_64_1[n_2];
        end );
    deduped_6_1 := [ 1 .. Length( deduped_82_1 ) ];
    hoisted_3_1 := Support( a_1 );
    deduped_18_1 := Concatenation( List( deduped_77_1, function ( i_2 )
              local deduped_1_2, hoisted_4_2, deduped_5_2, hoisted_7_2, deduped_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2;
              deduped_17_2 := hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
              deduped_16_2 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, 1, [ deduped_17_2 ], hoisted_11_1 ) );
              deduped_1_2 := deduped_82_1[deduped_17_2];
              deduped_15_2 := Union( List( deduped_71_1, function ( j_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := deduped_1_2 * deduped_82_1[deduped_63_1[j_3]];
                        return Filtered( deduped_6_1, function ( i_4 )
                                return not CAP_JIT_INCOMPLETE_LOGIC( IsZero( ScalarProduct( deduped_82_1[CAP_JIT_INCOMPLETE_LOGIC( i_4 )], hoisted_1_3 ) ) );
                            end );
                    end ) );
              deduped_14_2 := Union( [ deduped_15_2 ] );
              deduped_13_2 := Length( deduped_14_2 );
              hoisted_4_2 := List( [ 1 .. Length( deduped_15_2 ) ], function ( n_3 )
                      local deduped_1_3;
                      deduped_1_3 := deduped_15_2[CAP_JIT_INCOMPLETE_LOGIC( n_3 )];
                      return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_71_1, function ( j_4 )
                                  local deduped_1_4, hoisted_2_4, hoisted_3_4, deduped_4_4;
                                  deduped_1_4 := deduped_1_2 * deduped_82_1[deduped_63_1[j_4]];
                                  deduped_4_4 := Filtered( deduped_6_1, function ( i_5 )
                                          return not CAP_JIT_INCOMPLETE_LOGIC( IsZero( ScalarProduct( deduped_82_1[CAP_JIT_INCOMPLETE_LOGIC( i_5 )], deduped_1_4 ) ) );
                                      end );
                                  hoisted_3_4 := 1 * hoisted_9_1[j_4];
                                  hoisted_2_4 := List( deduped_6_1, function ( n_5 )
                                            return ScalarProduct( deduped_82_1[n_5], deduped_1_4 );
                                        end ){deduped_4_4};
                                  return [ deduped_10_1, List( [ 1 .. Length( deduped_4_4 ) ], function ( n_5 )
                                                    return CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_4[CAP_JIT_INCOMPLETE_LOGIC( n_5 )] * hoisted_3_4 );
                                                end ){Positions( deduped_4_4, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_4_4 ) + 1][1];
                              end ) ) );
                  end );
              deduped_12_2 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_13_2, deduped_14_2, List( [ 1 .. deduped_13_2 ], function ( n_3 )
                          local deduped_1_3;
                          deduped_1_3 := deduped_14_2[CAP_JIT_INCOMPLETE_LOGIC( n_3 )];
                          return CAP_JIT_INCOMPLETE_LOGIC( Sum( [ [ deduped_10_1, hoisted_4_2{Positions( deduped_15_2, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_15_2 ) + 1][1] ] ) );
                      end ) ) );
              deduped_11_2 := NrSupport( deduped_12_2 );
              deduped_10_2 := Support( deduped_12_2 );
              deduped_8_2 := [ 1 .. NrSupport( deduped_16_2 ) ];
              hoisted_7_2 := Support( deduped_16_2 );
              deduped_5_2 := Components( deduped_16_2 );
              hoisted_9_2 := CAP_JIT_INCOMPLETE_LOGIC( NTuple( 3, deduped_11_2, deduped_10_2, List( [ 1 .. deduped_11_2 ], function ( i_3 )
                          local hoisted_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                          hoisted_1_3 := deduped_82_1[deduped_10_2[CAP_JIT_INCOMPLETE_LOGIC( i_3 )]];
                          deduped_2_3 := List( deduped_8_2, function ( i_4 )
                                  local hoisted_1_4;
                                  hoisted_1_4 := deduped_82_1[hoisted_7_2[i_4]];
                                  return List( deduped_15_1, function ( j_5 )
                                          return ScalarProduct( hoisted_1_3, hoisted_1_4 * deduped_82_1[deduped_14_1[j_5]] );
                                      end );
                              end );
                          deduped_3_3 := List( deduped_8_2, function ( i_4 )
                                  local hoisted_1_4, hoisted_2_4;
                                  hoisted_2_4 := deduped_2_3[i_4];
                                  hoisted_1_4 := deduped_5_2[i_4];
                                  return List( deduped_15_1, function ( j_5 )
                                          return hoisted_1_4 * Component( deduped_57_1, deduped_14_1[j_5] ) * hoisted_2_4[j_5];
                                      end );
                              end );
                          deduped_4_3 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( hoisted_17_1, function ( l_4 )
                                      local hoisted_1_4, hoisted_2_4;
                                      hoisted_2_4 := [ 1 .. l_4 - 1 ];
                                      hoisted_1_4 := deduped_61_1[l_4];
                                      return Concatenation( List( deduped_8_2, function ( i_5 )
                                                local hoisted_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5;
                                                hoisted_4_5 := [ 1 .. deduped_5_2[i_5] ];
                                                hoisted_3_5 := Sum( Concatenation( deduped_3_3{[ 1 .. i_5 - 1 ]} ) );
                                                hoisted_2_5 := deduped_3_3[i_5];
                                                hoisted_1_5 := deduped_2_3[i_5];
                                                return Concatenation( List( deduped_15_1, function ( j_6 )
                                                          local hoisted_1_6, hoisted_2_6, hoisted_4_6, hoisted_5_6, deduped_6_6, deduped_7_6;
                                                          deduped_7_6 := hoisted_1_5[j_6];
                                                          deduped_6_6 := deduped_14_1[j_6];
                                                          hoisted_5_6 := [ 1 .. Component( hoisted_1_4, deduped_6_6 ) * deduped_7_6 ];
                                                          hoisted_4_6 := Sum( List( hoisted_2_4, function ( m_7 )
                                                                      return Component( deduped_61_1[m_7], deduped_6_6 );
                                                                  end ) ) * deduped_7_6;
                                                          hoisted_2_6 := hoisted_3_5 + Sum( hoisted_2_5{[ 1 .. j_6 - 1 ]} );
                                                          hoisted_1_6 := Component( deduped_57_1, deduped_6_6 ) * deduped_7_6;
                                                          return Concatenation( List( hoisted_4_5, function ( m_7 )
                                                                    local hoisted_1_7;
                                                                    hoisted_1_7 := hoisted_2_6 + (m_7 - 1) * hoisted_1_6 + hoisted_4_6;
                                                                    return List( hoisted_5_6, function ( n_8 )
                                                                            return hoisted_1_7 + n_8;
                                                                        end );
                                                                end ) );
                                                      end ) );
                                            end ) );
                                  end ) ) );
                          return ListPerm( PermList( deduped_4_3 ) ^ -1, Length( deduped_4_3 ) );
                      end ) ) );
              return List( [ 1 .. deduped_1_1[i_2] ], function ( j_3 )
                      return hoisted_9_2;
                  end );
          end ) );
    deduped_56_1 := SGREPS_PreComposeMorphismPermutationsWithSameSupport( cat_1, NTuple( 3, deduped_79_1, deduped_80_1, List( deduped_76_1, function ( k_2 )
                local deduped_1_2, hoisted_2_2;
                deduped_1_2 := deduped_19_1[k_2];
                hoisted_2_2 := List( deduped_21_1, function ( i_3 )
                        local deduped_1_3, deduped_2_3;
                        deduped_2_3 := deduped_18_1[i_3];
                        deduped_1_3 := deduped_2_3[2];
                        return [ 0, Sum( List( deduped_2_3[3], Length ){Positions( deduped_1_3, deduped_1_2 )} ) ][BooleanToInteger( deduped_1_2 in deduped_1_3 ) + 1];
                    end );
                return Concatenation( List( deduped_21_1, function ( i_3 )
                          local hoisted_1_3, deduped_2_3, deduped_3_3;
                          deduped_3_3 := deduped_18_1[i_3];
                          deduped_2_3 := deduped_3_3[2];
                          hoisted_1_3 := Sum( hoisted_2_2{[ 1 .. i_3 - 1 ]} );
                          return List( [ hoisted_20_1, Concatenation( deduped_3_3[3]{Positions( deduped_2_3, deduped_1_2 )} ) ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1], function ( i_4 )
                                  return i_4 + hoisted_1_3;
                              end );
                      end ) );
            end ) ), NTuple( 3, deduped_79_1, deduped_80_1, List( deduped_76_1, function ( i_2 )
                local hoisted_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                hoisted_1_2 := deduped_82_1[deduped_19_1[CAP_JIT_INCOMPLETE_LOGIC( i_2 )]];
                deduped_2_2 := List( deduped_28_1, function ( i_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := deduped_82_1[deduped_24_1[i_3]];
                        return List( deduped_27_1, function ( j_4 )
                                return hoisted_25_1[j_4] * ScalarProduct( hoisted_1_2, hoisted_1_3 * deduped_82_1[hoisted_26_1[j_4]] );
                            end );
                    end );
                deduped_3_2 := List( deduped_28_1, function ( i_3 )
                        local hoisted_1_3, hoisted_2_3;
                        hoisted_2_3 := Component( deduped_58_1, deduped_24_1[i_3] );
                        hoisted_1_3 := deduped_2_2[i_3];
                        return List( deduped_27_1, function ( j_4 )
                                return hoisted_2_3 * hoisted_1_3[j_4];
                            end );
                    end );
                deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( hoisted_30_1, function ( l_3 )
                            local hoisted_1_3, hoisted_2_3;
                            hoisted_2_3 := [ 1 .. l_3 - 1 ];
                            hoisted_1_3 := deduped_84_1[l_3];
                            return Concatenation( List( deduped_28_1, function ( i_4 )
                                      local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_6_4, deduped_7_4;
                                      deduped_7_4 := deduped_24_1[i_4];
                                      hoisted_6_4 := Sum( List( hoisted_2_3, function ( m_5 )
                                                return Component( deduped_84_1[m_5], deduped_7_4 );
                                            end ) );
                                      hoisted_4_4 := Sum( Concatenation( deduped_3_2{[ 1 .. i_4 - 1 ]} ) );
                                      hoisted_3_4 := deduped_3_2[i_4];
                                      hoisted_2_4 := Component( hoisted_1_3, deduped_7_4 );
                                      hoisted_1_4 := deduped_2_2[i_4];
                                      return Concatenation( List( deduped_27_1, function ( j_5 )
                                                local hoisted_1_5, deduped_2_5;
                                                deduped_2_5 := hoisted_1_4[j_5];
                                                hoisted_1_5 := hoisted_4_4 + Sum( hoisted_3_4{[ 1 .. j_5 - 1 ]} ) + hoisted_6_4 * deduped_2_5;
                                                return List( [ 1 .. hoisted_2_4 * deduped_2_5 ], function ( m_6 )
                                                        return hoisted_1_5 + m_6;
                                                    end );
                                            end ) );
                                  end ) );
                        end ) ) );
                return ListPerm( PermList( deduped_4_2 ) ^ -1, Length( deduped_4_2 ) );
            end ) ) );
    deduped_55_1 := deduped_56_1[2];
    deduped_54_1 := Union2( deduped_69_1, deduped_55_1 );
    deduped_53_1 := Union2( deduped_54_1, deduped_74_1 );
    deduped_52_1 := Length( deduped_53_1 );
    hoisted_49_1 := deduped_81_1[3];
    hoisted_51_1 := List( [ 1 .. deduped_81_1[1] ], function ( n_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( HomalgIdentityMatrix( CAP_JIT_INCOMPLETE_LOGIC( hoisted_49_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] ), deduped_85_1 ) );
        end );
    hoisted_44_1 := deduped_56_1[3];
    hoisted_45_1 := List( [ 1 .. deduped_56_1[1] ], function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( n_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( CertainColumns( HomalgIdentityMatrix( Component( r_1, deduped_55_1[deduped_1_2] ), deduped_85_1 ), hoisted_44_1[deduped_1_2] ) );
        end );
    hoisted_37_1 := deduped_73_1[3];
    hoisted_39_1 := List( [ 1 .. deduped_73_1[1] ], function ( n_2 )
            return hoisted_37_1[n_2];
        end );
    deduped_36_1 := [ HomalgZeroMatrix( 0, 0, deduped_85_1 ) ];
    hoisted_31_1 := deduped_78_1[3];
    hoisted_35_1 := List( [ 1 .. deduped_78_1[1] ], function ( n_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( HomalgIdentityMatrix( CAP_JIT_INCOMPLETE_LOGIC( hoisted_31_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )] ), deduped_85_1 ) );
        end );
    hoisted_40_1 := List( [ 1 .. Length( deduped_69_1 ) ], function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_69_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
            return CAP_JIT_INCOMPLETE_LOGIC( [ deduped_36_1, hoisted_35_1{Positions( deduped_72_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_72_1 ) + 1][1] * [ deduped_36_1, hoisted_39_1{Positions( deduped_70_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_70_1 ) + 1][1] );
        end );
    hoisted_42_1 := List( [ 1 .. Length( deduped_69_1 ) ], function ( n_2 )
            return hoisted_40_1[n_2];
        end );
    hoisted_46_1 := List( [ 1 .. Length( deduped_54_1 ) ], function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_54_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
            return CAP_JIT_INCOMPLETE_LOGIC( [ deduped_36_1, hoisted_42_1{Positions( deduped_69_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_69_1 ) + 1][1] * [ deduped_36_1, hoisted_45_1{Positions( deduped_55_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_55_1 ) + 1][1] );
        end );
    hoisted_48_1 := List( [ 1 .. Length( deduped_54_1 ) ], function ( n_2 )
            return hoisted_46_1[n_2];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, TripleOfNrSupportListOfSupportListOfMatrices, NTuple( 3, deduped_52_1, Union2( deduped_54_1, deduped_74_1 ), List( [ 1 .. deduped_52_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_53_1[CAP_JIT_INCOMPLETE_LOGIC( n_2 )];
                return CAP_JIT_INCOMPLETE_LOGIC( [ deduped_36_1, hoisted_48_1{Positions( deduped_54_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_54_1 ) + 1][1] * [ deduped_36_1, hoisted_51_1{Positions( deduped_74_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_74_1 ) + 1][1] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.CoevaluationForDualWithGivenTensorProduct :=
        
########
function ( cat_1, s_1, a_1, r_1 )
    local deduped_1_1, hoisted_3_1, hoisted_4_1, deduped_6_1, hoisted_9_1, deduped_10_1, hoisted_11_1, hoisted_14_1, deduped_15_1, deduped_16_1, hoisted_18_1, hoisted_19_1, deduped_20_1, deduped_21_1, hoisted_22_1, deduped_23_1, hoisted_26_1, deduped_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, deduped_31_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_38_1, hoisted_39_1, hoisted_42_1, deduped_43_1, hoisted_44_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_50_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_64_1, hoisted_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1;
    deduped_107_1 := UnderlyingSplittingField( cat_1 );
    deduped_106_1 := DecompositionIntoSimpleObjects( a_1 );
    deduped_105_1 := TripleOfNrSupportListOfSupportListOfRanks( a_1 );
    deduped_104_1 := UnderlyingIrreducibleCharacters( cat_1 );
    deduped_103_1 := TripleOfNrSupportListOfSupportListOfRanks( r_1 );
    deduped_102_1 := Support( r_1 );
    deduped_101_1 := NrSupport( r_1 );
    deduped_100_1 := TripleOfNrSupportListOfSupportListOfRanks( s_1 );
    deduped_99_1 := [ 1 .. NrSupport( a_1 ) ];
    deduped_98_1 := [ 1 .. NrSupport( r_1 ) ];
    deduped_97_1 := deduped_105_1[1];
    deduped_96_1 := deduped_103_1[2];
    deduped_95_1 := TripleOfNrSupportListOfSupportListOfMatrices( SGREPS_CoevaluationForDual_1_Morphism( cat_1, s_1, a_1, r_1 ) );
    deduped_94_1 := deduped_100_1[2];
    deduped_93_1 := [ 1 .. deduped_103_1[1] ];
    deduped_92_1 := [ 1 .. deduped_100_1[1] ];
    deduped_91_1 := [ 1 .. deduped_97_1 ];
    deduped_90_1 := deduped_95_1[2];
    deduped_89_1 := Union2( deduped_94_1, deduped_90_1 );
    deduped_88_1 := Union( List( deduped_106_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfRanks( x_2 )[2];
          end ) );
    deduped_87_1 := [ 1 .. Length( deduped_89_1 ) ];
    deduped_86_1 := Length( deduped_88_1 );
    hoisted_4_1 := deduped_105_1[2];
    deduped_85_1 := List( deduped_91_1, function ( i_2 )
            return SafeUniquePosition( deduped_104_1, ComplexConjugate( deduped_104_1[hoisted_4_1[i_2]] ) );
        end );
    deduped_84_1 := [ 1 .. deduped_86_1 ];
    deduped_83_1 := SortingPerm( deduped_85_1 );
    deduped_82_1 := Permuted( deduped_105_1[3], deduped_83_1 );
    deduped_81_1 := Permuted( deduped_85_1, deduped_83_1 );
    deduped_10_1 := [ 0 ];
    hoisted_26_1 := List( deduped_84_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_88_1[n_2];
            return Sum( List( deduped_106_1, function ( x_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3;
                      deduped_3_3 := TripleOfNrSupportListOfSupportListOfRanks( x_3 );
                      deduped_2_3 := deduped_3_3[2];
                      hoisted_1_3 := deduped_3_3[3];
                      return [ deduped_10_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                        return hoisted_1_3[n_4];
                                    end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                  end ) );
        end );
    deduped_80_1 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_86_1, deduped_88_1, List( deduped_84_1, function ( n_2 )
                return hoisted_26_1[n_2];
            end ) ) );
    deduped_79_1 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_97_1, deduped_81_1, deduped_82_1 ) );
    deduped_78_1 := DecompositionIntoSimpleObjects( deduped_79_1 );
    deduped_77_1 := Union( List( deduped_78_1, function ( x_2 )
              return TripleOfNrSupportListOfSupportListOfRanks( x_2 )[2];
          end ) );
    deduped_76_1 := Length( deduped_77_1 );
    deduped_75_1 := [ 1 .. deduped_76_1 ];
    hoisted_14_1 := List( deduped_75_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_77_1[n_2];
            return Sum( List( deduped_78_1, function ( x_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3;
                      deduped_3_3 := TripleOfNrSupportListOfSupportListOfRanks( x_3 );
                      deduped_2_3 := deduped_3_3[2];
                      hoisted_1_3 := deduped_3_3[3];
                      return [ deduped_10_1, List( [ 1 .. deduped_3_3[1] ], function ( n_4 )
                                        return hoisted_1_3[n_4];
                                    end ){Positions( deduped_2_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1][1];
                  end ) );
        end );
    deduped_70_1 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_76_1, deduped_77_1, List( deduped_75_1, function ( n_2 )
                return hoisted_14_1[n_2];
            end ) ) );
    hoisted_33_1 := [ 1 .. Length( DecompositionIntoSimpleObjects( a_1 ) ) ];
    deduped_31_1 := [ 1 .. NrSupport( deduped_80_1 ) ];
    deduped_30_1 := [ 1 .. NrSupport( deduped_79_1 ) ];
    hoisted_29_1 := Support( deduped_79_1 );
    hoisted_28_1 := Components( deduped_79_1 );
    deduped_27_1 := Support( deduped_80_1 );
    deduped_21_1 := Support( r_1 );
    hoisted_34_1 := List( deduped_98_1, function ( k_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            hoisted_1_2 := deduped_104_1[deduped_21_1[k_2]];
            deduped_2_2 := List( deduped_31_1, function ( i_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := deduped_104_1[deduped_27_1[i_3]];
                    return List( deduped_30_1, function ( j_4 )
                            return hoisted_28_1[j_4] * ScalarProduct( hoisted_1_2, hoisted_1_3 * deduped_104_1[hoisted_29_1[j_4]] );
                        end );
                end );
            deduped_3_2 := List( deduped_31_1, function ( i_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_2_3 := Component( deduped_80_1, deduped_27_1[i_3] );
                    hoisted_1_3 := deduped_2_2[i_3];
                    return List( deduped_30_1, function ( j_4 )
                            return hoisted_2_3 * hoisted_1_3[j_4];
                        end );
                end );
            return Concatenation( List( hoisted_33_1, function ( l_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_2_3 := [ 1 .. l_3 - 1 ];
                      hoisted_1_3 := deduped_106_1[l_3];
                      return Concatenation( List( deduped_31_1, function ( i_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_6_4, deduped_7_4;
                                deduped_7_4 := deduped_27_1[i_4];
                                hoisted_6_4 := Sum( List( hoisted_2_3, function ( m_5 )
                                          return Component( deduped_106_1[m_5], deduped_7_4 );
                                      end ) );
                                hoisted_4_4 := Sum( Concatenation( deduped_3_2{[ 1 .. i_4 - 1 ]} ) );
                                hoisted_3_4 := deduped_3_2[i_4];
                                hoisted_2_4 := Component( hoisted_1_3, deduped_7_4 );
                                hoisted_1_4 := deduped_2_2[i_4];
                                return Concatenation( List( deduped_30_1, function ( j_5 )
                                          local hoisted_1_5, deduped_2_5;
                                          deduped_2_5 := hoisted_1_4[j_5];
                                          hoisted_1_5 := hoisted_4_4 + Sum( hoisted_3_4{[ 1 .. j_5 - 1 ]} ) + hoisted_6_4 * deduped_2_5;
                                          return List( [ 1 .. hoisted_2_4 * deduped_2_5 ], function ( m_6 )
                                                  return hoisted_1_5 + m_6;
                                              end );
                                      end ) );
                            end ) );
                  end ) );
        end );
    deduped_1_1 := Components( a_1 );
    deduped_23_1 := [ 1 .. Sum( List( deduped_99_1, function ( i_2 )
                  return deduped_1_1[i_2];
              end ) ) ];
    hoisted_22_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsInt ) );
        end );
    hoisted_18_1 := [ 1 .. Length( deduped_78_1 ) ];
    deduped_16_1 := [ 1 .. NrSupport( deduped_70_1 ) ];
    deduped_15_1 := Support( deduped_70_1 );
    hoisted_11_1 := [ 1 ];
    hoisted_9_1 := List( deduped_91_1, function ( n_2 )
            return deduped_82_1[n_2];
        end );
    deduped_6_1 := [ 1 .. Length( deduped_104_1 ) ];
    hoisted_3_1 := Support( a_1 );
    hoisted_19_1 := List( deduped_99_1, function ( i_2 )
            local deduped_1_2, hoisted_3_2, hoisted_4_2, hoisted_6_2, hoisted_7_2, deduped_8_2, hoisted_10_2, deduped_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2;
            deduped_23_2 := hoisted_3_1[i_2];
            deduped_22_2 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, 1, [ deduped_23_2 ], hoisted_11_1 ) );
            deduped_1_2 := deduped_104_1[deduped_23_2];
            deduped_21_2 := Union( List( deduped_91_1, function ( j_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := deduped_1_2 * deduped_104_1[deduped_81_1[j_3]];
                      hoisted_2_3 := List( deduped_6_1, function ( n_4 )
                              return IsZero( ScalarProduct( deduped_104_1[n_4], hoisted_1_3 ) );
                          end );
                      return Filtered( deduped_6_1, function ( i_4 )
                              return not hoisted_2_3[i_4];
                          end );
                  end ) );
            deduped_20_2 := [ 1 .. Length( deduped_21_2 ) ];
            deduped_19_2 := Union( [ deduped_21_2 ] );
            deduped_18_2 := Length( deduped_19_2 );
            deduped_17_2 := [ 1 .. deduped_18_2 ];
            hoisted_3_2 := List( deduped_20_2, function ( n_3 )
                    local deduped_1_3;
                    deduped_1_3 := deduped_21_2[n_3];
                    return Sum( List( deduped_91_1, function ( j_4 )
                              local deduped_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4, deduped_8_4;
                              deduped_1_4 := deduped_1_2 * deduped_104_1[deduped_81_1[j_4]];
                              hoisted_2_4 := List( deduped_6_1, function ( n_5 )
                                      return IsZero( ScalarProduct( deduped_104_1[n_5], deduped_1_4 ) );
                                  end );
                              deduped_8_4 := Filtered( deduped_6_1, function ( i_5 )
                                      return not hoisted_2_4[i_5];
                                  end );
                              deduped_7_4 := [ 1 .. Length( deduped_8_4 ) ];
                              hoisted_4_4 := 1 * hoisted_9_1[j_4];
                              hoisted_3_4 := List( deduped_6_1, function ( n_5 )
                                        return ScalarProduct( deduped_104_1[n_5], deduped_1_4 );
                                    end ){deduped_8_4};
                              hoisted_5_4 := List( deduped_7_4, function ( n_5 )
                                      return hoisted_3_4[n_5] * hoisted_4_4;
                                  end );
                              hoisted_6_4 := List( deduped_7_4, function ( n_5 )
                                      return hoisted_5_4[n_5];
                                  end );
                              return [ deduped_10_1, List( deduped_7_4, function ( n_5 )
                                                return hoisted_6_4[n_5];
                                            end ){Positions( deduped_8_4, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_8_4 ) + 1][1];
                          end ) );
                end );
            hoisted_4_2 := List( deduped_20_2, function ( n_3 )
                    return hoisted_3_2[n_3];
                end );
            hoisted_6_2 := List( deduped_20_2, function ( n_3 )
                    return hoisted_4_2[n_3];
                end );
            hoisted_7_2 := List( deduped_17_2, function ( n_3 )
                    local deduped_1_3;
                    deduped_1_3 := deduped_19_2[n_3];
                    return Sum( [ [ deduped_10_1, hoisted_6_2{Positions( deduped_21_2, deduped_1_3 )} ][BooleanToInteger( deduped_1_3 in deduped_21_2 ) + 1][1] ] );
                end );
            deduped_16_2 := CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfRanks, NTuple( 3, deduped_18_2, deduped_19_2, List( deduped_17_2, function ( n_3 )
                        return hoisted_7_2[n_3];
                    end ) ) );
            deduped_15_2 := Support( deduped_16_2 );
            deduped_14_2 := NrSupport( deduped_16_2 );
            deduped_13_2 := [ 1 .. deduped_14_2 ];
            deduped_11_2 := [ 1 .. NrSupport( deduped_22_2 ) ];
            hoisted_10_2 := Support( deduped_22_2 );
            deduped_8_2 := Components( deduped_22_2 );
            hoisted_12_2 := List( deduped_13_2, function ( k_3 )
                    local hoisted_1_3, deduped_2_3, deduped_3_3;
                    hoisted_1_3 := deduped_104_1[deduped_15_2[k_3]];
                    deduped_2_3 := List( deduped_11_2, function ( i_4 )
                            local hoisted_1_4;
                            hoisted_1_4 := deduped_104_1[hoisted_10_2[i_4]];
                            return List( deduped_16_1, function ( j_5 )
                                    return ScalarProduct( hoisted_1_3, hoisted_1_4 * deduped_104_1[deduped_15_1[j_5]] );
                                end );
                        end );
                    deduped_3_3 := List( deduped_11_2, function ( i_4 )
                            local hoisted_1_4, hoisted_2_4;
                            hoisted_2_4 := deduped_2_3[i_4];
                            hoisted_1_4 := deduped_8_2[i_4];
                            return List( deduped_16_1, function ( j_5 )
                                    return hoisted_1_4 * Component( deduped_70_1, deduped_15_1[j_5] ) * hoisted_2_4[j_5];
                                end );
                        end );
                    return Concatenation( List( hoisted_18_1, function ( l_4 )
                              local hoisted_1_4, hoisted_2_4;
                              hoisted_2_4 := [ 1 .. l_4 - 1 ];
                              hoisted_1_4 := deduped_78_1[l_4];
                              return Concatenation( List( deduped_11_2, function ( i_5 )
                                        local hoisted_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5;
                                        hoisted_4_5 := [ 1 .. deduped_8_2[i_5] ];
                                        hoisted_3_5 := Sum( Concatenation( deduped_3_3{[ 1 .. i_5 - 1 ]} ) );
                                        hoisted_2_5 := deduped_3_3[i_5];
                                        hoisted_1_5 := deduped_2_3[i_5];
                                        return Concatenation( List( deduped_16_1, function ( j_6 )
                                                  local hoisted_1_6, hoisted_2_6, hoisted_4_6, hoisted_5_6, deduped_6_6, deduped_7_6;
                                                  deduped_7_6 := hoisted_1_5[j_6];
                                                  deduped_6_6 := deduped_15_1[j_6];
                                                  hoisted_5_6 := [ 1 .. Component( hoisted_1_4, deduped_6_6 ) * deduped_7_6 ];
                                                  hoisted_4_6 := Sum( List( hoisted_2_4, function ( m_7 )
                                                              return Component( deduped_78_1[m_7], deduped_6_6 );
                                                          end ) ) * deduped_7_6;
                                                  hoisted_2_6 := hoisted_3_5 + Sum( hoisted_2_5{[ 1 .. j_6 - 1 ]} );
                                                  hoisted_1_6 := Component( deduped_70_1, deduped_6_6 ) * deduped_7_6;
                                                  return Concatenation( List( hoisted_4_5, function ( m_7 )
                                                            local hoisted_1_7;
                                                            hoisted_1_7 := hoisted_2_6 + (m_7 - 1) * hoisted_1_6 + hoisted_4_6;
                                                            return List( hoisted_5_6, function ( n_8 )
                                                                    return hoisted_1_7 + n_8;
                                                                end );
                                                        end ) );
                                              end ) );
                                    end ) );
                          end ) );
                end );
            return NTuple( 3, deduped_14_2, deduped_15_2, List( deduped_13_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_12_2[i_3];
                      return ListPerm( PermList( deduped_1_3 ) ^ -1, Length( deduped_1_3 ) );
                  end ) );
        end );
    deduped_20_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := hoisted_19_1[i_2];
              return List( [ 1 .. deduped_1_1[i_2] ], function ( j_3 )
                      return hoisted_1_2;
                  end );
          end ) );
    deduped_74_1 := SGREPS_PreComposeMorphismPermutationsWithSameSupport( cat_1, NTuple( 3, deduped_101_1, deduped_102_1, List( deduped_98_1, function ( k_2 )
                local deduped_1_2, hoisted_2_2;
                deduped_1_2 := deduped_21_1[k_2];
                hoisted_2_2 := List( deduped_23_1, function ( i_3 )
                        local deduped_1_3, deduped_2_3;
                        deduped_2_3 := deduped_20_1[i_3];
                        deduped_1_3 := deduped_2_3[2];
                        return [ 0, Sum( List( deduped_2_3[3], Length ){Positions( deduped_1_3, deduped_1_2 )} ) ][BooleanToInteger( deduped_1_2 in deduped_1_3 ) + 1];
                    end );
                return Concatenation( List( deduped_23_1, function ( i_3 )
                          local hoisted_1_3, deduped_2_3, deduped_3_3;
                          deduped_3_3 := deduped_20_1[i_3];
                          deduped_2_3 := deduped_3_3[2];
                          hoisted_1_3 := Sum( hoisted_2_2{[ 1 .. i_3 - 1 ]} );
                          return List( [ hoisted_22_1, Concatenation( deduped_3_3[3]{Positions( deduped_2_3, deduped_1_2 )} ) ][BooleanToInteger( deduped_1_2 in deduped_2_3 ) + 1], function ( i_4 )
                                  return i_4 + hoisted_1_3;
                              end );
                      end ) );
            end ) ), NTuple( 3, deduped_101_1, deduped_102_1, List( deduped_98_1, function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := hoisted_34_1[i_2];
                return ListPerm( PermList( deduped_1_2 ) ^ -1, Length( deduped_1_2 ) );
            end ) ) );
    deduped_73_1 := deduped_74_1[2];
    deduped_72_1 := [ 1 .. deduped_74_1[1] ];
    deduped_71_1 := Union2( deduped_89_1, deduped_73_1 );
    deduped_69_1 := Union2( deduped_71_1, deduped_96_1 );
    deduped_68_1 := [ 1 .. Length( deduped_71_1 ) ];
    deduped_67_1 := Length( deduped_69_1 );
    deduped_66_1 := [ 1 .. deduped_67_1 ];
    hoisted_59_1 := deduped_103_1[3];
    hoisted_60_1 := List( deduped_93_1, function ( n_2 )
            return hoisted_59_1[n_2];
        end );
    hoisted_61_1 := List( deduped_93_1, function ( n_2 )
            return HomalgIdentityMatrix( hoisted_60_1[n_2], deduped_107_1 );
        end );
    hoisted_62_1 := List( deduped_93_1, function ( n_2 )
            return hoisted_61_1[n_2];
        end );
    hoisted_64_1 := List( deduped_93_1, function ( n_2 )
            return hoisted_62_1[n_2];
        end );
    hoisted_52_1 := deduped_74_1[3];
    hoisted_53_1 := List( deduped_72_1, function ( i_2 )
            return CertainColumns( HomalgIdentityMatrix( Component( r_1, deduped_73_1[i_2] ), deduped_107_1 ), hoisted_52_1[i_2] );
        end );
    hoisted_54_1 := List( deduped_72_1, function ( n_2 )
            return hoisted_53_1[n_2];
        end );
    hoisted_44_1 := deduped_95_1[3];
    hoisted_46_1 := List( [ 1 .. deduped_95_1[1] ], function ( n_2 )
            return hoisted_44_1[n_2];
        end );
    deduped_43_1 := [ HomalgZeroMatrix( 0, 0, deduped_107_1 ) ];
    hoisted_35_1 := deduped_100_1[3];
    hoisted_36_1 := List( deduped_92_1, function ( n_2 )
            return hoisted_35_1[n_2];
        end );
    hoisted_38_1 := List( deduped_92_1, function ( n_2 )
            return HomalgIdentityMatrix( hoisted_36_1[n_2], deduped_107_1 );
        end );
    hoisted_39_1 := List( deduped_92_1, function ( n_2 )
            return hoisted_38_1[n_2];
        end );
    hoisted_42_1 := List( deduped_92_1, function ( n_2 )
            return hoisted_39_1[n_2];
        end );
    hoisted_47_1 := List( deduped_87_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_89_1[n_2];
            return [ deduped_43_1, hoisted_42_1{Positions( deduped_94_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_94_1 ) + 1][1] * [ deduped_43_1, hoisted_46_1{Positions( deduped_90_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_90_1 ) + 1][1];
        end );
    hoisted_48_1 := List( deduped_87_1, function ( n_2 )
            return hoisted_47_1[n_2];
        end );
    hoisted_50_1 := List( [ 1 .. Length( deduped_89_1 ) ], function ( n_2 )
            return hoisted_48_1[n_2];
        end );
    hoisted_55_1 := List( deduped_68_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_71_1[n_2];
            return [ deduped_43_1, hoisted_50_1{Positions( deduped_89_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_89_1 ) + 1][1] * [ deduped_43_1, hoisted_54_1{Positions( deduped_73_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_73_1 ) + 1][1];
        end );
    hoisted_56_1 := List( deduped_68_1, function ( n_2 )
            return hoisted_55_1[n_2];
        end );
    hoisted_58_1 := List( [ 1 .. Length( deduped_71_1 ) ], function ( n_2 )
            return hoisted_56_1[n_2];
        end );
    hoisted_65_1 := List( deduped_66_1, function ( n_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_69_1[n_2];
            return [ deduped_43_1, hoisted_58_1{Positions( deduped_71_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_71_1 ) + 1][1] * [ deduped_43_1, hoisted_64_1{Positions( deduped_96_1, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_96_1 ) + 1][1];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, TripleOfNrSupportListOfSupportListOfMatrices, NTuple( 3, deduped_67_1, Union2( deduped_71_1, deduped_96_1 ), List( deduped_66_1, function ( n_2 )
                return hoisted_65_1[n_2];
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
