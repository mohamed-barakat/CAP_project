#! @Chapter Examples
LoadPackage( "GroupRepresentationsForCAP" );

#! @Example
RepG := RepresentationCategory( AlternatingGroup( 4 ) );;
Qmat := UnderlyingCategoryForSemisimpleCategory( RepG );;
QQ := UnderlyingRing( Qmat );;
G := UnderlyingGroupForRepresentationCategory( RepG );;

irr := Irr( G );;

x1 := RepresentationCategoryObject( irr[1], RepG );;
x2 := RepresentationCategoryObject( irr[2], RepG );;
x3 := RepresentationCategoryObject( irr[3], RepG );;
x4 := RepresentationCategoryObject( irr[4], RepG );;

#########################
# DualOnObjects
#########################

x3_x4 := DirectSum( x3, x4 );;
x3x3x3_x4x4 := DirectSum( [ x3, x3, x3, x4, x4 ] );;
x1_x2_x1_x3x3_x4_x1 := DirectSum( [ x1, x2, x1, x3, x3, x4, x1 ] );;

DualOnObjects( x1 );
#! 1*(x_1)
DualOnObjects( x2 );
#! 1*(x_2)
DualOnObjects( x3 );
#! 1*(x_4)
DualOnObjects( x4 );
#! 1*(x_3)
DualOnObjects( x3_x4 );
#! 1*(x_3) + 1*(x_4)
DualOnObjects( x3x3x3_x4x4 );
#! 2*(x_3) + 3*(x_4)
DualOnObjects( x1_x2_x1_x3x3_x4_x1 );
#! 3*(x_1) + 1*(x_2) + 1*(x_3) + 2*(x_4)
Display( TensorProductOnObjects( DualOnObjects( x3x3x3_x4x4 ), x3x3x3_x4x4 ) );
#! 13*(x_1) + 6*(x_3) + 6*(x_4)

#########################
# DualOnMorphisms
#########################

source := RepresentationCategoryObject( [                [ 2, irr[2] ], [ 1, irr[3] ], [ 1, irr[4] ] ], RepG );;
target := RepresentationCategoryObject( [ [ 3, irr[1] ],                [ 2, irr[3] ], [ 2, irr[4] ] ], RepG );;

matrix_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_2 := HomalgMatrix( [ [ ], [ ] ], 2, 0, QQ );;
matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ [ 4, 2 ] ], 1, 2, QQ );;
morphism_pairs := [ [ matrix_1, irr[1] ], [ matrix_2, irr[2] ], [ matrix_3, irr[3] ], [ matrix_4, irr[4] ] ];;

mor := RepresentationCategoryMorphism( source, morphism_pairs, target );;

IsWellDefinedForMorphisms( mor );
#! true

Display( DualOnMorphisms( mor ) );
#! Component: (x_3)
#! 
#! 4,
#! 2 
#! 
#! ------------------------
#! Component: (x_4)
#! 
#! 5,
#! 6 
#! 
#! ------------------------

source := RepresentationCategoryObject( [ [ 1, irr[3] ], [ 1, irr[4] ] ], RepG );;
target := RepresentationCategoryObject( [ [ 2, irr[3] ], [ 2, irr[4] ] ], RepG );;

matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ [ 4, 2 ] ], 1, 2, QQ );;
morphism_pairs := [ [ matrix_3, irr[3] ], [ matrix_4, irr[4] ] ];;

mor := RepresentationCategoryMorphism( source, morphism_pairs, target );;

IsWellDefinedForMorphisms( mor );
#! true

Display( DualOnMorphisms( mor ) );
#! Component: (x_3)
#! 
#! 4,
#! 2 
#! 
#! ------------------------
#! Component: (x_4)
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
#! Component: (x_1)
#! 
#! 1
#! 
#! ------------------------

Display( CoevaluationForDual( x3x3x3 ) );
#! Component: (x_1)
#! 
#! 1,0,0,0,1,0,0,0,1
#! 
#! ------------------------

Display( CoevaluationForDual( x3_x4 ) );
#! Component: (x_1)
#! 
#! 1,1
#! 
#! ------------------------

Display( CoevaluationForDual( x3x3x3_x4x4 ) );
#! Component: (x_1)
#! 
#! 1,0,0,0,1,0,0,0,1,1,0,0,1
#! 
#! ------------------------

Display( CoevaluationForDual( x1_x2_x1_x3x3_x4_x1 ) );
#! Component: (x_1)
#! 
#! 1,0,0,0,1,0,0,0,1,1,1,0,0,1,1
#! 
#! ------------------------

#! @EndExample
