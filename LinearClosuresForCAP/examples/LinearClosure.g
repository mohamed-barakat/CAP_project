#! @Chapter Examples and Tests

#! @Section Linear closure of categories

LoadPackage( "LinearClosuresForCAP" );;

#! @Example
#! #@if IsPackageMarkedForLoading( "FinSetsForCAP", ">= 2023.07-03" )
G := SymmetricGroup( 3 );;
CG := GroupAsCategory( G );;
compare_func := function( g, h ) return UnderlyingGroupElement( g ) < UnderlyingGroupElement( h ); end;;
ZZZ := HomalgRingOfIntegers();;
ZCG := LinearClosure( ZZZ, CG, compare_func );;
u := GroupAsCategoryUniqueObject( CG );;
g := GroupAsCategoryMorphism( (1,2,3), CG );;
h := GroupAsCategoryMorphism( (1,2), CG );;
v := LinearClosureObject( ZCG, u );;
SetOfObjectsOfCategory( ZCG ) = [ v ];
#! true
elem1 := LinearClosureMorphism( v, [ 1, 2, 3, 4, 5, 6 ], [ g, h, g, h, g, h ], v );;
elem2 := LinearClosureMorphism( v, [ 1, 2, 3, 4, 5, 6 ], [ h, g, h, g, h, g ], v );;
# for i in [ 1 .. 10^6 ] do LinearClosureMorphism( v, [ 1, 2, 3, 4, 5, 6 ], [ g, h, g, h, g, h ], v ); od;
elem := LinearClosureMorphism( v, [ 0, 0, 0, 0, 0, 0 ], [ g, h, g, h, g, h ], v );;
a := (1,2)/CG/ZCG;;
b := (2,3)/CG/ZCG;;
IsIsomorphism( a + b );
#! false
Lift( a + b, a ) * a = a + b;
#! true
IsLiftable( a + b, -2*a ); ## over Q this is liftable
#! false
#! #@fi
#! @EndExample
