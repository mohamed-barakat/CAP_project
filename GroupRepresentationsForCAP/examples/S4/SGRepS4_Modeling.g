#! @Chapter Skeletal Category of group represenations
#! @Section Examples and Tests

#! @Example
LoadPackage( "GroupRepresentationsForCAP", false );
#! true

QQ := HomalgFieldOfRationalsInSingular();;
S4 := SymmetricGroup( 4 );;
SGReps := SkeletalCategoryOfGroupRepresentations( S4, QQ : no_precompiled_code := false );;
DS := ModelingCategory( SGReps );;
rows := UnderlyingAdditiveCategory( DS );;

Display( SGReps );
#! A CAP category with name SkeletalGroupRepresentations( SymmetricGroup( [ 1 .. 4 ] ), Q ):
#! 
#! 44 primitive operations were used to derive 322 operations for this category which algorithmi\
#! cally
#! * IsLinearCategoryOverCommutativeRing
#! * IsAbelianCategory
#! * IsRigidSymmetricClosedMonoidalCategory
#! and furthermore mathematically
#! * IsSkeletalCategory

irr := UnderlyingIrreducibleCharacters( SGReps );;

DS = ModelingCategory( SGReps );
#! true

x_1 := irr[1];;
x_2 := irr[2];;
x_3 := irr[3];;
x_4 := irr[4];;
x_5 := irr[5];;

#########################################
# Reinterpretation of objects
#########################################

source := ObjectConstructor( SGReps, [ 2, [ 1, 3 ], [ 1, 5 ] ] );;
IsWellDefinedForObjects( source );
#! true
Display( source );
#! χ₁⊕5χ₃

source_model := ModelingObject( SGReps, source );;
IsWellDefinedForObjects( source_model );
#! true

source = ReinterpretationOfObject( SGReps, source_model );
#! true

source_model := ModelingTowerObjectConstructor( SGReps, [ 2, [ 1, 3 ], [ 1, 5 ] ] );;
IsWellDefinedForObjects( source_model );
#! true

source := ReinterpretationOfObject( SGReps, source_model );;
IsWellDefinedForObjects( source );
#! true

source_model = ModelingObject( SGReps, source );
#! true

#########################################
# Reinterpretation of Morphisms
#########################################

# Reinterpretation -> Model -> Reinterpretation

source := ObjectConstructor( SGReps, [ 3, [ 2, 3, 5 ], [ 2, 1, 1 ] ] );;
target := ObjectConstructor( SGReps, [ 3, [ 1, 2, 3 ], [ 3, 1, 2 ] ] );;

matrix_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_2 := HomalgMatrix( [ [ 4 ], [ 1 ] ], 2, 1, QQ );;
matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ ], 0, 0, QQ );;
matrix_5 := HomalgMatrix( [ ], 1, 0, QQ );;
matrices_triple := [ 4, [ 1, 2, 3, 5 ], [ matrix_1, matrix_2, matrix_3, matrix_5 ] ];;

mor := MorphismConstructor( SGReps, source, matrices_triple, target );;
IsWellDefinedForMorphisms( mor );
#! true

mor_model := ModelingMorphism( SGReps, mor );;
mor_reiterp := ReinterpretationOfMorphism( SGReps, source, mor_model, target );;
IsWellDefinedForMorphisms( mor_model );
#! true
IsWellDefinedForMorphisms( mor_reiterp );
#! true
mor = mor_reiterp;
#! true

# Model -> Reinterpretation -> Model

source_model := ModelingTowerObjectConstructor( SGReps, [ 3, [ 2, 3, 5 ], [ 2, 1, 1 ] ] );;
target_model := ModelingTowerObjectConstructor( SGReps, [ 3, [ 1, 2, 3 ], [ 3, 1, 2 ] ] );;
IsWellDefinedForObjects( ModelingCategory( SGReps ), source_model );
#! true
IsWellDefinedForObjects( ModelingCategory( SGReps ), target_model );
#! true

mor_model := ModelingTowerMorphismConstructor( SGReps, source_model, matrices_triple, target_model );;
mor_reinterp := ReinterpretationOfMorphism( SGReps, source, mor_model, target );;
IsWellDefinedForMorphisms( mor_reinterp );
#! true
IsWellDefinedForMorphisms( mor_model );
#! true
mor_model = ModelingMorphism( SGReps, mor_reinterp );
#! true

#########################################
# Operations
#########################################

source[2];
#! 2
mor[2];
#! <A 2 x 1 matrix over an external ring>
z := ObjectConstructor( SGReps, [ 0, [ ], [ ] ] );;
Display( z );
#! 0
o := ObjectConstructor( SGReps, [ 1, [ 1 ], [ 1 ] ] );;
Display( o );
#! χ₁

DecompositionIntoSimpleObjects( z );
#! [  ]

L := DecompositionIntoSimpleObjects( source );;
Display( L[1] );
#! χ₂
Display( L[2] );
#! χ₂
Display( L[3] );
#! χ₃
Display( L[4] );
#! χ₅

L := DecompositionIntoSimpleObjects( target );;
Display( L[1] );
#! χ₁
Display( L[2] );
#! χ₁
Display( L[3] );
#! χ₁
Display( L[4] );
#! χ₂
Display( L[5] );
#! χ₃
Display( L[6] );
#! χ₃

#! @EndExample
