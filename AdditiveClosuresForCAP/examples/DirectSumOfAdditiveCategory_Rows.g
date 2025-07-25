#! @Chapter Direct sums of an additive category
#! @Section Examples and Tests

#! @Example
LoadPackage( "RingsForHomalg", false );
#! true
LoadPackage( "LinearClosuresForCAP", false );
#! true

QQ := HomalgFieldOfRationals();;
rows := CategoryOfRows( QQ );;
rows_5 := DirectSumOfAdditiveCategory( 5, rows : no_precompiled_code := true );;

Display( rows_5 );
#! A CAP category with name ⨁( 5, Rows( Q ) ):
#! 
#! 29 primitive operations were used to derive 237 operations for this catego\
#! ry w\
#! hich algorithmically
#! * IsLinearCategoryOverCommutativeRing
#! * IsAbelianCategory
#! and furthermore mathematically
#! * IsSkeletalCategory

#########################################
# Primitive operations
#########################################

s2 := CategoryOfRowsObject( rows, 2 );;
s3 := CategoryOfRowsObject( rows, 1 );;
s5 := CategoryOfRowsObject( rows, 1 );;

source := ObjectConstructor( rows_5, [ 3, [ 2, 3, 5 ], [ s2, s3, s5 ] ] );;

t1 := CategoryOfRowsObject( rows, 3 );;
t2 := CategoryOfRowsObject( rows, 1 );;
t3 := CategoryOfRowsObject( rows, 2 );;

target := ObjectConstructor( rows_5, [ 3, [ 1, 2, 3 ], [ t1, t2, t3 ] ] );;

matrix_mor1_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_mor1_2 := HomalgMatrix( [ [ 4 ], [ 1 ] ], 2, 1, QQ );;
matrix_mor1_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_mor1_4 := HomalgMatrix( [ ], 0, 0, QQ );;
matrix_mor1_5 := HomalgMatrix( [ ], 1, 0, QQ );;
morphisms := [ AsCategoryOfRowsMorphism( rows, matrix_mor1_1 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor1_2 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor1_3 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor1_5 ) ];;

mor1 := MorphismConstructor( rows_5, source, [ 4, [ 1, 2, 3, 5 ], morphisms ], target );;
IsWellDefinedForMorphisms( mor1 );
#! true
Display( mor1 );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 4
#! [2,1]: 1
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 5
#! [1,2]: 6
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )
#! 

ObjectDatum( rows_5, source );
#! [ 3, [ 2, 3, 5 ], 
#!   [ <A row module over Q of rank 2>, <A row module over Q of rank 1>, 
#!       <A row module over Q of rank 1> ] ]

MorphismDatum( rows_5, mor1 );
#! [ 4, [ 1, 2, 3, 5 ], 
#!   [ <A morphism in Rows( Q )>, <A morphism in Rows( Q )>, 
#!       <A morphism in Rows( Q )>, <A morphism in Rows( Q )> ] ]

IsEqualForObjects( rows_5, source, source );
#! true
IsEqualForObjects( rows_5, target, target );
#! true
IsEqualForObjects( rows_5, source, target );
#! false
IsEqualForObjects( rows_5, target, source );
#! false

matrix_mor2_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_mor2_2 := HomalgMatrix( [ [ -5 ], [ -8 ] ], 2, 1, QQ );;
matrix_mor2_3 := HomalgMatrix( [ [ 20, 30 ] ], 1, 2, QQ );;
matrix_mor2_4 := HomalgMatrix( [ ], 0, 0, QQ );;
matrix_mor2_5 := HomalgMatrix( [ ], 1, 0, QQ );;
morphisms := [ AsCategoryOfRowsMorphism( rows, matrix_mor2_1 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor2_2 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor2_3 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor2_5 ) ];;

mor2 := MorphismConstructor( rows_5, source, [ 4, [ 1, 2, 3, 5 ], morphisms ], target );;

IsEqualForMorphisms( rows_5, mor1, mor1 );
#! true
IsEqualForMorphisms( rows_5, mor2, mor2 );
#! true
IsEqualForMorphisms( rows_5, mor1, mor2 );
#! false
IsEqualForMorphisms( rows_5, mor2, mor1 );
#! false

