#! @Chapter Skeletal Category of group represenations
#! @Section Examples and Tests

#! @Example
LoadPackage( "GroupRepresentationsForCAP", false );
#! true

QQ := HomalgFieldOfRationalsInSingular();;
A4 := AlternatingGroup( 4 );;
SGReps := SkeletalCategoryOfGroupRepresentations( A4, QQ : no_precompiled_code := false );;

irr := UnderlyingIrreducibleCharacters( SGReps );;

x1 := ObjectConstructor( SGReps, [ 1, [1], [1] ] );;
x2 := ObjectConstructor( SGReps, [ 1, [2], [1] ] );;
x3 := ObjectConstructor( SGReps, [ 1, [3], [1] ] );;
x4 := ObjectConstructor( SGReps, [ 1, [4], [1] ] );;

#########################
# DualOnObjects
#########################

x3_x4 := DirectSum( x3, x4 );;
x3x3x3_x4x4 := DirectSum( [ x3, x3, x3, x4, x4 ] );;
x1_x2_x1_x3x3_x4_x1 := DirectSum( [ x1, x2, x1, x3, x3, x4, x1 ] );;

Display( DualOnObjects( x1 ) );
#! χ₁
Display( DualOnObjects( x2 ) );
#! χ₂
Display( DualOnObjects( x3 ) );
#! χ₄
Display( DualOnObjects( x4 ) );
#! χ₃
Display( DualOnObjects( x3_x4 ) );
#! χ₃⊕χ₄
Display( DualOnObjects( x3x3x3_x4x4 ) );
#! 2χ₃⊕3χ₄
Display( DualOnObjects( x1_x2_x1_x3x3_x4_x1 ) );
#! 3χ₁⊕χ₂⊕χ₃⊕2χ₄
Display( TensorProductOnObjects( DualOnObjects( x3x3x3_x4x4 ), x3x3x3_x4x4 ) );
#! 13χ₁⊕6χ₃⊕6χ₄

#########################
# DualOnMorphisms
#########################

source := ObjectConstructor( SGReps, [ 3, [2,3,4], [2,1,1] ] );;
target := ObjectConstructor( SGReps, [ 3, [1,3,4], [3,2,2] ] );;

matrix_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_2 := HomalgMatrix( [ [ ], [ ] ], 2, 0, QQ );;
matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ [ 4, 2 ] ], 1, 2, QQ );;
matrices_triple := [ 4, [1,2,3,4], [ matrix_1, matrix_2, matrix_3, matrix_4 ] ];;

mor := MorphismConstructor( SGReps, source, matrices_triple, target );;

IsWellDefinedForMorphisms( mor );
#! true

Display( DualOnMorphisms( mor ) );
#! Component: (1)
#! 
#! (an empty 3 x 0 matrix)
#! 
#! ------------------------
#! Component: (2)
#! 
#! (an empty 0 x 2 matrix)
#! 
#! ------------------------
#! Component: (3)
#! 
#! 4,
#! 2 
#! 
#! ------------------------
#! Component: (4)
#! 
#! 5,
#! 6 
#! 
#! ------------------------

source := ObjectConstructor( SGReps, [ 2, [3,4], [1,1] ] );;
target := ObjectConstructor( SGReps, [ 2, [3,4], [2,2] ] );;

matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ [ 4, 2 ] ], 1, 2, QQ );;
matrices_triple := [ 2, [3,4], [ matrix_3, matrix_4 ] ];;

mor := MorphismConstructor( SGReps, source, matrices_triple, target );;

IsWellDefinedForMorphisms( mor );
#! true

Display( DualOnMorphisms( mor ) );
#! Component: (3)
#! 
#! 4,
#! 2 
#! 
#! ------------------------
#! Component: (4)
#! 
#! 5,
#! 6 
#! 
#! ------------------------

#########################
# CoevaluationForDual
#########################

x3_x4 := DirectSum( x3, x4 );;
x3x3x3 := DirectSum( [ x3, x3, x3 ] );;
x3x3x3_x4x4 := DirectSum( [ x3, x3, x3, x4, x4 ] );;
x1_x2_x1_x3x3_x4_x1 := DirectSum( [ x1, x2, x1, x3, x3, x4, x1 ] );;

