# SPDX-License-Identifier: GPL-2.0-or-later
# AdditiveClosuresForCAP: Additive closures for pre-additive categories
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_DirectSumOfAdditiveCategory_Rows_Field", function ( cat )
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfObjects( arg3_1 );
    deduped_6_1 := TripleOfNrSupportListOfSupportListOfObjects( arg2_1 );
    deduped_5_1 := deduped_6_1[1];
    hoisted_4_1 := List( deduped_7_1[3], RankOfObject );
    hoisted_3_1 := List( deduped_6_1[3], RankOfObject );
    return deduped_5_1 = deduped_7_1[1] and deduped_6_1[2] = deduped_7_1[2] and ForAll( [ 1 .. deduped_5_1 ], function ( i_2 )
              return hoisted_3_1[i_2] = hoisted_4_1[i_2];
          end );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfMorphisms( arg3_1 );
    deduped_6_1 := TripleOfNrSupportListOfSupportListOfMorphisms( arg2_1 );
    deduped_5_1 := deduped_6_1[1];
    hoisted_4_1 := List( deduped_7_1[3], UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1[3], UnderlyingMatrix );
    return deduped_5_1 = deduped_7_1[1] and deduped_6_1[2] = deduped_7_1[2] and ForAll( [ 1 .. deduped_5_1 ], function ( i_2 )
              return hoisted_3_1[i_2] = hoisted_4_1[i_2];
          end );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfMorphisms( arg3_1 );
    deduped_6_1 := TripleOfNrSupportListOfSupportListOfMorphisms( arg2_1 );
    deduped_5_1 := deduped_6_1[1];
    hoisted_4_1 := List( deduped_7_1[3], UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1[3], UnderlyingMatrix );
    return deduped_5_1 = deduped_7_1[1] and deduped_6_1[2] = deduped_7_1[2] and ForAll( [ 1 .. deduped_5_1 ], function ( i_2 )
              return hoisted_3_1[i_2] = hoisted_4_1[i_2];
          end );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := TripleOfNrSupportListOfSupportListOfObjects( arg2_1 );
    deduped_8_1 := deduped_9_1[3];
    deduped_7_1 := deduped_9_1[2];
    deduped_6_1 := deduped_9_1[1];
    deduped_5_1 := [ 1 .. deduped_6_1 ];
    deduped_4_1 := List( deduped_8_1, RankOfObject );
    hoisted_3_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return IsInt( RankOfObject( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := NrSummands( cat_1 );
    if deduped_6_1 <> Length( deduped_7_1 ) or deduped_6_1 <> Length( deduped_8_1 ) then
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
                 if not hoisted_3_1[n_2] then
                     return false;
                 elif not deduped_4_1[n_2] >= 0 then
                     return false;
                 else
                     return true;
                 fi;
                 return;
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
    local hoisted_1_1, hoisted_3_1, hoisted_4_1, deduped_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_11_1 := deduped_12_1[3];
    deduped_10_1 := deduped_12_1[2];
    deduped_9_1 := deduped_12_1[1];
    deduped_8_1 := [ 1 .. deduped_9_1 ];
    deduped_7_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_6_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return NumberColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_5_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return NumberRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return IsHomalgMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := NrSummands( cat_1 );
    if deduped_9_1 <> Length( deduped_10_1 ) or deduped_9_1 <> Length( deduped_11_1 ) then
        return false;
    elif not ForAll( deduped_10_1, function ( n_2 )
                 return 1 <= n_2 and n_2 <= hoisted_1_1;
             end ) then
        return false;
    elif not ForAll( [ 1 .. deduped_9_1 - 1 ], function ( n_2 )
                 return deduped_10_1[n_2] < deduped_10_1[n_2 + 1];
             end ) then
        return false;
    elif not ForAll( deduped_8_1, function ( n_2 )
                 if not hoisted_3_1[n_2] then
                     return false;
                 elif not hoisted_4_1[n_2] = deduped_5_1[n_2] then
                     return false;
                 elif not hoisted_6_1[n_2] = deduped_7_1[n_2] then
                     return false;
                 else
                     return true;
                 fi;
                 return;
             end ) then
        return false;
    elif ForAny( deduped_8_1, function ( n_2 )
              return deduped_5_1[n_2] = 0 and deduped_7_1[n_2] = 0;
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
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, TripleOfNrSupportListOfSupportListOfMorphisms, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return TripleOfNrSupportListOfSupportListOfObjects( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return TripleOfNrSupportListOfSupportListOfMorphisms( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfObjects( a_1 );
    deduped_6_1 := deduped_7_1[3];
    deduped_5_1 := deduped_7_1[1];
    hoisted_4_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := List( deduped_6_1, RankOfObject );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_5_1, deduped_7_1[2], List( [ 1 .. deduped_5_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_6_1[n_2];
                return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[n_2], hoisted_3_1 ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_5_1, deduped_6_1, hoisted_8_1, hoisted_9_1, deduped_10_1, hoisted_11_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1;
    deduped_21_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_20_1 := TripleOfNrSupportListOfSupportListOfMorphisms( beta_1 );
    deduped_19_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_18_1 := deduped_20_1[3];
    deduped_17_1 := deduped_19_1[3];
    deduped_16_1 := deduped_20_1[2];
    deduped_15_1 := deduped_19_1[2];
    deduped_14_1 := Union2( deduped_15_1, deduped_16_1 );
    deduped_13_1 := Length( deduped_14_1 );
    hoisted_11_1 := List( deduped_18_1, UnderlyingMatrix );
    deduped_10_1 := [ HomalgZeroMatrix( 0, 0, CommutativeRingOfLinearCategory( cat_1 ) ) ];
    hoisted_9_1 := List( deduped_17_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_18_1, Range );
    deduped_6_1 := [ CreateCapCategoryObjectWithAttributes( deduped_21_1, RankOfObject, 0 ) ];
    hoisted_5_1 := List( deduped_17_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( beta_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_13_1, deduped_14_1, List( [ 1 .. deduped_13_1 ], function ( n_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                deduped_5_2 := deduped_14_1[n_2];
                deduped_4_2 := Positions( deduped_16_1, deduped_5_2 );
                deduped_3_2 := Positions( deduped_15_1, deduped_5_2 );
                deduped_2_2 := BooleanToInteger( deduped_5_2 in deduped_16_1 ) + 1;
                deduped_1_2 := BooleanToInteger( deduped_5_2 in deduped_15_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_21_1, [ deduped_6_1, hoisted_5_1{deduped_3_2} ][deduped_1_2][1], [ deduped_6_1, hoisted_8_1{deduped_4_2} ][deduped_2_2][1], UnderlyingMatrix, [ deduped_10_1, hoisted_9_1{deduped_3_2} ][deduped_1_2][1] * [ deduped_10_1, hoisted_11_1{deduped_4_2} ][deduped_2_2][1] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddZeroMorphism( cat,
        
########
function ( cat_1, a_1, b_1 )
    local deduped_3_1, hoisted_6_1, deduped_7_1, hoisted_8_1, hoisted_9_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1;
    deduped_18_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfObjects( b_1 );
    deduped_16_1 := TripleOfNrSupportListOfSupportListOfObjects( a_1 );
    deduped_15_1 := deduped_17_1[3];
    deduped_14_1 := deduped_16_1[3];
    deduped_13_1 := deduped_17_1[2];
    deduped_12_1 := deduped_16_1[2];
    deduped_11_1 := Union2( deduped_12_1, deduped_13_1 );
    hoisted_9_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_8_1 := List( deduped_15_1, RankOfObject );
    deduped_7_1 := [ 0 ];
    hoisted_6_1 := List( deduped_14_1, RankOfObject );
    deduped_3_1 := [ CreateCapCategoryObjectWithAttributes( deduped_18_1, RankOfObject, 0 ) ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, Length( deduped_11_1 ), deduped_11_1, List( deduped_11_1, function ( i_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := Positions( deduped_13_1, i_2 );
                deduped_3_2 := Positions( deduped_12_1, i_2 );
                deduped_2_2 := BooleanToInteger( i_2 in deduped_13_1 ) + 1;
                deduped_1_2 := BooleanToInteger( i_2 in deduped_12_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_18_1, [ deduped_3_1, deduped_14_1{deduped_3_2} ][deduped_1_2][1], [ deduped_3_1, deduped_15_1{deduped_4_2} ][deduped_2_2][1], UnderlyingMatrix, HomalgZeroMatrix( [ deduped_7_1, hoisted_6_1{deduped_3_2} ][deduped_1_2][1], [ deduped_7_1, hoisted_8_1{deduped_4_2} ][deduped_2_2][1], hoisted_9_1 ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsZeroForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := TripleOfNrSupportListOfSupportListOfMorphisms( arg2_1 );
    hoisted_1_1 := List( deduped_2_1[3], function ( logic_new_func_x_2 )
            return IsZero( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return ForAll( [ 1 .. deduped_2_1[1] ], function ( n_2 )
            return hoisted_1_1[n_2];
        end );
end
########
        
    , 100 );
    
    ##
    AddAdditionForMorphisms( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_5_1, deduped_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, hoisted_11_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1;
    deduped_20_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_19_1 := TripleOfNrSupportListOfSupportListOfMorphisms( beta_1 );
    deduped_18_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_17_1 := deduped_18_1[3];
    deduped_16_1 := deduped_19_1[2];
    deduped_15_1 := deduped_18_1[2];
    deduped_14_1 := Union2( deduped_15_1, deduped_16_1 );
    deduped_13_1 := Length( deduped_14_1 );
    hoisted_11_1 := List( deduped_19_1[3], UnderlyingMatrix );
    deduped_9_1 := [ HomalgZeroMatrix( 0, 0, CommutativeRingOfLinearCategory( cat_1 ) ) ];
    hoisted_8_1 := List( deduped_17_1, UnderlyingMatrix );
    hoisted_7_1 := List( deduped_17_1, Range );
    deduped_6_1 := [ CreateCapCategoryObjectWithAttributes( deduped_20_1, RankOfObject, 0 ) ];
    hoisted_5_1 := List( deduped_17_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( alpha_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_13_1, deduped_14_1, List( [ 1 .. deduped_13_1 ], function ( n_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := deduped_14_1[n_2];
                deduped_2_2 := Positions( deduped_15_1, deduped_3_2 );
                deduped_1_2 := BooleanToInteger( deduped_3_2 in deduped_15_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_20_1, [ deduped_6_1, hoisted_5_1{deduped_2_2} ][deduped_1_2][1], [ deduped_6_1, hoisted_7_1{deduped_2_2} ][deduped_1_2][1], UnderlyingMatrix, [ deduped_9_1, hoisted_8_1{deduped_2_2} ][deduped_1_2][1] + [ deduped_9_1, hoisted_11_1{Positions( deduped_16_1, deduped_3_2 )} ][BooleanToInteger( deduped_3_2 in deduped_16_1 ) + 1][1] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_6_1 := deduped_7_1[3];
    deduped_5_1 := deduped_7_1[1];
    hoisted_4_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return - UnderlyingMatrix( logic_new_func_x_2 );
        end );
    hoisted_2_1 := List( deduped_6_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( alpha_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_5_1, deduped_7_1[2], List( [ 1 .. deduped_5_1 ], function ( n_2 )
                return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[n_2], hoisted_2_1[n_2], UnderlyingMatrix, hoisted_3_1[n_2] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddSubtractionForMorphisms( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_3_1, deduped_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, hoisted_8_1, hoisted_10_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1;
    deduped_19_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_18_1 := TripleOfNrSupportListOfSupportListOfMorphisms( beta_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_16_1 := deduped_17_1[3];
    deduped_15_1 := deduped_18_1[2];
    deduped_14_1 := deduped_17_1[2];
    deduped_13_1 := Union2( deduped_14_1, deduped_15_1 );
    deduped_12_1 := Length( deduped_13_1 );
    hoisted_8_1 := List( deduped_18_1[3], function ( logic_new_func_x_2 )
            return - UnderlyingMatrix( logic_new_func_x_2 );
        end );
    hoisted_10_1 := List( [ 1 .. deduped_18_1[1] ], function ( n_2 )
            return hoisted_8_1[n_2];
        end );
    deduped_7_1 := [ HomalgZeroMatrix( 0, 0, CommutativeRingOfLinearCategory( cat_1 ) ) ];
    hoisted_6_1 := List( deduped_16_1, UnderlyingMatrix );
    hoisted_5_1 := List( deduped_16_1, Range );
    deduped_4_1 := [ CreateCapCategoryObjectWithAttributes( deduped_19_1, RankOfObject, 0 ) ];
    hoisted_3_1 := List( deduped_16_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( alpha_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_12_1, deduped_13_1, List( [ 1 .. deduped_12_1 ], function ( n_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := deduped_13_1[n_2];
                deduped_2_2 := Positions( deduped_14_1, deduped_3_2 );
                deduped_1_2 := BooleanToInteger( deduped_3_2 in deduped_14_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_19_1, [ deduped_4_1, hoisted_3_1{deduped_2_2} ][deduped_1_2][1], [ deduped_4_1, hoisted_5_1{deduped_2_2} ][deduped_1_2][1], UnderlyingMatrix, [ deduped_7_1, hoisted_6_1{deduped_2_2} ][deduped_1_2][1] + [ deduped_7_1, hoisted_10_1{Positions( deduped_15_1, deduped_3_2 )} ][BooleanToInteger( deduped_3_2 in deduped_15_1 ) + 1][1] );
            end ) ) );
end
########
        
    , 201 : IsPrecompiledDerivation := true );
    
    ##
    AddZeroObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, NTuple( 3, 0, CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsInt ) );
            end ), [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddDirectSum( cat,
        
########
function ( cat_1, objects_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Union( List( objects_1, function ( obj_2 )
              return TripleOfNrSupportListOfSupportListOfObjects( obj_2 )[2];
          end ) );
    deduped_4_1 := Length( deduped_5_1 );
    hoisted_3_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_2_1 := [ 0 ];
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, NTuple( 3, deduped_4_1, deduped_5_1, List( [ 1 .. deduped_4_1 ], function ( n_2 )
                local deduped_1_2;
                deduped_1_2 := deduped_5_1[n_2];
                return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, Sum( List( objects_1, function ( obj_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                            deduped_1_3 := deduped_2_3[2];
                            return [ hoisted_2_1, List( deduped_2_3[3], RankOfObject ){Positions( deduped_1_3, deduped_1_2 )} ][BooleanToInteger( deduped_1_2 in deduped_1_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectSumFunctorialWithGivenDirectSums( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, hoisted_6_1, hoisted_7_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1;
    deduped_15_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_14_1 := TripleOfNrSupportListOfSupportListOfObjects( Pp_1 );
    deduped_13_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_12_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_11_1 := Union( List( L_1, function ( mor_2 )
              return TripleOfNrSupportListOfSupportListOfMorphisms( mor_2 )[2];
          end ) );
    deduped_10_1 := Length( deduped_11_1 );
    hoisted_7_1 := [ HomalgZeroMatrix( 0, 0, deduped_15_1 ) ];
    hoisted_6_1 := deduped_14_1[3];
    deduped_5_1 := deduped_14_1[2];
    deduped_4_1 := [ CreateCapCategoryObjectWithAttributes( deduped_13_1, RankOfObject, 0 ) ];
    hoisted_3_1 := deduped_12_1[3];
    deduped_2_1 := deduped_12_1[2];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_10_1, deduped_11_1, List( [ 1 .. deduped_10_1 ], function ( n_2 )
                local deduped_2_2;
                deduped_2_2 := deduped_11_1[n_2];
                return CreateCapCategoryMorphismWithAttributes( deduped_13_1, [ deduped_4_1, hoisted_3_1{Positions( deduped_2_1, deduped_2_2 )} ][BooleanToInteger( deduped_2_2 in deduped_2_1 ) + 1][1], [ deduped_4_1, hoisted_6_1{Positions( deduped_5_1, deduped_2_2 )} ][BooleanToInteger( deduped_2_2 in deduped_5_1 ) + 1][1], UnderlyingMatrix, DiagMat( deduped_15_1, List( L_1, function ( morphism_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := TripleOfNrSupportListOfSupportListOfMorphisms( morphism_3 );
                            deduped_1_3 := deduped_2_3[2];
                            return [ hoisted_7_1, List( deduped_2_3[3], UnderlyingMatrix ){Positions( deduped_1_3, deduped_2_2 )} ][BooleanToInteger( deduped_2_2 in deduped_1_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_9_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1;
    deduped_15_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_14_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_13_1 := objects_1[k_1];
    deduped_12_1 := deduped_14_1[2];
    deduped_11_1 := TripleOfNrSupportListOfSupportListOfObjects( CAP_JIT_INCOMPLETE_LOGIC( deduped_13_1 ) );
    hoisted_9_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_8_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_7_1 := [ 1 .. k_1 - 1 ];
    hoisted_6_1 := [ 0 ];
    hoisted_5_1 := deduped_11_1[3];
    deduped_4_1 := deduped_11_1[2];
    deduped_3_1 := [ CreateCapCategoryObjectWithAttributes( deduped_15_1, RankOfObject, 0 ) ];
    hoisted_2_1 := deduped_14_1[3];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, deduped_13_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_14_1[1], deduped_12_1, List( deduped_12_1, function ( i_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := List( objects_1, function ( obj_3 )
                        local deduped_1_3, deduped_2_3;
                        deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                        deduped_1_3 := deduped_2_3[2];
                        return [ hoisted_6_1, List( deduped_2_3[3], RankOfObject ){Positions( deduped_1_3, i_2 )} ][BooleanToInteger( i_2 in deduped_1_3 ) + 1][1];
                    end );
                deduped_1_2 := deduped_2_2[k_1];
                return CreateCapCategoryMorphismWithAttributes( deduped_15_1, [ deduped_3_1, hoisted_2_1{Positions( deduped_12_1, i_2 )} ][BooleanToInteger( i_2 in deduped_12_1 ) + 1][1], CAP_JIT_INCOMPLETE_LOGIC( [ deduped_3_1, hoisted_5_1{Positions( deduped_4_1, i_2 )} ][BooleanToInteger( i_2 in deduped_4_1 ) + 1][1] ), UnderlyingMatrix, UnionOfRows( deduped_8_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_2_2{hoisted_7_1} ), deduped_1_2, deduped_8_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_8_1 ), HomalgZeroMatrix( Sum( deduped_2_2{hoisted_9_1} ), deduped_1_2, deduped_8_1 ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ProjectionInFactorOfDirectSumWithGivenDirectSum :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_7_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_10_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_9_1 := deduped_10_1[2];
    hoisted_7_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_6_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_5_1 := [ 1 .. k_1 - 1 ];
    hoisted_4_1 := [ 0 ];
    deduped_3_1 := [ CreateCapCategoryObjectWithAttributes( deduped_11_1, RankOfObject, 0 ) ];
    hoisted_2_1 := deduped_10_1[3];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_10_1[1], deduped_9_1, List( deduped_9_1, function ( i_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := List( objects_1, function ( obj_3 )
                        local deduped_1_3, deduped_2_3;
                        deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                        deduped_1_3 := deduped_2_3[2];
                        return [ hoisted_4_1, List( deduped_2_3[3], RankOfObject ){Positions( deduped_1_3, i_2 )} ][BooleanToInteger( i_2 in deduped_1_3 ) + 1][1];
                    end );
                deduped_1_2 := deduped_2_2[k_1];
                return CreateCapCategoryMorphismWithAttributes( deduped_11_1, [ deduped_3_1, hoisted_2_1{Positions( deduped_9_1, i_2 )} ][BooleanToInteger( i_2 in deduped_9_1 ) + 1][1], List( objects_1, function ( obj_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                            deduped_1_3 := deduped_2_3[2];
                            return [ deduped_3_1, deduped_2_3[3]{Positions( deduped_1_3, i_2 )} ][BooleanToInteger( i_2 in deduped_1_3 ) + 1][1];
                        end )[k_1], UnderlyingMatrix, UnionOfRows( deduped_6_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_2_2{hoisted_5_1} ), deduped_1_2, deduped_6_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_6_1 ), HomalgZeroMatrix( Sum( deduped_2_2{hoisted_7_1} ), deduped_1_2, deduped_6_1 ) ] ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddInjectionOfCofactorOfDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, hoisted_2_1, deduped_3_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_9_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1;
    deduped_15_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_14_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_13_1 := objects_1[k_1];
    deduped_12_1 := deduped_14_1[2];
    deduped_11_1 := TripleOfNrSupportListOfSupportListOfObjects( CAP_JIT_INCOMPLETE_LOGIC( deduped_13_1 ) );
    hoisted_9_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_8_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_7_1 := [ 1 .. k_1 - 1 ];
    hoisted_6_1 := [ 0 ];
    hoisted_5_1 := deduped_14_1[3];
    deduped_3_1 := [ CreateCapCategoryObjectWithAttributes( deduped_15_1, RankOfObject, 0 ) ];
    hoisted_2_1 := deduped_11_1[3];
    deduped_1_1 := deduped_11_1[2];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_13_1, P_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_14_1[1], deduped_12_1, List( deduped_12_1, function ( i_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := List( objects_1, function ( obj_3 )
                        local deduped_1_3, deduped_2_3;
                        deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                        deduped_1_3 := deduped_2_3[2];
                        return [ hoisted_6_1, List( deduped_2_3[3], RankOfObject ){Positions( deduped_1_3, i_2 )} ][BooleanToInteger( i_2 in deduped_1_3 ) + 1][1];
                    end );
                deduped_1_2 := deduped_2_2[k_1];
                return CreateCapCategoryMorphismWithAttributes( deduped_15_1, CAP_JIT_INCOMPLETE_LOGIC( [ deduped_3_1, hoisted_2_1{Positions( deduped_1_1, i_2 )} ][BooleanToInteger( i_2 in deduped_1_1 ) + 1][1] ), [ deduped_3_1, hoisted_5_1{Positions( deduped_12_1, i_2 )} ][BooleanToInteger( i_2 in deduped_12_1 ) + 1][1], UnderlyingMatrix, UnionOfColumns( deduped_8_1, deduped_1_2, [ HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_7_1} ), deduped_8_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_8_1 ), HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_9_1} ), deduped_8_1 ) ] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.InjectionOfCofactorOfDirectSumWithGivenDirectSum :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_7_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_10_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_9_1 := deduped_10_1[2];
    hoisted_7_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_6_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_5_1 := [ 1 .. k_1 - 1 ];
    hoisted_4_1 := [ 0 ];
    hoisted_3_1 := deduped_10_1[3];
    deduped_1_1 := [ CreateCapCategoryObjectWithAttributes( deduped_11_1, RankOfObject, 0 ) ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_10_1[1], deduped_9_1, List( deduped_9_1, function ( i_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := List( objects_1, function ( obj_3 )
                        local deduped_1_3, deduped_2_3;
                        deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                        deduped_1_3 := deduped_2_3[2];
                        return [ hoisted_4_1, List( deduped_2_3[3], RankOfObject ){Positions( deduped_1_3, i_2 )} ][BooleanToInteger( i_2 in deduped_1_3 ) + 1][1];
                    end );
                deduped_1_2 := deduped_2_2[k_1];
                return CreateCapCategoryMorphismWithAttributes( deduped_11_1, List( objects_1, function ( obj_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := TripleOfNrSupportListOfSupportListOfObjects( obj_3 );
                            deduped_1_3 := deduped_2_3[2];
                            return [ deduped_1_1, deduped_2_3[3]{Positions( deduped_1_3, i_2 )} ][BooleanToInteger( i_2 in deduped_1_3 ) + 1][1];
                        end )[k_1], [ deduped_1_1, hoisted_3_1{Positions( deduped_9_1, i_2 )} ][BooleanToInteger( i_2 in deduped_9_1 ) + 1][1], UnderlyingMatrix, UnionOfColumns( deduped_6_1, deduped_1_2, [ HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_5_1} ), deduped_6_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_6_1 ), HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_7_1} ), deduped_6_1 ) ] ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismIntoDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local deduped_4_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1;
    deduped_20_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_19_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_18_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfObjects( T_1 );
    deduped_16_1 := deduped_17_1[3];
    deduped_15_1 := deduped_18_1[2];
    deduped_14_1 := deduped_17_1[2];
    deduped_13_1 := Union2( deduped_14_1, deduped_15_1 );
    deduped_12_1 := Length( deduped_13_1 );
    hoisted_9_1 := [ HomalgZeroMatrix( 0, 0, deduped_20_1 ) ];
    hoisted_8_1 := [ 0 ];
    hoisted_7_1 := List( deduped_16_1, RankOfObject );
    hoisted_6_1 := deduped_18_1[3];
    deduped_4_1 := [ CreateCapCategoryObjectWithAttributes( deduped_19_1, RankOfObject, 0 ) ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_12_1, deduped_13_1, List( [ 1 .. deduped_12_1 ], function ( n_2 )
                local deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := deduped_13_1[n_2];
                deduped_3_2 := Positions( deduped_14_1, deduped_4_2 );
                deduped_2_2 := BooleanToInteger( deduped_4_2 in deduped_14_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_19_1, [ deduped_4_1, deduped_16_1{deduped_3_2} ][deduped_2_2][1], [ deduped_4_1, hoisted_6_1{Positions( deduped_15_1, deduped_4_2 )} ][BooleanToInteger( deduped_4_2 in deduped_15_1 ) + 1][1], UnderlyingMatrix, UnionOfColumns( deduped_20_1, [ hoisted_8_1, hoisted_7_1{deduped_3_2} ][deduped_2_2][1], List( tau_1, function ( morphism_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := TripleOfNrSupportListOfSupportListOfMorphisms( morphism_3 );
                            deduped_1_3 := deduped_2_3[2];
                            return [ hoisted_9_1, List( deduped_2_3[3], UnderlyingMatrix ){Positions( deduped_1_3, deduped_4_2 )} ][BooleanToInteger( deduped_4_2 in deduped_1_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_3_1, deduped_4_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1;
    deduped_20_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_19_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_18_1 := TripleOfNrSupportListOfSupportListOfObjects( P_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfObjects( T_1 );
    deduped_16_1 := deduped_17_1[3];
    deduped_15_1 := deduped_18_1[2];
    deduped_14_1 := deduped_17_1[2];
    deduped_13_1 := Union2( deduped_14_1, deduped_15_1 );
    deduped_12_1 := Length( deduped_13_1 );
    hoisted_9_1 := [ HomalgZeroMatrix( 0, 0, deduped_20_1 ) ];
    hoisted_8_1 := [ 0 ];
    hoisted_7_1 := List( deduped_16_1, RankOfObject );
    deduped_4_1 := [ CreateCapCategoryObjectWithAttributes( deduped_19_1, RankOfObject, 0 ) ];
    hoisted_3_1 := deduped_18_1[3];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_12_1, deduped_13_1, List( [ 1 .. deduped_12_1 ], function ( n_2 )
                local deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := deduped_13_1[n_2];
                deduped_3_2 := Positions( deduped_14_1, deduped_4_2 );
                deduped_2_2 := BooleanToInteger( deduped_4_2 in deduped_14_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_19_1, [ deduped_4_1, hoisted_3_1{Positions( deduped_15_1, deduped_4_2 )} ][BooleanToInteger( deduped_4_2 in deduped_15_1 ) + 1][1], [ deduped_4_1, deduped_16_1{deduped_3_2} ][deduped_2_2][1], UnderlyingMatrix, UnionOfRows( deduped_20_1, [ hoisted_8_1, hoisted_7_1{deduped_3_2} ][deduped_2_2][1], List( tau_1, function ( morphism_3 )
                            local deduped_1_3, deduped_2_3;
                            deduped_2_3 := TripleOfNrSupportListOfSupportListOfMorphisms( morphism_3 );
                            deduped_1_3 := deduped_2_3[2];
                            return [ hoisted_9_1, List( deduped_2_3[3], UnderlyingMatrix ){Positions( deduped_1_3, deduped_4_2 )} ][BooleanToInteger( deduped_4_2 in deduped_1_3 ) + 1][1];
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( cat,
        
########
function ( cat_1, r_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_6_1 := deduped_7_1[3];
    deduped_5_1 := deduped_7_1[1];
    hoisted_4_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_6_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( alpha_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_5_1, deduped_7_1[2], List( [ 1 .. deduped_5_1 ], function ( n_2 )
                return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[n_2], hoisted_2_1[n_2], UnderlyingMatrix, r_1 * hoisted_3_1[n_2] );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddKernelObject( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_6_1 := deduped_7_1[3];
    deduped_5_1 := [ 1 .. deduped_7_1[1] ];
    deduped_2_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_1_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_4_1 := Filtered( deduped_5_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return not CAP_JIT_INCOMPLETE_LOGIC( deduped_1_1[deduped_1_2] - deduped_2_1[deduped_1_2] ) = 0;
        end );
    hoisted_3_1 := UnderlyingAdditiveCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, NTuple( 3, Length( deduped_4_1 ), deduped_7_1[2]{deduped_4_1}, List( deduped_5_1, function ( i_2 )
                  return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, deduped_1_1[i_2] - deduped_2_1[i_2] );
              end ){deduped_4_1} ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.KernelObject :=
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_7_1 := deduped_8_1[3];
    deduped_6_1 := [ 1 .. deduped_8_1[1] ];
    deduped_2_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_1_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_6_1, function ( i_2 )
            return deduped_1_1[i_2] - deduped_2_1[i_2];
        end );
    deduped_5_1 := Filtered( deduped_6_1, function ( i_2 )
            return not hoisted_3_1[i_2] = 0;
        end );
    hoisted_4_1 := UnderlyingAdditiveCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, NTuple( 3, Length( deduped_5_1 ), deduped_8_1[2]{deduped_5_1}, List( deduped_6_1, function ( i_2 )
                  return CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, deduped_1_1[i_2] - deduped_2_1[i_2] );
              end ){deduped_5_1} ) );
end
########
        
    ;
    
    ##
    AddKernelEmbeddingWithGivenKernelObject( cat,
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_8_1 := deduped_9_1[3];
    deduped_7_1 := [ 1 .. deduped_9_1[1] ];
    hoisted_2_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return NumberRows( SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    deduped_6_1 := Filtered( deduped_7_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return not (CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[deduped_1_2] ) = 0 and CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[deduped_1_2] ) = 0);
        end );
    hoisted_5_1 := List( deduped_8_1, Source );
    deduped_4_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_3_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Source( alpha_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, Length( deduped_6_1 ), deduped_9_1[2]{deduped_6_1}, List( deduped_7_1, function ( i_2 )
                  local deduped_1_2;
                  deduped_1_2 := hoisted_3_1[i_2];
                  return CreateCapCategoryMorphismWithAttributes( deduped_4_1, CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, NumberRows( deduped_1_2 ) ), hoisted_5_1[i_2], UnderlyingMatrix, deduped_1_2 );
              end ){deduped_6_1} ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.KernelEmbeddingWithGivenKernelObject :=
        
########
function ( cat_1, alpha_1, P_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_10_1 := deduped_11_1[3];
    deduped_9_1 := [ 1 .. deduped_11_1[1] ];
    hoisted_3_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := List( deduped_9_1, function ( i_2 )
            return hoisted_3_1[i_2];
        end );
    deduped_1_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return NumberRows( SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_2_1 := List( deduped_9_1, function ( i_2 )
            return deduped_1_1[i_2];
        end );
    deduped_8_1 := Filtered( deduped_9_1, function ( i_2 )
            return not (hoisted_2_1[i_2] = 0 and hoisted_4_1[i_2] = 0);
        end );
    hoisted_7_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_6_1 := List( deduped_10_1, Source );
    deduped_5_1 := UnderlyingAdditiveCategory( cat_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Source( alpha_1 ), TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, Length( deduped_8_1 ), deduped_11_1[2]{deduped_8_1}, List( deduped_9_1, function ( i_2 )
                  return CreateCapCategoryMorphismWithAttributes( deduped_5_1, CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, deduped_1_1[i_2] ), hoisted_6_1[i_2], UnderlyingMatrix, hoisted_7_1[i_2] );
              end ){deduped_8_1} ) );
end
########
        
    ;
    
    ##
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_9_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1;
    deduped_19_1 := TripleOfNrSupportListOfSupportListOfMorphisms( beta_1 );
    deduped_18_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_16_1 := Source( beta_1 );
    deduped_15_1 := Source( alpha_1 );
    deduped_14_1 := deduped_19_1[3];
    deduped_13_1 := deduped_17_1[3];
    deduped_12_1 := Union2( TripleOfNrSupportListOfSupportListOfObjects( deduped_15_1 )[2], TripleOfNrSupportListOfSupportListOfObjects( deduped_16_1 )[2] );
    deduped_11_1 := Length( deduped_12_1 );
    hoisted_9_1 := List( deduped_14_1, UnderlyingMatrix );
    deduped_8_1 := [ HomalgZeroMatrix( 0, 0, CommutativeRingOfLinearCategory( cat_1 ) ) ];
    hoisted_7_1 := List( deduped_13_1, UnderlyingMatrix );
    hoisted_6_1 := List( deduped_14_1, Source );
    deduped_5_1 := deduped_19_1[2];
    deduped_4_1 := [ CreateCapCategoryObjectWithAttributes( deduped_18_1, RankOfObject, 0 ) ];
    hoisted_3_1 := List( deduped_13_1, Source );
    deduped_2_1 := deduped_17_1[2];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_15_1, deduped_16_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_11_1, deduped_12_1, List( [ 1 .. deduped_11_1 ], function ( i_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                deduped_5_2 := deduped_12_1[i_2];
                deduped_4_2 := Positions( deduped_5_1, deduped_5_2 );
                deduped_3_2 := Positions( deduped_2_1, deduped_5_2 );
                deduped_2_2 := BooleanToInteger( deduped_5_2 in deduped_5_1 ) + 1;
                deduped_1_2 := BooleanToInteger( deduped_5_2 in deduped_2_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_18_1, [ deduped_4_1, hoisted_3_1{deduped_3_2} ][deduped_1_2][1], [ deduped_4_1, hoisted_6_1{deduped_4_2} ][deduped_2_2][1], UnderlyingMatrix, SafeRightDivide( [ deduped_8_1, hoisted_7_1{deduped_3_2} ][deduped_1_2][1], [ deduped_8_1, hoisted_9_1{deduped_4_2} ][deduped_2_2][1] ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCokernelObject( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_6_1 := deduped_7_1[3];
    deduped_5_1 := [ 1 .. deduped_7_1[1] ];
    deduped_2_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_1_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    deduped_4_1 := Filtered( deduped_5_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return not CAP_JIT_INCOMPLETE_LOGIC( deduped_1_1[deduped_1_2] - deduped_2_1[deduped_1_2] ) = 0;
        end );
    hoisted_3_1 := UnderlyingAdditiveCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, NTuple( 3, Length( deduped_4_1 ), deduped_7_1[2]{deduped_4_1}, List( deduped_5_1, function ( i_2 )
                  return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, deduped_1_1[i_2] - deduped_2_1[i_2] );
              end ){deduped_4_1} ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.CokernelObject :=
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_7_1 := deduped_8_1[3];
    deduped_6_1 := [ 1 .. deduped_8_1[1] ];
    deduped_2_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_1_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_6_1, function ( i_2 )
            return deduped_1_1[i_2] - deduped_2_1[i_2];
        end );
    deduped_5_1 := Filtered( deduped_6_1, function ( i_2 )
            return not hoisted_3_1[i_2] = 0;
        end );
    hoisted_4_1 := UnderlyingAdditiveCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, TripleOfNrSupportListOfSupportListOfObjects, NTuple( 3, Length( deduped_5_1 ), deduped_8_1[2]{deduped_5_1}, List( deduped_6_1, function ( i_2 )
                  return CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, deduped_1_1[i_2] - deduped_2_1[i_2] );
              end ){deduped_5_1} ) );
end
########
        
    ;
    
    ##
    AddCokernelProjectionWithGivenCokernelObject( cat,
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_8_1 := deduped_9_1[3];
    deduped_7_1 := [ 1 .. deduped_9_1[1] ];
    hoisted_2_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return NumberColumns( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_1_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    deduped_6_1 := Filtered( deduped_7_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return not (CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[deduped_1_2] ) = 0 and CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[deduped_1_2] ) = 0);
        end );
    deduped_5_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_4_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_8_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Target( alpha_1 ), P_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, Length( deduped_6_1 ), deduped_9_1[2]{deduped_6_1}, List( deduped_7_1, function ( i_2 )
                  local deduped_1_2;
                  deduped_1_2 := hoisted_4_1[i_2];
                  return CreateCapCategoryMorphismWithAttributes( deduped_5_1, hoisted_3_1[i_2], CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberColumns( deduped_1_2 ) ), UnderlyingMatrix, deduped_1_2 );
              end ){deduped_6_1} ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.CokernelProjectionWithGivenCokernelObject :=
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_10_1 := deduped_11_1[3];
    deduped_9_1 := [ 1 .. deduped_11_1[1] ];
    deduped_3_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return NumberColumns( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_4_1 := List( deduped_9_1, function ( i_2 )
            return deduped_3_1[i_2];
        end );
    hoisted_1_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_9_1, function ( i_2 )
            return hoisted_1_1[i_2];
        end );
    deduped_8_1 := Filtered( deduped_9_1, function ( i_2 )
            return not (hoisted_2_1[i_2] = 0 and hoisted_4_1[i_2] = 0);
        end );
    hoisted_7_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_6_1 := UnderlyingAdditiveCategory( cat_1 );
    hoisted_5_1 := List( deduped_10_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Target( alpha_1 ), P_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, Length( deduped_8_1 ), deduped_11_1[2]{deduped_8_1}, List( deduped_9_1, function ( i_2 )
                  return CreateCapCategoryMorphismWithAttributes( deduped_6_1, hoisted_5_1[i_2], CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, deduped_3_1[i_2] ), UnderlyingMatrix, hoisted_7_1[i_2] );
              end ){deduped_8_1} ) );
end
########
        
    ;
    
    ##
    AddColift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_9_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1;
    deduped_19_1 := TripleOfNrSupportListOfSupportListOfMorphisms( beta_1 );
    deduped_18_1 := UnderlyingAdditiveCategory( cat_1 );
    deduped_17_1 := TripleOfNrSupportListOfSupportListOfMorphisms( alpha_1 );
    deduped_16_1 := Target( beta_1 );
    deduped_15_1 := Target( alpha_1 );
    deduped_14_1 := deduped_19_1[3];
    deduped_13_1 := deduped_17_1[3];
    deduped_12_1 := Union2( TripleOfNrSupportListOfSupportListOfObjects( deduped_15_1 )[2], TripleOfNrSupportListOfSupportListOfObjects( deduped_16_1 )[2] );
    deduped_11_1 := Length( deduped_12_1 );
    hoisted_9_1 := List( deduped_14_1, UnderlyingMatrix );
    deduped_8_1 := [ HomalgZeroMatrix( 0, 0, CommutativeRingOfLinearCategory( cat_1 ) ) ];
    hoisted_7_1 := List( deduped_13_1, UnderlyingMatrix );
    hoisted_6_1 := List( deduped_14_1, Range );
    deduped_5_1 := deduped_19_1[2];
    deduped_4_1 := [ CreateCapCategoryObjectWithAttributes( deduped_18_1, RankOfObject, 0 ) ];
    hoisted_3_1 := List( deduped_13_1, Range );
    deduped_2_1 := deduped_17_1[2];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_15_1, deduped_16_1, TripleOfNrSupportListOfSupportListOfMorphisms, NTuple( 3, deduped_11_1, deduped_12_1, List( [ 1 .. deduped_11_1 ], function ( i_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                deduped_5_2 := deduped_12_1[i_2];
                deduped_4_2 := Positions( deduped_5_1, deduped_5_2 );
                deduped_3_2 := Positions( deduped_2_1, deduped_5_2 );
                deduped_2_2 := BooleanToInteger( deduped_5_2 in deduped_5_1 ) + 1;
                deduped_1_2 := BooleanToInteger( deduped_5_2 in deduped_2_1 ) + 1;
                return CreateCapCategoryMorphismWithAttributes( deduped_18_1, [ deduped_4_1, hoisted_3_1{deduped_3_2} ][deduped_1_2][1], [ deduped_4_1, hoisted_6_1{deduped_4_2} ][deduped_2_2][1], UnderlyingMatrix, SafeLeftDivide( [ deduped_8_1, hoisted_7_1{deduped_3_2} ][deduped_1_2][1], [ deduped_8_1, hoisted_9_1{deduped_4_2} ][deduped_2_2][1] ) );
            end ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "DirectSumOfAdditiveCategory_Rows_Field", function ( homalg_ring )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( homalg_ring )
    return DirectSumOfAdditiveCategory( 5, CategoryOfRows( homalg_ring : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( homalg_ring : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_DirectSumOfAdditiveCategory_Rows_Field( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