IsCongruentForMorphisms( rows_5, mor1, mor1 );
#! true
IsCongruentForMorphisms( rows_5, mor2, mor2 );
#! true
IsCongruentForMorphisms( rows_5, mor1, mor2 );
#! false
IsCongruentForMorphisms( rows_5, mor2, mor1 );
#! false

matrix_mor3_1 := HomalgMatrix( [ [], [], [] ], 3, 0, QQ );;
matrix_mor3_2 := HomalgMatrix( [ [ -5, -8 ] ], 1, 2, QQ );;
matrix_mor3_3 := HomalgMatrix( [ [ 20 ], [ 30 ] ], 2, 1, QQ );;
matrix_mor3_4 := HomalgMatrix( [ ], 0, 0, QQ );;
matrix_mor3_5 := HomalgMatrix( [ ], 0, 1, QQ );;
morphisms := [ AsCategoryOfRowsMorphism( rows, matrix_mor3_1 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor3_2 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor3_3 ),
               AsCategoryOfRowsMorphism( rows, matrix_mor3_5 ) ];;

mor3 := MorphismConstructor( rows_5, target, [ 4, [ 1, 2, 3, 5 ], morphisms ], source );;

PreCompose( rows_5, mor1, mor3 );
#! <A morphism in ⨁( 5, Rows( Q ) )>
PreCompose( rows_5, mor2, mor3 );
#! <A morphism in ⨁( 5, Rows( Q ) )>
PreCompose( rows_5, mor3, mor1 );
#! <A morphism in ⨁( 5, Rows( Q ) )>
PreCompose( rows_5, mor3, mor2 );
#! <A morphism in ⨁( 5, Rows( Q ) )>

zero := ZeroObject( rows_5 );;
id_source := IdentityMorphism( rows_5, source );;
id_target := IdentityMorphism( rows_5, target );;

id_source_mor1 := PreCompose( rows_5, id_source, mor1 );;
IsEqualForMorphisms( rows_5, id_source_mor1, mor1 );
#! true

id_target_mor1 := PreCompose( rows_5, mor1, id_target );;
IsEqualForMorphisms( rows_5, id_source_mor1, mor1 );
#! true

zero_mor_source_target := ZeroMorphism( rows_5, source, target );;
zero_mor_target_target := ZeroMorphism( rows_5, target, target );;
mor1_zero_mor_target_target := PreCompose( rows_5, mor1, zero_mor_target_target );;
IsEqualForMorphisms( rows_5, zero_mor_source_target, mor1_zero_mor_target_target );
#! true

#############################
# AdditionForMorphisms
#############################

add_mor1_mor1 := AdditionForMorphisms( rows_5, mor1, mor1 );;
Display( add_mor1_mor1 );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 8
#! [2,1]: 2
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 10
#! [1,2]: 12
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

mor1_minus_mor1 := AdditionForMorphisms( rows_5, mor1, AdditiveInverseForMorphisms( mor1 ) );;
Display( mor1_minus_mor1 );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [2,1]: 0
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

add_mor1_mor2 := AdditionForMorphisms( rows_5, mor1, mor2 );;
Display( add_mor1_mor2 );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: -1
#! [2,1]: -7
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 25
#! [1,2]: 36
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

add_id_source := AdditionForMorphisms( rows_5, id_source, id_source );;
Display( add_id_source );
#! Component 2: a 2 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 2
#! [1,2]: 0
#! [2,1]: 0
#! [2,2]: 2
#! 
#! Component 3: a 1 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 2
#! 
#! Component 5: a 1 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 2

add_zero_mor := AdditionForMorphisms( rows_5, zero_mor_target_target, zero_mor_target_target );;
Display( add_zero_mor );
#! Component 1: a 3 x 3 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [1,3]: 0
#! [2,1]: 0
#! [2,2]: 0
#! [2,3]: 0
#! [3,1]: 0
#! [3,2]: 0
#! [3,3]: 0
#! 
#! Component 2: a 1 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! 
#! Component 3: a 2 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [2,1]: 0
#! [2,2]: 0

#############################
# SumOfMorphisms
#############################

