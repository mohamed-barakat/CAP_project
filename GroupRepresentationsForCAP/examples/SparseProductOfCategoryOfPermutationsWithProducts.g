#! @Chapter Skeletal Category of group represenations
#! @Section Examples and Tests

#! @Example
LoadPackage( "GroupRepresentationsForCAP", false );
#! true

PWP := CategoryOfPermuationsWithProducts( );;
ProdPWP := SparseDirectProductOfCartesianCategory( 5, PWP );;

Display( ProdPWP );
#! A CAP category with name 𝚷( 5, CategoryOfPermutationsWithProducts ):
#! 
#! 18 primitive operations were used to derive 52 operations for this catego\
#! ry which mathematically
#! * IsSkeletalCategory

Q := HomalgFieldOfRationals();;
rows := CategoryOfRows( Q );;

F := FunctorPWPToCategoryOfRows( PWP, rows );;
# SF := ExtendFunctorToSparseProduct( F, ProdPWP );

o1 := ObjectConstructor( PWP, 1 );;
o2 := ObjectConstructor( PWP, 2 );;
o3 := ObjectConstructor( PWP, 3 );;
o4 := ObjectConstructor( PWP, 4 );;
o5 := ObjectConstructor( PWP, 5 );;

terminal_object := TerminalObject( PWP );;

source := ObjectConstructor( ProdPWP, [ 4, [ 1, 2, 3, 5 ], [ o1, o4, o1, o1 ] ] );;
target := ObjectConstructor( ProdPWP, [ 2, [    2, 3    ], [     o5, o2     ] ] );;

IsWellDefinedForObjects( source );
#! true
IsWellDefinedForObjects( target );
#! true

morphism_1 := MorphismConstructor( PWP, o1, [ ], terminal_object );;
morphism_2 := MorphismConstructor( PWP, o4, [ [1,3], [3,4] ], o5 );;
morphism_3 := MorphismConstructor( PWP, o1, [ [1,1], [1,1] ], o2 );;
morphism_4 := MorphismConstructor( PWP, terminal_object, [ ], terminal_object );;
morphism_5 := MorphismConstructor( PWP, o1, [ ], terminal_object );;
triple := [ 4, [ 1, 2, 3, 5 ], [ morphism_1, morphism_2, morphism_3, morphism_5 ] ];;

mor := MorphismConstructor( ProdPWP, source, triple, target );;
IsWellDefinedForMorphisms( mor );
#! true

ObjectDatum( source );
#! [ 4, [ 1, 2, 3, 5 ], 
#!   [ <An object in CategoryOfPermutationsWithProducts>, 
#!       <An object in CategoryOfPermutationsWithProducts>, 
#!       <An object in CategoryOfPermutationsWithProducts>, 
#!       <An object in CategoryOfPermutationsWithProducts> ] ]

MorphismDatum( mor );
#! [ 4, [ 1, 2, 3, 5 ], 
#!   [ <A morphism in CategoryOfPermutationsWithProducts>, 
#!       <A morphism in CategoryOfPermutationsWithProducts>, 
#!       <A morphism in CategoryOfPermutationsWithProducts>, 
#!       <A morphism in CategoryOfPermutationsWithProducts> ] ]

#########################################
# IsEqualForObjects
#########################################

terminal_object_prod := TerminalObject( ProdPWP );

IsEqualForObjects( source, source );
#! true

IsEqualForObjects( terminal_object_prod, terminal_object_prod );
#! true

IsEqualForObjects( source, target );
#! false

IsEqualForObjects( target, terminal_object_prod );
#! false

#########################################
# IsEqualForMorphisms
#########################################

#########################################
# IsCongruentForMorphisms
#########################################

#########################################
# IdentityMorphism
#########################################

id_source := IdentityMorphism( source );;
# Display( ApplyFunctor( SF, id_o1 ) );

IsWellDefinedForMorphisms( id_source );
#! true

