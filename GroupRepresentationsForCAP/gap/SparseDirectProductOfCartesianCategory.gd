# SPDX-License-Identifier: GPL-2.0-or-later
# LinearClosuresForCAP: Linear closures
#
# Declarations
#
#! @Chapter Direct sums of an additive category

#! @BeginChunk SparseDirectProductOfCartesianCategoryIntroduction

#! Let $A$ be an additive category.
#! 
#! An object datum of the direct sum $\bigoplus_{i=1}^n A$
#! is given by a triple of the form
#! * a positive integer $i \leq n$,
#! * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#! * a list $l_2$ of objects in $A$ with $\texttt{Length}(l_2) = i$.
#! The list $l_1$ is the support, i.e., in which summand of $\bigoplus_{i=1}^n A$
#! the objects of $l_2$ lie. The support of an object in $l_2$ can be identified via its position.
#! Example: Let $[ 3, [2,4,5], [o2,o4,o5] ]$ be an object in $\bigoplus_{i=1}^n A$.
#! Then the support of $o4$ is 4, since:
#! * the position of $o4$ in [o2,o4,o5] is 2,
#! * and at position 2 of [2,4,5] lies 4.
#! 
#! A morphism datum of the direct sum $\bigoplus_{i=1}^n A$
#! is given by a triple of the form
#! * a positive integer $i \leq n$,
#! * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#! * a list $l_2$ of morphisms in $A$ with $\texttt{Length}(l_2) = i$.
#! The list $l_1$ is the support, i.e., in which summand of $\bigoplus_{i=1}^n A$
#! the morphisms of $l_2$ lie. The support of a morphism in $l_2$ can be identified via its position.
#! Example: Let $[ 3, [2,4,5], [m2,m4,m5] ]$ be an morphism in $\bigoplus_{i=1}^n A$.
#! Then the support of $m4$ is 4, since:
#! * the position of $m4$ in [m2,m4,m5] is 2,
#! * and at position 2 of [2,4,5] lies 4.
#! 
#! This is a sparse datastructure in the sense that, zero objects and morphisms with
#! underlying 0x0 matrix need not necessarily be saved.
#! If there is no supporting integer $k$ in $l_1$
#! then at the summand $k$ of $\bigoplus_{i=1}^n A$
#! the datastructure assumes a zero object.
#! Example: The object $[ 3, [2,4,5], [o2,o4,o5] ]$
#! has a zero object at support 1 and 3,
#! since 1,3 ∉ [2,4,5].
#! 
#! The same is true for morphisms, where the datastructure assumes
#! a morphism with underlying 0x0 matrix.

#! @EndChunk

####################################
##
#! @Section GAP Categories
##
####################################

#! @Description
#!  The &GAP; category of n-fold direct sums of an additive category.
#! @Arguments Homalg ring
#! @Returns true or false
DeclareCategory( "IsSparseDirectProductOfCartesianCategory",
                 IsCapCategory );