Display( SumOfMorphisms( rows_5, source, [ mor1, mor2, mor1 ], target ) );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 3
#! [2,1]: -6
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 30
#! [1,2]: 42
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

Display( SumOfMorphisms( rows_5, source, [ mor1, zero_mor_source_target, mor1, zero_mor_source_target ], target ) );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 8
#! [2,1]: 2
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 10
#! [1,2]: 12
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

#############################
# AdditiveInverseForMorphisms
#############################

id_source_inv := AdditiveInverseForMorphisms( rows_5, id_source );;
Display( id_source_inv );
#! Component 2: a 2 x 2 morphism in Rows( Q )
#! 
#! [1,1]: -1
#! [1,2]: 0
#! [2,1]: 0
#! [2,2]: -1
#! 
#! Component 3: a 1 x 1 morphism in Rows( Q )
#! 
#! [1,1]: -1
#! 
#! Component 5: a 1 x 1 morphism in Rows( Q )
#! 
#! [1,1]: -1

mor1_inv := AdditiveInverseForMorphisms( rows_5, mor1 );;
Display( mor1_inv );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: -4
#! [2,1]: -1
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: -5
#! [1,2]: -6
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

zero_mor_source_target_inv := AdditiveInverseForMorphisms( rows_5, zero_mor_source_target );;
Display( zero_mor_source_target_inv );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [2,1]: 0
#! 
#! Component 3: a 1 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! 
#! Component 5: a 1 x 0 morphism in Rows( Q )

id_zero_obj_inv := AdditiveInverseForMorphisms( rows_5, IdentityMorphism( zero ) );;
TripleOfNrSupportListOfSupportListOfMorphisms( id_zero_obj_inv );
#! [ 0, [  ], [  ] ]

####################################################
# DirectSum
####################################################

Display( DirectSum( rows_5, [ ZeroObject( rows_5 ), ZeroObject( rows_5 ) ] ) );
#! [ 0, [  ], [  ] ]
Display( DirectSum( rows_5, [ source, source, source ] ) );
#! [ 3, [ 2, 3, 5 ], [ A row module over Q of rank 6, A row module over Q of rank 3, A row module over Q of rank 3 ] ]
Display( DirectSum( rows_5, [ source, target, source ] ) );
#! [ 4, [ 1, 2, 3, 5 ], [ A row module over Q of rank 3, A row module over Q of rank 5, A row module over Q of rank 4, A row module over Q of rank 2 ] ]

####################################################
# ProjectionInFactorOfDirectSumWithGivenDirectSum
####################################################

proj := ProjectionInFactorOfDirectSumWithGivenDirectSum(
                [ ZeroObject( rows_5 ), ZeroObject( rows_5 ) ],
                1,
                DirectSum( [ ZeroObject( rows_5 ), ZeroObject( rows_5 ) ] ) );
#! <A zero, isomorphism in ⨁( 5, Rows( Q ) )>

proj := ProjectionInFactorOfDirectSumWithGivenDirectSum(
                [ source, source, source ],
                3,
                DirectSum( [ source, source, source ] ) );;

Display( proj );
#! Component 2: a 6 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [2,1]: 0
#! [2,2]: 0
#! [3,1]: 0
#! [3,2]: 0
#! [4,1]: 0
#! [4,2]: 0
#! [5,1]: 1
#! [5,2]: 0
#! [6,1]: 0
#! [6,2]: 1
#! 
#! Component 3: a 3 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [2,1]: 0
#! [3,1]: 1
#! 
#! Component 5: a 3 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [2,1]: 0
#! [3,1]: 1
#! 

proj := ProjectionInFactorOfDirectSumWithGivenDirectSum(
                [ source, target, source ],
                2,
                DirectSum( [ source, target, source ] ) );;

Display( proj );
#! Component 1: a 3 x 3 morphism in Rows( Q )
#! 
#! [1,1]: 1
#! [1,2]: 0
#! [1,3]: 0
#! [2,1]: 0
#! [2,2]: 1
#! [2,3]: 0
#! [3,1]: 0
#! [3,2]: 0
#! [3,3]: 1
#! 
#! Component 2: a 5 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [2,1]: 0
#! [3,1]: 1
#! [4,1]: 0
#! [5,1]: 0
#! 
#! Component 3: a 4 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [2,1]: 1
#! [2,2]: 0
#! [3,1]: 0
#! [3,2]: 1
#! [4,1]: 0
#! [4,2]: 0
#! 
#! Component 5: a 2 x 0 morphism in Rows( Q )
#! 