Display( ListOfColumns( id_source[1] ) );
#! [ [  1,  1 ] ]
Display( ListOfColumns( id_source[2] ) );
#! [ [  1,  4 ] ]
Display( ListOfColumns( id_source[3] ) );
#! [ [  1,  1 ] ]
Display( ListOfColumns( id_source[4] ) );
#! [  ]
Display( ListOfColumns( id_source[5] ) );
#! [ [  1,  1 ] ]

#########################################
# PreCompose
#########################################

#########################################
# UniversalMorphismIntoTerminalObject
#########################################

mor_source_terminal := UniversalMorphismIntoTerminalObject( source );;

IsTerminal( Target( mor_source_terminal ) );
#! true

IsWellDefinedForMorphisms( mor_source_terminal );
#! true

Display( ListOfColumns( mor_source_terminal[1] ) );
#! [  ]

Display( ListOfColumns( mor_source_terminal[2] ) );
#! [  ]

Display( ListOfColumns( mor_source_terminal[3] ) );
#! [  ]

Display( ListOfColumns( mor_source_terminal[4] ) );
#! [  ]

Display( ListOfColumns( mor_source_terminal[5] ) );
#! [  ]

#########################################
# DirectProduct
#########################################

product := DirectProduct( [ source, target, source ] );;

product_1_rows := ApplyFunctor( F, product[1] );
product_2_rows := ApplyFunctor( F, product[2] );
product_3_rows := ApplyFunctor( F, product[3] );
product_4_rows := ApplyFunctor( F, product[4] );
product_5_rows := ApplyFunctor( F, product[5] );

product_1_rows =
    DirectProduct( [
        ApplyFunctor( F, source[1] ),
        ApplyFunctor( F, target[1] ),
        ApplyFunctor( F, source[1] ) ] );
#! true

product_2_rows =
    DirectProduct( [
        ApplyFunctor( F, source[2] ),
        ApplyFunctor( F, target[2] ),
        ApplyFunctor( F, source[2] ) ] );
#! true

product_3_rows =
    DirectProduct( [
        ApplyFunctor( F, source[3] ),
        ApplyFunctor( F, target[3] ),
        ApplyFunctor( F, source[3] ) ] );
#! true

product_4_rows =
    DirectProduct( [
        ApplyFunctor( F, source[4] ),
        ApplyFunctor( F, target[4] ),
        ApplyFunctor( F, source[4] ) ] );
#! true

product_5_rows =
    DirectProduct( [
        ApplyFunctor( F, source[5] ),
        ApplyFunctor( F, target[5] ),
        ApplyFunctor( F, source[5] ) ] );
#! true

#########################################
# ProjectionInFactorOfDirectProduct
#########################################

proj := ProjectionInFactorOfDirectProduct( [ source, target, source ], 2 );;

proj_1_rows := ApplyFunctor( F, proj[1] );
proj_2_rows := ApplyFunctor( F, proj[2] );
proj_3_rows := ApplyFunctor( F, proj[3] );
proj_4_rows := ApplyFunctor( F, proj[4] );
proj_5_rows := ApplyFunctor( F, proj[5] );

proj_1_rows =
    ProjectionInFactorOfDirectProduct( [
        ApplyFunctor( F, source[1] ),
        ApplyFunctor( F, target[1] ),
        ApplyFunctor( F, source[1] )
    ], 2 );
#! true

proj_2_rows =
    ProjectionInFactorOfDirectProduct( [
        ApplyFunctor( F, source[2] ),
        ApplyFunctor( F, target[2] ),
        ApplyFunctor( F, source[2] )
    ], 2 );
#! true

proj_3_rows =
    ProjectionInFactorOfDirectProduct( [
        ApplyFunctor( F, source[3] ),
        ApplyFunctor( F, target[3] ),
        ApplyFunctor( F, source[3] )
    ], 2 );
#! true