#! @Description
#!  The &GAP; category of objects in n-fold direct sums of an additive category.
#! @Arguments object
#! @Returns true or false
DeclareCategory( "IsObjectInSparseDirectProductOfCartesianCategory",
                 IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in n-fold direct sums of an additive category.
#! @Arguments morphism
#! @Returns true or false
DeclareCategory( "IsMorphismInSparseDirectProductOfCartesianCategory",
                 IsCapCategoryMorphism );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#!  Construct an n-fold direct sum $\bigoplus_{i=1}^n A$.
#! @Arguments n, A
#! @Returns a &CAP; category
DeclareOperation( "SparseDirectProductOfCartesianCategory",
                  [ IsBigInt, IsCapCategory ] );

#! @Description
#!  Same as <Ref Attr="SparseDirectProductOfCartesianCategory" Label="for IsBigInt, IsCapCategory" />, but as an operation instead of an attribute.
#! @Arguments C
#! @Returns a &CAP; category
# DeclareOperationWithCache( "COPRODUCT_OF_CATEGORY_OF_ROWS_WITH_SPARSE_DATASTRUCTURE",
                  # [ IsCategoryOfRows, IsBigInt ] );

if false then
#! @Description
#!  The input is a coproduct
#!  <A>D</A><C> := SparseDirectProductOfCartesianCategory(</C> $A, n$ <C>)</C>
#!  and a triple consisting of
#!  * an integer $0 \leq i \leq n$,
#!  * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!  * a list $l_2$ of objects in $A$ with $\texttt{Length}(l_2) = i$.
#! @Arguments C, list
#! @Returns an object
DeclareOperation( "ObjectConstructor", [ IsSparseDirectProductOfCartesianCategory, IsList ] );
fi;

if false then
#! @Description
#!  The input is a coproduct
#!  <A>D</A><C> := SparseDirectProductOfCartesianCategory(</C> $n, A$ <C>)</C>,
#!  a source object <A>S</A>,
#!  a triple consisting of
#!    * a positive integer $i \leq n$,
#!    * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!    * a list $l_2$ of morphisms in $A$ with $\texttt{Length}(l_2) = i$,
#!  and a target object <A>T</A>.
#! @Arguments C, S, list, T
#! @Returns an morphism
DeclareOperation( "MorphismConstructor", [ IsSparseDirectProductOfCartesianCategory, IsList ] );
fi;

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the underlying additive category of $\bigoplus_{i=1}^n A$.
#! @Arguments a CAP category
#! @Returns a CAP category
DeclareAttribute( "UnderlyingCartesianCategory", IsSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "UnderlyingCartesianCategory", [ IsSparseDirectProductOfCartesianCategory ],
  function( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCartesianCategory( input_types[1].category ) );
    
end );

#! @Description
#!  Return the number of summands $n$ of $\bigoplus_{i=1}^n A$.
#! @Arguments a CAP category
#! @Returns an integer
DeclareAttribute( "NrFactors", IsSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "NrFactors", [ IsSparseDirectProductOfCartesianCategory ], IsBigInt );

#! @Description
#!  Return a triple of the form
#!  * a positive integer $i \leq n$,
#!  * a list of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!  * a list of objects in $A$ with $\texttt{Length}(l_2) = i$.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "TripleOfNrSupportListOfSupportListOfObjects", IsObjectInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "TripleOfNrSupportListOfSupportListOfObjects", [ IsObjectInSparseDirectProductOfCartesianCategory ],
  function( input_types )
    local A;
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    A := UnderlyingCartesianCategory( input_types[1].category );
    
    return
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( A ) ) );
    
end );

#! @Description
#!  Return a triple of the form
#!  * a positive integer $i \leq n$,
#!  * a list of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!  * a list of morphisms in $A$ with $\texttt{Length}(l_2) = i$.
#! @Arguments morphism
#! @Returns a list
DeclareAttribute( "TripleOfNrSupportListOfSupportListOfMorphisms", IsMorphismInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "TripleOfNrSupportListOfSupportListOfMorphisms", [ IsMorphismInSparseDirectProductOfCartesianCategory ],
  function( input_types )
    local A;
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    A := UnderlyingCartesianCategory( input_types[1].category );
    
    return
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( A ) ) );
    
end );

#! @Description
#!  Given an object in <A>D</A> $\coloneqq \bigoplus_{i=1}^n A$ with
#!  datum $[ n, l_1, l_2 ]$,
#!  return the integer $n$.
#! @Arguments object
#! @Returns an integer
DeclareAttribute( "NrSupport", IsObjectInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "NrSupport", [ IsObjectInSparseDirectProductOfCartesianCategory ], IsBigInt );

#! @Description
#!  Given a morphism in <A>D</A> $\coloneqq \bigoplus_{i=1}^n A$ with
#!  datum $[ n, l_1, l_2 ]$,
#!  return the integer $n$.
#! @Arguments morphism
#! @Returns an integer
DeclareAttribute( "NrSupport", IsMorphismInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "NrSupport", [ IsMorphismInSparseDirectProductOfCartesianCategory ], IsBigInt );

#! @Description
#!  For an object with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_1$.
#! @Arguments object
#! @Returns a list of integers
DeclareAttribute( "Support", IsObjectInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "Support", [ IsObjectInSparseDirectProductOfCartesianCategory ],
  function ( input_types )
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  For a morphism with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_1$.
#! @Arguments morphism
#! @Returns a list of integers
DeclareAttribute( "Support", IsMorphismInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "Support", [ IsMorphismInSparseDirectProductOfCartesianCategory ],
  function ( input_types )
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  Given an object in <A>D</A> $\coloneqq \bigoplus_{i=1}^n A$ with
#!  datum $[ n, l_1, l_2 ]$,
#!  return the list of objects $l_2$.
#! @Arguments object
#! @Returns a list of objects in the underlying additive category.
DeclareAttribute( "Components", IsObjectInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "Components", [ IsObjectInSparseDirectProductOfCartesianCategory ],
  function ( input_types )
    local A;
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    A := UnderlyingCartesianCategory( input_types[1].category );
    
    return CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( A ) );
    
end );

#! @Description
#!  Given a morphism in <A>D</A> $\coloneqq \bigoplus_{i=1}^n A$ with
#!  datum $[ n, l_1, l_2 ]$,
#!  return the list of morphisms $l_2$.
#! @Arguments morphism
#! @Returns a list of morphisms in the underlying additive category.
DeclareAttribute( "Components", IsMorphismInSparseDirectProductOfCartesianCategory );

CapJitAddTypeSignature( "Components", [ IsMorphismInSparseDirectProductOfCartesianCategory ],
  function ( input_types )
    local A;
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    A := UnderlyingCartesianCategory( input_types[1].category );
    
    return CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( A ) );
    
end );