####################################################
# InjectionOfCofactorOfDirectSumWithGivenDirectSum
####################################################

inj := InjectionOfCofactorOfDirectSumWithGivenDirectSum(
                [ ZeroObject( rows_5 ), ZeroObject( rows_5 ) ],
                1,
                DirectSum( [ ZeroObject( rows_5 ), ZeroObject( rows_5 ) ] ) );
#! <A zero, isomorphism in ⨁( 5, Rows( Q ) )>

inj := InjectionOfCofactorOfDirectSumWithGivenDirectSum(
                [ source, source, source ],
                3,
                DirectSum( [ source, source, source ] ) );;

Display( inj );
#! Component 2: a 2 x 6 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [1,3]: 0
#! [1,4]: 0
#! [1,5]: 1
#! [1,6]: 0
#! [2,1]: 0
#! [2,2]: 0
#! [2,3]: 0
#! [2,4]: 0
#! [2,5]: 0
#! [2,6]: 1
#! 
#! Component 3: a 1 x 3 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [1,3]: 1
#! 
#! Component 5: a 1 x 3 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [1,3]: 1
#! 

inj := InjectionOfCofactorOfDirectSumWithGivenDirectSum(
                [ source, target, source ],
                2,
                DirectSum( [ source, target, source ] ) );;

Display( inj );
#! Component 1: a 3 x 3 morphism in Rows( Q )
#! 
#! [1,1]: 1
#! [1,2]: 0
#! [1,3]: 0
#! [2,1]: 0
#! [2,2]: 1
#! [2,3]: 0
#! [3,1]: 0
#! [3,2]: 0
#! [3,3]: 1
#! 
#! Component 2: a 1 x 5 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [1,3]: 1
#! [1,4]: 0
#! [1,5]: 0
#! 
#! Component 3: a 2 x 4 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 1
#! [1,3]: 0
#! [1,4]: 0
#! [2,1]: 0
#! [2,2]: 0
#! [2,3]: 1
#! [2,4]: 0
#! 
#! Component 5: a 0 x 2 morphism in Rows( Q )
#! 

####################################################
# DirectSumFunctorial
####################################################

sum := DirectSumFunctorial( rows_5, [ mor1, mor2, mor3 ] );;
Display(sum);
#! Component 1: a 3 x 6 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [1,2]: 0
#! [1,3]: 0
#! [1,4]: 0
#! [1,5]: 0
#! [1,6]: 0
#! [2,1]: 0
#! [2,2]: 0
#! [2,3]: 0
#! [2,4]: 0
#! [2,5]: 0
#! [2,6]: 0
#! [3,1]: 0
#! [3,2]: 0
#! [3,3]: 0
#! [3,4]: 0
#! [3,5]: 0
#! [3,6]: 0
#! 
#! Component 2: a 5 x 4 morphism in Rows( Q )
#! 
#! [1,1]: 4
#! [1,2]: 0
#! [1,3]: 0
#! [1,4]: 0
#! [2,1]: 1
#! [2,2]: 0
#! [2,3]: 0
#! [2,4]: 0
#! [3,1]: 0
#! [3,2]: -5
#! [3,3]: 0
#! [3,4]: 0
#! [4,1]: 0
#! [4,2]: -8
#! [4,3]: 0
#! [4,4]: 0
#! [5,1]: 0
#! [5,2]: 0
#! [5,3]: -5
#! [5,4]: -8
#! 
#! Component 3: a 4 x 5 morphism in Rows( Q )
#! 
#! [1,1]: 5
#! [1,2]: 6
#! [1,3]: 0
#! [1,4]: 0
#! [1,5]: 0
#! [2,1]: 0
#! [2,2]: 0
#! [2,3]: 20
#! [2,4]: 30
#! [2,5]: 0
#! [3,1]: 0
#! [3,2]: 0
#! [3,3]: 0
#! [3,4]: 0
#! [3,5]: 20
#! [4,1]: 0
#! [4,2]: 0
#! [4,3]: 0
#! [4,4]: 0
#! [4,5]: 30
#! 
#! Component 5: a 2 x 1 morphism in Rows( Q )
#! 
#! [1,1]: 0
#! [2,1]: 0