Display( CoevaluationForDual( x3 ) );
#! Component: (1)
#! 
#! 1
#! 
#! ------------------------

Display( CoevaluationForDual( x3x3x3 ) );
#! Component: (1)
#! 
#! 1,0,0,0,1,0,0,0,1
#! 
#! ------------------------

Display( CoevaluationForDual( x3_x4 ) );
#! Component: (1)
#! 
#! 1,1
#! 
#! ------------------------
#! Component: (3)
#! 
#! (an empty 0 x 1 matrix)
#! 
#! ------------------------
#! Component: (4)
#! 
#! (an empty 0 x 1 matrix)
#! 
#! ------------------------

Display( CoevaluationForDual( x3x3x3_x4x4 ) );
#! Component: (1)
#! 
#! 1,0,0,0,1,0,0,0,1,1,0,0,1
#! 
#! ------------------------
#! Component: (3)
#! 
#! (an empty 0 x 6 matrix)
#! 
#! ------------------------
#! Component: (4)
#! 
#! (an empty 0 x 6 matrix)
#! 
#! ------------------------

Display( CoevaluationForDual( x1_x2_x1_x3x3_x4_x1 ) );
#! Component: (1)
#! 
#! 1,0,0,0,1,0,0,0,1,1,1,0,0,1,1
#! 
#! ------------------------
#! Component: (2)
#! 
#! (an empty 0 x 14 matrix)
#! 
#! ------------------------
#! Component: (3)
#! 
#! (an empty 0 x 12 matrix)
#! 
#! ------------------------
#! Component: (4)
#! 
#! (an empty 0 x 12 matrix)
#! 
#! ------------------------

#########################
# EvaluationForDual
#########################

x3_x4 := DirectSum( x3, x4 );;
x3x3x3 := DirectSum( [ x3, x3, x3 ] );;
x3x3x3_x4x4 := DirectSum( [ x3, x3, x3, x4, x4 ] );;
x1_x2_x1_x3x3_x4_x1 := DirectSum( [ x1, x2, x1, x3, x3, x4, x1 ] );;

Display( EvaluationForDual( x3 ) );
#! Component: (1)
#! 
#! 1
#! 
#! ------------------------

Display( EvaluationForDual( x3x3x3 ) );
#! Component: (1)
#! 
#! 1,
#! 0,
#! 0,
#! 0,
#! 1,
#! 0,
#! 0,
#! 0,
#! 1 
#! 
#! ------------------------

Display( EvaluationForDual( x3_x4 ) );
#! Component: (1)
#! 
#! 1,
#! 1 
#! 
#! ------------------------
#! Component: (3)
#! 
#! (an empty 1 x 0 matrix)
#! 
#! ------------------------
#! Component: (4)
#! 
#! (an empty 1 x 0 matrix)
#! 
#! ------------------------

Display( EvaluationForDual( x3x3x3_x4x4 ) );
#! Component: (1)
#! 
#! 1,
#! 0,
#! 0,
#! 1,
#! 1,
#! 0,
#! 0,
#! 0,
#! 1,
#! 0,
#! 0,
#! 0,
#! 1 
#! 
#! ------------------------
#! Component: (3)
#! 
#! (an empty 6 x 0 matrix)
#! 
#! ------------------------
#! Component: (4)
#! 
#! (an empty 6 x 0 matrix)
#! 
#! ------------------------

Display( EvaluationForDual( x1_x2_x1_x3x3_x4_x1 ) );
#! Component: (1)
#! 
#! 1,
#! 0,
#! 0,
#! 0,
#! 1,
#! 0,
#! 0,
#! 0,
#! 1,
#! 1,
#! 1,
#! 1,
#! 0,
#! 0,
#! 1 
#! 
#! ------------------------
#! Component: (2)
#! 
#! (an empty 14 x 0 matrix)
#! 
#! ------------------------
#! Component: (3)
#! 
#! (an empty 12 x 0 matrix)
#! 
#! ------------------------
#! Component: (4)
#! 
#! (an empty 12 x 0 matrix)
#! 
#! ------------------------

#! @EndExample
