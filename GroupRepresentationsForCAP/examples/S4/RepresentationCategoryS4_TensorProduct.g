#! @Chapter Examples

LoadPackage( "GroupRepresentationsForCAP" );

#! @Example
RepG := RepresentationCategory( SymmetricGroup( 4 ) );;

Qmat := UnderlyingCategoryForSemisimpleCategory( RepG );;

QQ := UnderlyingRing( Qmat );;

G := UnderlyingGroupForRepresentationCategory( RepG );;

irr := Irr( G );;

v1 := RepresentationCategoryObject( irr[1], RepG );;
v2 := RepresentationCategoryObject( irr[2], RepG );;
v3 := RepresentationCategoryObject( irr[3], RepG );;
v4 := RepresentationCategoryObject( irr[4], RepG );;
v5 := RepresentationCategoryObject( irr[5], RepG );;

L := [ v1, v2, v3, v4, v5 ];;

x1 := RepresentationCategoryObject( [ [ 1, irr[1] ], [ 2, irr[4] ] ], RepG );;
x2 := RepresentationCategoryObject( [ [ 1, irr[2] ], [ 3, irr[3] ] ], RepG );;
x3 := RepresentationCategoryObject( [ [ 2, irr[2] ], [ 3, irr[4] ], [ 5, irr[5] ] ], RepG );;

TensorProductOnObjects( RepG, x1, x2 );
#! 2*(x_1) + 8*(x_2) + 5*(x_3) + 9*(x_4)

source := RepresentationCategoryObject( [                [ 2, irr[2] ], [ 1, irr[3] ], [ 1, irr[5] ] ], RepG );;
target := RepresentationCategoryObject( [ [ 3, irr[1] ], [ 1, irr[2] ], [ 2, irr[3] ],               ], RepG );;

matrix_1 := HomalgMatrix( [ ], 0, 3, QQ );;
matrix_2 := HomalgMatrix( [ [ 4 ], [ 1 ] ], 2, 1, QQ );;
matrix_3 := HomalgMatrix( [ [ 5, 6 ] ], 1, 2, QQ );;
matrix_5 := HomalgMatrix( [ ], 1, 0, QQ );;
morphism_pairs := [ [ matrix_1, irr[1] ], [ matrix_2, irr[2] ], [ matrix_3, irr[3] ], [ matrix_5, irr[5] ] ];;

mor := RepresentationCategoryMorphism( source, morphism_pairs, target );;

IsWellDefinedForMorphisms( mor );
#! true

# Component( TensorProductOnMorphisms( mor, mor ), GIrreducibleObject( irr[2] ) );
# Source( Component( TensorProductOnMorphisms( mor, mor ), GIrreducibleObject( irr[2] ) ) );

Display( TensorProductOnMorphisms( mor, mor ) );
#! Component: (x_1)
#! 
#! 25,30,30,36
#! 
#! ------------------------
#! Component: (x_2)
#! 
#! 16,0, 0, 0, 0, 
#! 4, 0, 0, 0, 0, 
#! 4, 0, 0, 0, 0, 
#! 1, 0, 0, 0, 0, 
#! 0, 20,24,0, 0, 
#! 0, 5, 6, 0, 0, 
#! 0, 0, 0, 0, 0, 
#! 0, 0, 0, 0, 0, 
#! 0, 0, 0, 20,24,
#! 0, 0, 0, 5, 6, 
#! 0, 0, 0, 0, 0, 
#! 0, 0, 0, 0, 0  
#! 
#! ------------------------
#! Component: (x_3)
#! 
#! 0,0,0,0,0,0,16,0,0,0,0,0,0,0, 0, 0, 0, 
#! 0,0,0,0,0,0,4, 0,0,0,0,0,0,0, 0, 0, 0, 
#! 0,0,0,0,0,0,4, 0,0,0,0,0,0,0, 0, 0, 0, 
#! 0,0,0,0,0,0,1, 0,0,0,0,0,0,0, 0, 0, 0, 
#! 0,0,0,0,0,0,0, 0,0,0,0,0,0,25,30,30,36,
#! 0,0,0,0,0,0,0, 0,0,0,0,0,0,0, 0, 0, 0, 
#! 0,0,0,0,0,0,0, 0,0,0,0,0,0,0, 0, 0, 0  
#! 
#! ------------------------
#! Component: (x_4)
#! 
#! 0,0,0,0,0,0,16,0, 0, 0, 0, 
#! 0,0,0,0,0,0,4, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,4, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,1, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0, 20,24,0, 0, 
#! 0,0,0,0,0,0,0, 5, 6, 0, 0, 
#! 0,0,0,0,0,0,0, 0, 0, 20,24,
#! 0,0,0,0,0,0,0, 0, 0, 5, 6  
#! 
#! ------------------------
#! Component: (x_5)
#! 
#! 0,0,0,0,0,0,0,0,0,16,0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,4, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,4, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,1, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,0, 25,30,30,36,
#! 0,0,0,0,0,0,0,0,0,0, 0, 0, 0, 0  
#! 
#! ------------------------

#! @EndExample