####################################################
# UniversalMorphismIntoDirectSumWithGivenDirectSum
####################################################

# Direct sum diagram
s1 := CategoryOfRowsObject( rows, 1 );;
s2 := CategoryOfRowsObject( rows, 2 );;
s3 := CategoryOfRowsObject( rows, 3 );;
s4 := CategoryOfRowsObject( rows, 4 );;
s5 := CategoryOfRowsObject( rows, 5 );;

o1 := ObjectConstructor( rows_5, [ 2, [1,4], [s1,s1] ] );;
o2 := ObjectConstructor( rows_5, [ 2, [3,4], [s2,s2] ] );;
o3 := ObjectConstructor( rows_5, [ 2, [1,3], [s3,s3] ] );;

o1o2o3 := DirectSum( rows_5, [ o1, o2, o3 ] );;

# Test object
t2 := CategoryOfRowsObject( rows, 2 );;
t3 := CategoryOfRowsObject( rows, 3 );;

test_object := ObjectConstructor( rows_5, [ 2, [2,3], [t2,t3] ] );;

# Morphisms

# test_object -> o1
matrix_mor_t_o1_1 := HomalgMatrix( [ ], 0, RankOfObject( s1 ), QQ );;
matrix_mor_t_o1_2 := HomalgMatrix( [ ], RankOfObject( t2 ), 0, QQ );;
matrix_mor_t_o1_3 := HomalgMatrix( [ ], RankOfObject( t3 ), 0, QQ );;
matrix_mor_t_o1_4 := HomalgMatrix( [ ], 0, RankOfObject( s1 ), QQ );;

mor_t_o1_1 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_1 );;
mor_t_o1_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_2 );;
mor_t_o1_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_3 );;
mor_t_o1_4 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_4 );;

m1 := MorphismConstructor( rows_5,
                           test_object,
                           [ 4, [1,2,3,4], [ mor_t_o1_1, mor_t_o1_2, mor_t_o1_3, mor_t_o1_4 ] ],
                           o1 );;

# test_object -> o2
matrix_mor_t_o2_2 := HomalgMatrix( [ ], RankOfObject( t2 ), 0, QQ );;
matrix_mor_t_o2_3 := HomalgMatrix( [ [1,2], [3,4], [5,6] ], RankOfObject( t3 ), RankOfObject( s2 ), QQ );;
matrix_mor_t_o2_4 := HomalgMatrix( [ ], 0, RankOfObject( s2 ), QQ );;

mor_t_o2_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o2_2 );;
mor_t_o2_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o2_3 );;
mor_t_o2_4 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o2_4 );;

m2 := MorphismConstructor( rows_5,
                           test_object,
                           [ 3, [2,3,4], [ mor_t_o2_2, mor_t_o2_3, mor_t_o2_4] ],
                           o2 );;

# test_object -> o3
matrix_mor_t_o3_1 := HomalgMatrix( [ ], 0, RankOfObject( s3 ), QQ );;
matrix_mor_t_o3_2 := HomalgMatrix( [ ], RankOfObject( t2 ), 0, QQ );;
matrix_mor_t_o3_3 := HomalgMatrix( [ [1,2,3], [4,5,6], [7,8,9] ], RankOfObject( t3 ), RankOfObject( s3 ), QQ );;

mor_t_o3_1 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o3_1 );;
mor_t_o3_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o3_2 );;
mor_t_o3_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o3_3 );;

m3 := MorphismConstructor( rows_5,
                           test_object,
                           [ 3, [1,2,3], [ mor_t_o3_1, mor_t_o3_2, mor_t_o3_3 ] ],
                           o3 );;

u := UniversalMorphismIntoDirectSumWithGivenDirectSum( rows_5, [o1,o2,o3], test_object, [m1,m2,m3], o1o2o3 );;

####################################################
# UniversalMorphismFromDirectSumWithGivenDirectSum
####################################################

