#! @BeginChunk DirectSumOfAdditiveCategory_constructors

#! @Example
LoadPackage( "RingsForHomalg", false );
#! true
LoadPackage( "LinearClosuresForCAP", false );
#! true

QQ := HomalgFieldOfRationals();;
rows := CategoryOfRows( QQ );;
rows_5 := DirectSumOfAdditiveCategory( 5, rows );;

obj1 := CategoryOfRowsObject( rows, 1 );;
obj2 := CategoryOfRowsObject( rows, 2 );;
obj3 := CategoryOfRowsObject( rows, 3 );;

obj := ObjectConstructor( rows_5, [ 3, [ 2, 3, 5 ], [ obj2, obj1, obj1 ] ] );
#! <An object in ⨁( 5, Rows( Q ) )>

IsWellDefinedForObjects( obj );
#! true

source := [ 3, [2,3,5], [2,1,1] ] / rows_5;;
target := [ 3, [1,2,3], [3,1,2] ] / rows_5;;

source = [ 0, 2, 1, 0, 1 ] / rows_5;
#! true
target = [ 3, 1, 2, 0, 0 ] / rows_5;
#! true

matrix_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_2 := HomalgMatrix( [ [ 4 ], [ 1 ] ], 2, 1, QQ );;
matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ ], 0, 0, QQ );;
matrix_5 := HomalgMatrix( [ ], 1, 0, QQ );;
morphism_pairs := [ AsCategoryOfRowsMorphism( rows, matrix_1 ),
                    AsCategoryOfRowsMorphism( rows, matrix_2 ),
                    AsCategoryOfRowsMorphism( rows, matrix_3 ),
                    AsCategoryOfRowsMorphism( rows, matrix_4 ),
                    AsCategoryOfRowsMorphism( rows, matrix_5 ) ];;

mor := MorphismConstructor( rows_5,
            source,
            [ 4,
              [1,2,3,5],
              [ morphism_pairs[1],
                morphism_pairs[2],
                morphism_pairs[3],
                morphism_pairs[5] ] ],
            target );
#! <A morphism in ⨁( 5, Rows( Q ) )>

IsWellDefinedForMorphisms( mor );
#! true

mor_lift := [ matrix_1, matrix_2, matrix_3, matrix_4, matrix_5 ] / rows_5;;

mor_lift = mor;
#! true

IsEqualForObjects( Source( mor ), Source( mor_lift ) );
#! true
IsEqualForObjects( Target( mor ), Target( mor_lift ) );
#! true
TripleOfNrSupportListOfSupportListOfMorphisms( mor ) = TripleOfNrSupportListOfSupportListOfMorphisms( mor_lift );
#! true

#! @EndExample

#! @EndChunk