proj_4_rows =
    ProjectionInFactorOfDirectProduct( [
        ApplyFunctor( F, source[4] ),
        ApplyFunctor( F, target[4] ),
        ApplyFunctor( F, source[4] )
    ], 2 );
#! true

proj_5_rows =
    ProjectionInFactorOfDirectProduct( [
        ApplyFunctor( F, source[5] ),
        ApplyFunctor( F, target[5] ),
        ApplyFunctor( F, source[5] )
    ], 2 );
#! true

#########################################
# UniversalMorphismIntoDirectProduct
#########################################

univ := UniversalMorphismIntoDirectProduct( ProdPWP, [ mor, mor, mor ] );;

univ_1_rows := ApplyFunctor( F, univ[1] );
univ_2_rows := ApplyFunctor( F, univ[2] );
univ_3_rows := ApplyFunctor( F, univ[3] );
univ_4_rows := ApplyFunctor( F, univ[4] );
univ_5_rows := ApplyFunctor( F, univ[5] );

univ_1_rows =
    UniversalMorphismIntoDirectProduct( [
        ApplyFunctor( F, mor[1] ),
        ApplyFunctor( F, mor[1] ),
        ApplyFunctor( F, mor[1] ) ] );
#! true

univ_2_rows =
    UniversalMorphismIntoDirectProduct( [
        ApplyFunctor( F, mor[2] ),
        ApplyFunctor( F, mor[2] ),
        ApplyFunctor( F, mor[2] ) ] );
#! true


univ_3_rows =
    UniversalMorphismIntoDirectProduct( [
        ApplyFunctor( F, mor[3] ),
        ApplyFunctor( F, mor[3] ),
        ApplyFunctor( F, mor[3] ) ] );
#! true


univ_4_rows =
    UniversalMorphismIntoDirectProduct( [
        ApplyFunctor( F, mor[4] ),
        ApplyFunctor( F, mor[4] ),
        ApplyFunctor( F, mor[4] ) ] );
#! true


univ_5_rows =
    UniversalMorphismIntoDirectProduct( [
        ApplyFunctor( F, mor[5] ),
        ApplyFunctor( F, mor[5] ),
        ApplyFunctor( F, mor[5] ) ] );
#! true

#########################################
# DirectProductFunctorial
#########################################

product := DirectProductFunctorial( [ mor, mor ] );

product_1_rows := ApplyFunctor( F, product[1] );
product_2_rows := ApplyFunctor( F, product[2] );
product_3_rows := ApplyFunctor( F, product[3] );
product_4_rows := ApplyFunctor( F, product[4] );
product_5_rows := ApplyFunctor( F, product[5] );

product_1_rows =
    DirectProductFunctorial( [
        ApplyFunctor( F, mor[1] ),
        ApplyFunctor( F, mor[1] ) ] );
#! true

product_2_rows =
    DirectProductFunctorial( [
        ApplyFunctor( F, mor[2] ),
        ApplyFunctor( F, mor[2] ) ] );
#! true

product_3_rows =
    DirectProductFunctorial( [
        ApplyFunctor( F, mor[3] ),
        ApplyFunctor( F, mor[3] ) ] );
#! true

product_4_rows =
    DirectProductFunctorial( [
        ApplyFunctor( F, mor[4] ),
        ApplyFunctor( F, mor[4] ) ] );
#! true

product_5_rows =
    DirectProductFunctorial( [
        ApplyFunctor( F, mor[5] ),
        ApplyFunctor( F, mor[5] ) ] );
#! true

#########################################
# Operations
#########################################

z := ObjectConstructor( ProdPWP, [ 0, [ ], [ ] ] );;
Display( z );
#! [ 0, [  ], [  ] ]

o := ObjectConstructor( ProdPWP, [ 1, [ 1 ], [ o1 ] ] );;
Display( o );
#! [ 1, [ 1 ], [ An object in CategoryOfPermutationsWithProducts ] ]

#! @EndExample