# Morphisms

# 01 -> test_object
matrix_mor_t_o1_1 := HomalgMatrix( [ ], RankOfObject( s1 ), 0, QQ );;
matrix_mor_t_o1_2 := HomalgMatrix( [ ], 0, RankOfObject( t2 ), QQ );;
matrix_mor_t_o1_3 := HomalgMatrix( [ ], 0, RankOfObject( t3 ), QQ );;
matrix_mor_t_o1_4 := HomalgMatrix( [ ], RankOfObject( s1 ), 0, QQ );;

mor_t_o1_1 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_1 );;
mor_t_o1_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_2 );;
mor_t_o1_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_3 );;
mor_t_o1_4 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o1_4 );;

m1 := MorphismConstructor( rows_5,
                           o1,
                           [ 4, [1,2,3,4], [ mor_t_o1_1, mor_t_o1_2, mor_t_o1_3, mor_t_o1_4 ] ],
                           test_object );;

# o2 -> test_object
matrix_mor_t_o2_2 := HomalgMatrix( [ ], 0, RankOfObject( t2 ), QQ );;
matrix_mor_t_o2_3 := HomalgMatrix( [ [1,2], [3,4], [5,6] ], RankOfObject( s2 ), RankOfObject( t3 ), QQ );;
matrix_mor_t_o2_4 := HomalgMatrix( [ ], RankOfObject( s2 ), 0, QQ );;

mor_t_o2_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o2_2 );;
mor_t_o2_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o2_3 );;
mor_t_o2_4 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o2_4 );;

m2 := MorphismConstructor( rows_5,
                           o2,
                           [ 3, [2,3,4], [ mor_t_o2_2, mor_t_o2_3, mor_t_o2_4] ],
                           test_object );;

# o3 -> test_object
matrix_mor_t_o3_1 := HomalgMatrix( [ ], RankOfObject( s3 ), 0, QQ );;
matrix_mor_t_o3_2 := HomalgMatrix( [ ], 0, RankOfObject( t2 ), QQ );;
matrix_mor_t_o3_3 := HomalgMatrix( [ [1,2,3], [4,5,6], [7,8,9] ], RankOfObject( s3 ), RankOfObject( t3 ), QQ );;

mor_t_o3_1 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o3_1 );;
mor_t_o3_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o3_2 );;
mor_t_o3_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_t_o3_3 );;

m3 := MorphismConstructor( rows_5,
                           o3,
                           [ 3, [1,2,3], [ mor_t_o3_1, mor_t_o3_2, mor_t_o3_3 ] ],
                           test_object );;

u := UniversalMorphismFromDirectSumWithGivenDirectSum( rows_5, [o1,o2,o3], test_object, [m1,m2,m3], o1o2o3 );;

####################################################
# ComponentOfMorphismIntoDirectSum
####################################################

# test_objects -> o1o2o3
matrix_mor_1 := HomalgMatrix( [ ], 0, RankOfObject( s4 ), QQ );;
matrix_mor_2 := HomalgMatrix( [ ], RankOfObject( t2 ), 0, QQ );;
matrix_mor_3 := HomalgMatrix( [ [1,2,3,4,5],
                                [1,2,3,4,5],
                                [1,2,3,4,5] ],
                              RankOfObject( t3 ),
                              RankOfObject( s5 ),
                              QQ );;

matrix_mor_4 := HomalgMatrix( [ ], 0, RankOfObject( s3 ), QQ );;

mor_1 := AsCategoryOfRowsMorphism( rows, matrix_mor_1 );;
mor_2 := AsCategoryOfRowsMorphism( rows, matrix_mor_2 );;
mor_3 := AsCategoryOfRowsMorphism( rows, matrix_mor_3 );;
mor_4 := AsCategoryOfRowsMorphism( rows, matrix_mor_4 );;

morphism := MorphismConstructor( rows_5,
                                 test_object,
                                 [ 4, [ 1,2,3,4 ], [ mor_1, mor_2, mor_3, mor_4 ] ],
                                 o1o2o3 );;

