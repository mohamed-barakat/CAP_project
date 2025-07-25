#! @Chapter Skeletal Category of group represenations
#! @Section Examples and Tests

#! @Example
LoadPackage( "GroupRepresentationsForCAP", false );
#! true

S4 := SymmetricGroup( 4 );;
character_table := CharacterTable( S4 );
irreducible_characters := Irr( character_table );

Reinterp := ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( irreducible_characters );;
Modeling := ModelingCategory( Reinterp );
PWP := UnderlyingCartesianCategory( Modeling );

Q := HomalgFieldOfRationals();
rows := CategoryOfRows( Q );

F := FunctorPWPToCategoryOfRows( PWP, rows );

Display( Reinterp );
#! A CAP category with name 𝚷( 5, CategoryOfPermutationsWithProducts ):
#! 
#! 18 primitive operations were used to derive 52 operations for this categor\
#! y which mathematically
#! * IsSkeletalCategory

terminal := ObjectConstructor( Reinterp, [ 0, [ ], [ ] ] );;
Display( terminal );
#! [ 0, [  ], [  ] ]

one := ObjectConstructor( Reinterp, [ 1, [ 1 ], [ 1 ] ] );;
Display( one );
#! [ 1, [ 1 ], [ 1 ] ]

#########################################
# Reinterpretation of objects
#########################################

source := ObjectConstructor( Reinterp, [ 2, [ 1, 3 ], [ 1, 5 ] ] );;
IsWellDefinedForObjects( source );
#! true
Display( source );
#! [ 2, [ 1, 3 ], [ 1, 5 ] ]

source_model := ModelingObject( Reinterp, source );;
IsWellDefinedForObjects( source_model );
#! true

source = ReinterpretationOfObject( Reinterp, source_model );
#! true

source_model := ModelingTowerObjectConstructor( Reinterp, [ 2, [ 1, 3 ], [ 1, 5 ] ] );;
IsWellDefinedForObjects( source_model );
#! true

source := ReinterpretationOfObject( Reinterp, source_model );;
IsWellDefinedForObjects( source );
#! true

source_model = ModelingObject( Reinterp, source );
#! true

#########################################
# Reinterpretation of Morphisms
#########################################

# Reinterpretation -> Model -> Reinterpretation

source := ObjectConstructor( Reinterp, [ 4, [ 1, 2, 3, 5 ], [ 1, 4, 1, 1 ] ] );;
target := ObjectConstructor( Reinterp, [ 2, [    2, 3    ], [    5, 2     ] ] );;

morphism_1 := [ ];;
morphism_2 := [ [1,3], [3,4] ];;
morphism_3 := [ [1,1], [1,1] ];;
morphism_4 := [ ];;
morphism_5 := [ ];;
triple := [ 4, [ 1, 2, 3, 5 ], [ morphism_1, morphism_2, morphism_3, morphism_5 ] ];;

mor := MorphismConstructor( Reinterp, source, triple, target );;
IsWellDefinedForMorphisms( mor );
#! true

mor_model := ModelingMorphism( Reinterp, mor );;
mor_reiterp := ReinterpretationOfMorphism( Reinterp, source, mor_model, target );;
IsWellDefinedForMorphisms( mor_model );
#! true
IsWellDefinedForMorphisms( mor_reiterp );
#! true
mor = mor_reiterp;
#! true

# Model -> Reinterpretation -> Model

o1 := ObjectConstructor( PWP, 1 );;
o2 := ObjectConstructor( PWP, 2 );;
o3 := ObjectConstructor( PWP, 3 );;
o4 := ObjectConstructor( PWP, 4 );;
o5 := ObjectConstructor( PWP, 5 );;

source_model := ModelingTowerObjectConstructor( Reinterp, [ 4, [ 1, 2, 3, 5 ], [ 1, 4, 1, 1 ] ] );;
target_model := ModelingTowerObjectConstructor( Reinterp, [ 2, [    2, 3    ], [    5, 2     ] ] );;

IsWellDefinedForObjects( ModelingCategory( Reinterp ), source_model );
#! true
IsWellDefinedForObjects( ModelingCategory( Reinterp ), target_model );
#! true

mor_model := ModelingTowerMorphismConstructor( Reinterp, source_model, triple, target_model );;
mor_reinterp := ReinterpretationOfMorphism( Reinterp, source, mor_model, target );;
IsWellDefinedForMorphisms( mor_reinterp );
#! true
IsWellDefinedForMorphisms( mor_model );
#! true
mor_model = ModelingMorphism( Reinterp, mor_reinterp );
#! true

#########################################
# TensorProductOnObjects
#########################################

tp := TensorProductOnObjects( source, target );;
Display( tp );
#! [ 5, [ 1 .. 5 ], [ 2, 38, 26, 38, 22 ] ]

#########################################
# TensorProductOnMorphisms
#########################################

source := ObjectConstructor( Reinterp, [ 4, [ 1, 2, 3, 5 ], [ 1, 2, 1, 1 ] ] );;
target := ObjectConstructor( Reinterp, [ 2, [    2, 3    ], [    1, 2    ] ] );;

matrix_1 := [ ];;
matrix_2 := [ [ 1, 1 ] ];;
matrix_3 := [ [ 1, 1 ], [ 1, 1 ] ] ];;
matrix_4 := [ ];;
matrix_5 := [ ];;
matrices_triple := [ 4, [ 1, 2, 3, 5 ], [ matrix_1, matrix_2, matrix_3, matrix_5 ] ];;

mor := MorphismConstructor( Reinterp, source, matrices_triple, target );;
IsWellDefinedForMorphisms( mor );

# Display( ApplyFunctor( F, ModelingMorphism( Reinterp, mor )[2] ) );
# Display( ApplyFunctor( F, ModelingMorphism( Reinterp, mor )[3] ) );

tp_mor := TensorProductOnMorphisms( mor, mor );
Display( tp_mor );
#! Component: (1)
#! 
#! [ [  2,  2 ],
#!   [  2,  2 ],
#!   [  2,  2 ],
#!   [  2,  2 ] ]
#! 
#! ------------------------
#! Component: (2)
#! 
#! [ [  1,  1 ],
#!   [  5,  5 ],
#!   [  5,  5 ],
#!   [  9,  9 ],
#!   [  9,  9 ] ]
#! 
#! ------------------------
#! Component: (3)
#! 
#! [ [  2,  2 ],
#!   [  7,  7 ],
#!   [  7,  7 ],
#!   [  7,  7 ],
#!   [  7,  7 ] ]
#! 
#! ------------------------
#! Component: (4)
#! 
#! [ [   5,   5 ],
#!   [   9,   9 ],
#!   [   9,   9 ],
#!   [  11,  11 ],
#!   [  11,  11 ] ]
#! 
#! ------------------------
#! Component: (5)
#! 
#! [ [  2,  2 ],
#!   [  6,  6 ],
#!   [  6,  6 ],
#!   [  6,  6 ],
#!   [  6,  6 ] ]
#! 
#! ------------------------

#! @EndExample
