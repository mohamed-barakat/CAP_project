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

#########################################
# Tensor Product
#########################################

unit := TensorUnit( SGReps );;

tp := TensorProductOnObjects( SGReps, source, source );;
Display( tp );
#! χ₁⊕12χ₂⊕7χ₃⊕8χ₄⊕6χ₅

zero := ZeroObject( SGReps );;
zero_mor := ZeroMorphism( SGReps, zero, zero );;
tm := TensorProductOnMorphisms( SGReps, zero_mor, mor );;
IsZeroForMorphisms( SGReps, tm );
#! true

tm := TensorProductOnMorphisms( SGReps, mor, zero_mor );;
IsZeroForMorphisms( SGReps, tm );
#! true

tm := TensorProductOnMorphisms( SGReps, mor, mor );;
Display( tm );
#! Component: (1)
#! 
#! 25,30,30,36
#! 
#! ------------------------
#! Component: (2)
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
#! Component: (3)
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
#! Component: (4)
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
#! Component: (5)
#! 
#! 0,0,0,0,0,0,0,0,0,16,0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,4, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,4, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,1, 0, 0, 0, 0, 
#! 0,0,0,0,0,0,0,0,0,0, 25,30,30,36,
#! 0,0,0,0,0,0,0,0,0,0, 0, 0, 0, 0  
#! 
#! ------------------------

source := ObjectConstructor( SGReps, [ 4, [ 1, 2, 3, 5 ], [ 1, 2, 1, 1 ] ] );;
target := ObjectConstructor( SGReps, [ 2, [    2, 3    ], [    1, 2    ] ] );;

matrix_1 := HomalgMatrix( [ ], 1, 0, QQ );;
matrix_2 := HomalgMatrix( [ [ 1 ], [ 0 ] ], 2, 1, QQ );;
matrix_3 := HomalgMatrix( [ [ 1, 1 ] ], 1, 2, QQ );;
matrix_4 := HomalgMatrix( [ ], 0, 0, QQ );;
matrix_5 := HomalgMatrix( [ ], 1, 0, QQ );;

matrices_triple := [ 4, [ 1, 2, 3, 5 ], [ matrix_1, matrix_2, matrix_3, matrix_5 ] ];;

mor := MorphismConstructor( SGReps, source, matrices_triple, target );;
IsWellDefinedForMorphisms( mor );
Display( mor );

tp_mor := TensorProductOnMorphisms( mor, mor );
Display( tp_mor );
#! Component: (1)
#! 
#! 0,0,0,0,
#! 1,1,1,1,
#! 0,0,0,0 
#! 
#! ------------------------
#! Component: (2)
#! 
#! 1,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,1,1,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,1,1,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0 
#! 
#! ------------------------
#! Component: (3)
#! 
#! 0,0,0,0,0,
#! 1,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,1,1,1,1,
#! 0,0,0,0,0,
#! 0,0,0,0,0 
#! 
#! ------------------------
#! Component: (4)
#! 
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 1,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,1,1,0,0,
#! 0,0,0,0,0,
#! 0,0,0,1,1,
#! 0,0,0,0,0 
#! 
#! ------------------------
#! Component: (5)
#! 
#! 0,0,0,0,0,
#! 1,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,1,1,1,1,
#! 0,0,0,0,0 
#! 
#! ------------------------

#! @EndExample