component1 := ComponentOfMorphismIntoDirectSum( rows_5, morphism, [ o1, o2, o3 ], 1 );;
Display( component1 );
#! Component 1: a 0 x 1 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 0 morphism in Rows( Q )
#! 
#! Component 3: a 3 x 0 morphism in Rows( Q )
#! 
#! Component 4: a 0 x 1 morphism in Rows( Q )
#! 

component2 := ComponentOfMorphismIntoDirectSum( rows_5, morphism, [ o1, o2, o3 ], 2 );;
Display( component2 );
#! Component 1: a 0 x 0 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 0 morphism in Rows( Q )
#! 
#! Component 3: a 3 x 2 morphism in Rows( Q )
#! 
#! [1,1]: 1
#! [1,2]: 2
#! [2,1]: 1
#! [2,2]: 2
#! [3,1]: 1
#! [3,2]: 2
#! 
#! Component 4: a 0 x 2 morphism in Rows( Q )
#! 

component3 := ComponentOfMorphismIntoDirectSum( rows_5, morphism, [ o1, o2, o3 ], 3 );;
Display( component3 );
#! Component 1: a 0 x 3 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 0 morphism in Rows( Q )
#! 
#! Component 3: a 3 x 3 morphism in Rows( Q )
#! 
#! [1,1]: 3
#! [1,2]: 4
#! [1,3]: 5
#! [2,1]: 3
#! [2,2]: 4
#! [2,3]: 5
#! [3,1]: 3
#! [3,2]: 4
#! [3,3]: 5
#! 
#! Component 4: a 0 x 0 morphism in Rows( Q )
#! 

####################################################
# MultiplyWithElementOfCommutativeRingForMorphisms
####################################################

morphism_x_5 := MultiplyWithElementOfCommutativeRingForMorphisms( rows_5, 5, morphism );;
Display( morphism_x_5 );
#! Component 1: a 0 x 4 morphism in Rows( Q )
#! 
#! Component 2: a 2 x 0 morphism in Rows( Q )
#! 
#! Component 3: a 3 x 5 morphism in Rows( Q )
#! 
#! [1,1]: 5
#! [1,2]: 10
#! [1,3]: 15
#! [1,4]: 20
#! [1,5]: 25
#! [2,1]: 5
#! [2,2]: 10
#! [2,3]: 15
#! [2,4]: 20
#! [2,5]: 25
#! [3,1]: 5
#! [3,2]: 10
#! [3,3]: 15
#! [3,4]: 20
#! [3,5]: 25
#! 
#! Component 4: a 0 x 3 morphism in Rows( Q )
#! 

####################################
# Abelian structure
####################################

kernel_obj := KernelObject( morphism );;
kernel_emb := KernelEmbeddingWithGivenKernelObject( morphism, kernel_obj );;
precomp := PreCompose( kernel_emb, morphism );;
IsZeroForMorphisms( precomp );
#! true

cokernel_obj := CokernelObject( morphism );;
cokernel_proj := CokernelProjectionWithGivenCokernelObject( morphism, cokernel_obj );;
precomp := PreCompose( morphism, cokernel_proj );;
IsZeroForMorphisms( precomp );
#! true

id_target := IdentityMorphism( Target( morphism ) );;
lift := Lift( morphism, id_target );;
IsEqualForMorphisms( morphism, PreCompose( lift, id_target ) );
#! true

id_source := IdentityMorphism( Source( morphism ) );;
colift := Colift( id_source, morphism );;
IsEqualForMorphisms( morphism, PreCompose( id_source, colift ) );
#! true

#########################################
# Operations
#########################################

source[1];
#! <A row module over Q of rank 0>

source[2];
#! <A row module over Q of rank 2>

Display( morphism_x_5[1] );
#! Source: 
#! A row module over Q of rank 0
#! 
#! Matrix: 
#! (an empty 0 x 4 matrix)
#! 
#! Range: 
#! A row module over Q of rank 4
#! 
#! A morphism in Rows( Q )

Display( morphism_x_5[2] );
#! Source: 
#! A row module over Q of rank 2
#! 
#! Matrix: 
#! (an empty 2 x 0 matrix)
#! 
#! Range: 
#! A row module over Q of rank 0
#! 
#! A morphism in Rows( Q )

#! @EndExample