####################################
##
#! @Section Operations
##
####################################

#! @Description
#!  Given an object in <A>D</A> $\coloneqq \bigoplus_{i=1}^n A$ with
#!  datum $[ n, l_1, l_2 ]$ and an integer $1 \leq k \leq n$,
#!  If $k$ is a supporting summand, i.e., $k \in l_1$,
#!  return the object of $l_2$ at position $\texttt{Pos}(l_2, k)$.
#!  If $k$ is not a supporting summand return <C>ZeroObject</C>( $A$ ).
#! @Arguments object, integer
#! @Returns an object
DeclareOperation( "Component", [ IsObjectInSparseDirectProductOfCartesianCategory, IsBigInt ] );

CapJitAddTypeSignature( "Component", [ IsObjectInSparseDirectProductOfCartesianCategory, IsBigInt ],
  function ( input_types )
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCartesianCategory( input_types[1].category ) );
    
end );

#! @Description
#!  Given a morphism $m$ in <A>D</A> $\coloneqq \bigoplus_{i=1}^n A$ with
#!  datum $[ n, l_1, l_2 ]$ and an integer $1 \leq k \leq n$,
#!  If $k$ is a supporting summand, i.e., $k \in l_1$,
#!  return the morphism of $l_2$ at position $\texttt{Pos}(l_2, k)$.
#!  If $k$ is not a supporting summand return
#!  <C>ZeroMorphism</C>( $A$, <C>Component( Source</C>( $m$ ), $k$ ), <C>Component( Target</C>( $m$ ), $k$ ) ).
#! @Arguments morphism, integer
#! @Returns a morphism
DeclareOperation( "Component", [ IsMorphismInSparseDirectProductOfCartesianCategory, IsBigInt ] );

CapJitAddTypeSignature( "Component", [ IsMorphismInSparseDirectProductOfCartesianCategory, IsBigInt ],
  function ( input_types )
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCartesianCategory( input_types[1].category ) );
    
end );

#! @Description
#!  Delegates to <Ref Oper="Component" Label="for IsObjectInSparseDirectProductOfCartesianCategory, IsBigInt" />.
#! @Arguments object, integer
#! @Returns an object
DeclareOperation( "[]", [ IsObjectInSparseDirectProductOfCartesianCategory, IsInt ] );

CapJitAddTypeSignature( "[]", [ IsObjectInSparseDirectProductOfCartesianCategory, IsInt ],
  function ( input_types )
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCartesianCategory( input_types[1].category ) );
    
end );

#! @Description
#!  Delegates to <Ref Oper="Component" Label="for IsMorphismInSparseDirectProductOfCartesianCategory, IsBigInt" />.
#! @Arguments morphism, integer
#! @Returns a morphism
DeclareOperation( "[]", [ IsMorphismInSparseDirectProductOfCartesianCategory, IsInt ] );

CapJitAddTypeSignature( "[]", [ IsMorphismInSparseDirectProductOfCartesianCategory, IsInt ],
  function ( input_types )
    
    Assert( 0, IsSparseDirectProductOfCartesianCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCartesianCategory( input_types[1].category ) );
    
end );

#! @Description
# The input is either
# * a list $l$ of non-negative integers with Length($l$) = NrFactors( C );
# * a list of pairs $[ [ r_i, i ], \dots, [ r_j, j ] ]$ as required by <Ref Oper="ObjectConstructor" Label="for IsSparseDirectProductOfCartesianCategory, IsList" />;
# * a list $l$ of Homalg matrices with Length($l$) = NrFactors( C );
# * a list of pairs $[ [ m_i, i ], \dots, [ m_j, j ] ]$ as required by <Ref Oper="MorphismConstructor" Label="for IsSparseDirectProductOfCartesianCategory, IsList" />;
#! This operation then constructs either an object or a morphism in <C>SparseDirectProductOfCartesianCategory</C>.
#! @Arguments list
#! @Returns an object or a morphism
DeclareOperation( "/",
                  [ IsList, IsSparseDirectProductOfCartesianCategory ] );

####################################
##
#! @Section Global functions
##
####################################

DeclareGlobalFunction( "INSTALL_FUNCTIONS_FOR_SPARSE_DIRECT_PRODUCT_OF_CARTESIAN_CATEGORY" );

