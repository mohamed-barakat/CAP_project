# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Declarations
#

#! @Chapter Skeletal Group Representations

#! @BeginChunk ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations

# TODO: Copy and adjust the introduction from SparseDirectProductOfCartesianCategory

#! @EndChunk

####################################
##
#! @Section GAP Categories
##
####################################

#! @Description
#!  The &GAP; category of skeletal categories of group representations.
#! @Arguments object
#! @Returns true or false
DeclareCategory( "IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations",
                 IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a skeletal category of group representations.
#! @Arguments object
#! @Returns true or false
DeclareCategory( "IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations",
                 IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a skeletal category of group representations.
#! @Arguments object
#! @Returns true or false
DeclareCategory( "IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations",
                 IsCapCategoryMorphism );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#! @Returns a category
#! @Arguments category
DeclareOperation( "ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations",
                  [ IsList ] );

if false then
#! @Description
#!  The input is a category
#!  <A>C</A><C> := ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations(</C> $G, F$ <C>)</C> and
#!  a triple consisting of
#!    * an integer $0 \leq i \leq |\mathrm{Irr}(G)|$,
#!    * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!    * a list $l_2$ of integers with $\texttt{Length}(l_2) = i$.
#! @Arguments C, list
#! @Returns an object
DeclareOperation( "ObjectConstructor", [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsList ] );
fi;

if false then
#! @Description
#!  The input is a category
#!  <A>C</A><C> := ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations(</C> $G, F$ <C>)</C>,
#!  a source object <A>S</A>,
#!  a triple consisting of
#!    * an integer $0 \leq i \leq |\mathrm{Irr}(G)|$,
#!    * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!    * a list $l_2$ of Homalg matrices with $\texttt{Length}(l_2) = i$,
#!  and a target object <A>T</A>.
#! @Arguments C, S, list, T
#! @Returns an morphism
DeclareOperation( "MorphismConstructor", [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsList ] );
fi;

####################################
##
#! @Section Attributes
##
####################################

#! @Description
#!  Return the number of summands $n$ of $\bigoplus_{i=1}^n A$.
#! @Arguments a CAP category
#! @Returns an integer
DeclareAttribute( "NrIrreducibleCharacters", IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "NrIrreducibleCharacters", [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ], IsBigInt );

#! @Description
#!  TODO
#!  The output is the underlying character table of the group $G$.
#! @Arguments C
#! @Returns Character table
DeclareAttribute( "UnderlyingIrreducibleCharacters", IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "UnderlyingIrreducibleCharacters", [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( IsIrreducibleCharacter );
    
end );

#! @Description
#!  The argument is an object in a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  It returns a list of pairs of the format $[ [ r_i, \chi_i ], \dots, [ r_j, \chi_j ] ]$
#!  representing a direct sum $r_i \oplus \dots \oplus r_j in C$ where
#!  * $r_i, ..., r_j$ are non-negative integers representing the ranks of vectorspace objects of the $\mathrm{Rows}_k$ and
#!  * $chi_i, \dots, chi_j$ are the indices of irreducible characters of $G$.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "TripleOfNrSupportListOfSupportListOfNumberElements", IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "TripleOfNrSupportListOfSupportListOfNumberElements", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( IsBigInt ) );
            
end );

#! @Description
#!  The argument is a morphism in a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  It returns a list of pairs of the format $[ [ m_i, \chi_i ], \dots, [ m_j, \chi_j ] ]$ where
#!  * $m_i, ..., m_j$ are matrices over $k$ and
#!  * $chi_i, \dots, chi_j$ are the indices of irreducible characters of $G$.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "TripleOfNrSupportListOfSupportListOfListOfColumns", IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "TripleOfNrSupportListOfSupportListOfListOfColumns", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf(
                CapJitDataTypeOfListOf(
                    CapJitDataTypeOfNTupleOf( 2,
                        IsBigInt,
                        IsBigInt ) ) ) );
                        
end );

#! @Description
#!  Given an object
#!  with datum $[ n, l_1, l_2 ]$, return the integer $n$.
#! @Arguments object
#! @Returns an integer
DeclareAttribute( "NrSupport", IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "NrSupport", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ], IsBigInt );

#! @Description
#!  Given a morphism
#!  with datum $[ n, l_1, l_2 ]$, return the integer $n$.
#! @Arguments morphism
#! @Returns an integer
DeclareAttribute( "NrSupport", IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "NrSupport", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ], IsBigInt );

#! @Description
#!  For an object with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_1$.
#! @Arguments object
#! @Returns a list of integers
DeclareAttribute( "Support", IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "Support", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  For a morphism with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_1$.
#! @Arguments morphism
#! @Returns a list of integers
DeclareAttribute( "Support", IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "Support", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  Given an object with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_2$.
#! @Arguments object
#! @Returns a list of intgers
DeclareAttribute( "Components", IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "Components", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  Given a morphism with datum $[ n, l_1, l_2 ]$,
#!  return the list of Homalg matrices $l_2$.
#! @Arguments morphism
#! @Returns a list of Homalg matrices
DeclareAttribute( "Components", IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations );

CapJitAddTypeSignature( "Components", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return
        CapJitDataTypeOfListOf(
            CapJitDataTypeOfListOf(
                CapJitDataTypeOfNTupleOf( 2,
                    IsBigInt,
                    IsBigInt ) ) );
                    
end );

####################################
##
#! @Section Operations
##
####################################

#! @Description
#!  The argument is an object in $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  It returns the list of ranks $[ m_1, \dots, m_{n} ]$ for $n = |\mathrm{Irr}(G)|$ of $A$.
#! @Arguments object
#! @Returns a list of integers.
DeclareOperation( "ListOfNumberElements", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ] );

CapJitAddTypeSignature( "ListOfNumberElements", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  The arguments are a category TODO
#!  and two positions of characters in <C>UnderlyingIrreducibleCharacters</C>( <A>C</A> ).
#!  It returns a triple $[ n, l_1, l_2 ]$ where
#!    1. $n = \texttt{Length}(l_1) = \texttt{Length}(l_2)$,
#!    2. $l_1$ is the support, i.e., the positions of all
#!       non-zero characters occuring in the decomposition,
#!    3. $l_2$ is the multiplicity of each irreducible character,
#!       occuring in the decomposion, as an object in the underlying category of rows.
#!  Example in S4: χ₂·χ₃ = 1χ₂⊕1χ₄,
#!                 so this function returns [ 2, [ 2, 4 ], [ RowsObject(1), RowsObject(1) ] ].
#! @Arguments a category, integer, integer
#! @Returns a triple
DeclareOperation( "DecomposeProductOfCharacters", [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsBigInt, IsBigInt ] );

CapJitAddTypeSignature( "DecomposeProductOfCharacters",
                        [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsList, IsBigInt, IsBigInt ],
                        
  function ( input_types )
    
    Assert( 0, input_types[2].element_type.filter = IsIrreducibleCharacter );
    
    return CapJitDataTypeOfNTupleOf( 3,
                IsBigInt,
                CapJitDataTypeOfListOf( IsBigInt ),
                CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( input_types[1].category ) ) );
    
end );

#! @Description
#!  TODO:
#!  The arguments are an object $O$ and an integer $i$.
#!  The output is the rank of the $i$'th summand of $O$.
#! @Arguments O, i
#! @Returns integer
DeclareOperation( "[]", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsInt ] );

#! @Description
#!  TODO:
#!  The arguments are a morphism $\alpha \colon A \to B$ in a disconnected additive closure $C^\oplus$  of an object finite
#!  pre-additive category $C$ and two integers $i,j$.
#!  The output is the $i$'th morphism matrix in <C>ListOfMatrices</C>($\alpha$), i.e.,
#!  the morphism matrix for the $i$'th object of the underlying category.
#! @Arguments alpha, i, j
#! @Returns a morphism $C$
DeclareOperation( "[]", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsInt ] );

#! @Description
#!  Given an object in <A>C</A> $\coloneqq \bigoplus_{i=1}^n \mathrm{Rows}_R$ with
#!  datum $[ n, l_1, l_2 ]$ and an integer $1 \leq k \leq n$,
#!  If $k$ is a supporting summand, i.e., $k \in l_1$,
#!  return the integer of $l_2$ at position $\texttt{Pos}(l_2, k)$.
#!  If $k$ is not a supporting summand then return 0.
#! @Arguments object, integer
#! @Returns an integer
DeclareOperation( "Component", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsBigInt ] );

CapJitAddTypeSignature( "Component", [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsBigInt ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return rec( filter := IsBigInt );
    
end );

#! @Description
#!  Given a morphism $m$ in <A>C</A> $\coloneqq \bigoplus_{i=1}^n \mathrm{Rows}_R$ with
#!  datum $[ n, l_1, l_2 ]$ and an integer $1 \leq k \leq n$,
#!  If $k$ is a supporting summand, i.e., $k \in l_1$,
#!  return the Homalg matrix of $l_2$ at position $\texttt{Pos}(l_2, k)$.
#!  If $k$ is not a supporting summand then return
#!  a zero matrix of dimensions <C>Component( Source</C>( $m$ ), $k$ ) $times$ <C>Component( Target</C>( $m$ ), $k$ ) ).
#! @Arguments morphism, integer
#! @Returns a Homalg matrix
DeclareOperation( "Component", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsBigInt ] );

CapJitAddTypeSignature( "Component", [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsBigInt ],
  function ( input_types )
    
    Assert( 0, IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( input_types[1].category ) );
    
    return
        CapJitDataTypeOfListOf(
            CapJitDataTypeOfNTupleOf( 2,
                IsBigInt,
                IsBigInt ) );
                
end );

