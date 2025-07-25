# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Declarations
#

#! @Chapter Skeletal Group Representations

#! @BeginChunk SkeletalGroupRepresentationsIntroduction

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
DeclareCategory( "IsSkeletalCategoryOfGroupRepresentations",
                 IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a skeletal category of group representations.
#! @Arguments object
#! @Returns true or false
DeclareCategory( "IsObjectInSkeletalCategoryOfGroupRepresentations",
                 IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a skeletal category of group representations.
#! @Arguments object
#! @Returns true or false
DeclareCategory( "IsMorphismInSkeletalCategoryOfGroupRepresentations",
                 IsCapCategoryMorphism );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#! @Returns a category
#! @Arguments k, nr_simple_objects
DeclareOperation( "SkeletalCategoryOfGroupRepresentations",
                  [ IsGroup, IsFieldForHomalg ] );

if false then
#! @Description
#!  The input is a category
#!  <A>C</A><C> := SkeletalCategoryOfGroupRepresentations(</C> $G, F$ <C>)</C> and
#!  a triple consisting of
#!    * an integer $0 \leq i \leq |\mathrm{Irr}(G)|$,
#!    * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!    * a list $l_2$ of integers with $\texttt{Length}(l_2) = i$.
#! @Arguments C, list
#! @Returns an object
DeclareOperation( "ObjectConstructor", [ IsSkeletalCategoryOfGroupRepresentations, IsList ] );
fi;

if false then
#! @Description
#!  The input is a category
#!  <A>C</A><C> := SkeletalCategoryOfGroupRepresentations(</C> $G, F$ <C>)</C>,
#!  a source object <A>S</A>,
#!  a triple consisting of
#!    * an integer $0 \leq i \leq |\mathrm{Irr}(G)|$,
#!    * a list $l_1$ of strictly increasing integers with $\texttt{Length}(l_1) = i$,
#!    * a list $l_2$ of Homalg matrices with $\texttt{Length}(l_2) = i$,
#!  and a target object <A>T</A>.
#! @Arguments C, S, list, T
#! @Returns an morphism
DeclareOperation( "MorphismConstructor", [ IsSkeletalCategoryOfGroupRepresentations, IsList ] );
fi;

####################################
##
#! @Section Attributes
##
####################################

#! @Description
#!  The argument is a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  The output is the underlying group $G$.
#! @Returns G
#! @Arguments C
DeclareAttribute( "UnderlyingGroup",
                  IsSkeletalCategoryOfGroupRepresentations );

#! @Description
#!  The argument is a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  The output is the underlying character table of the group $G$.
#! @Returns Character table
#! @Arguments C
DeclareAttribute( "UnderlyingCharacterTable",
                  IsSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "UnderlyingCharacterTable", [ IsSkeletalCategoryOfGroupRepresentations ], IsCharacterTable );

#! @Description
#!  The argument is a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  The output is the list of irreducible characters of the group $G$.
#! @Returns List of irreducible characters
#! @Arguments C
DeclareAttribute( "UnderlyingIrreducibleCharacters",
                  IsSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "UnderlyingIrreducibleCharacters", [ IsSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( IsIrreducibleCharacter );
    
end );

#! @Description
#!  The argument is a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  The output is the number of irreducible characters of the group $G$.
#! @Returns integer
#! @Arguments C
DeclareAttribute( "NrIrreducibleCharacters",
                  IsSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "NrIrreducibleCharacters", [ IsSkeletalCategoryOfGroupRepresentations ], IsBigInt );

#! @Description
#!  The argument is a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  The output is the underlying splitting field $k$.
#! @Returns k
#! @Arguments C
DeclareAttribute( "UnderlyingSplittingField",
                  IsSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "UnderlyingSplittingField", [ IsSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfRing( UnderlyingSplittingField( input_types[1].category ) );
    
end );

#! @Description
#!  The argument is a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  The output is the underlying splitting field $k$.
#! @Returns k
#! @Arguments C
DeclareAttribute( "AssociatorData",
                  IsSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "AssociatorData", [ IsSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf(
                CapJitDataTypeOfListOf(
                    CapJitDataTypeOfListOf(
                        CapJitDataTypeOfRing( UnderlyingSplittingField( input_types[1].category ) ) ) ) );
                        
end );

#! @Description
#!  TODO
#! @Returns TODO
#! @Arguments TODO
DeclareAttribute( "UnderlyingProductCategoryOfPermutationsWithProduct",
                  IsSkeletalCategoryOfGroupRepresentations );

#! @Description
#!  The argument is an object in a category $C = \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$.
#!  It returns a list of pairs of the format $[ [ r_i, \chi_i ], \dots, [ r_j, \chi_j ] ]$
#!  representing a direct sum $r_i \oplus \dots \oplus r_j in C$ where
#!  * $r_i, ..., r_j$ are non-negative integers representing the ranks of vectorspace objects of the $\mathrm{Rows}_k$ and
#!  * $chi_i, \dots, chi_j$ are the indices of irreducible characters of $G$.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "TripleOfNrSupportListOfSupportListOfRanks", IsObjectInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "TripleOfNrSupportListOfSupportListOfRanks", [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
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
DeclareAttribute( "TripleOfNrSupportListOfSupportListOfMatrices", IsMorphismInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "TripleOfNrSupportListOfSupportListOfMatrices", [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    local splitting_field;
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    splitting_field := UnderlyingSplittingField( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( rec( filter := IsHomalgMatrix, ring := splitting_field ) ) );
    
end );

#! @Description
#!  Given an object
#!  with datum $[ n, l_1, l_2 ]$, return the integer $n$.
#! @Arguments object
#! @Returns an integer
DeclareAttribute( "NrSupport", IsObjectInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "NrSupport", [ IsObjectInSkeletalCategoryOfGroupRepresentations ], IsBigInt );

#! @Description
#!  Given a morphism
#!  with datum $[ n, l_1, l_2 ]$, return the integer $n$.
#! @Arguments morphism
#! @Returns an integer
DeclareAttribute( "NrSupport", IsMorphismInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "NrSupport", [ IsMorphismInSkeletalCategoryOfGroupRepresentations ], IsBigInt );

#! @Description
#!  For an object with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_1$.
#! @Arguments object
#! @Returns a list of integers
DeclareAttribute( "Support", IsObjectInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "Support", [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  For a morphism with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_1$.
#! @Arguments morphism
#! @Returns a list of integers
DeclareAttribute( "Support", IsMorphismInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "Support", [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  Given an object with datum $[ n, l_1, l_2 ]$,
#!  return the list of integers $l_2$.
#! @Arguments object
#! @Returns a list of intgers
DeclareAttribute( "Components", IsObjectInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "Components", [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  Given a morphism with datum $[ n, l_1, l_2 ]$,
#!  return the list of Homalg matrices $l_2$.
#! @Arguments morphism
#! @Returns a list of Homalg matrices
DeclareAttribute( "Components", IsMorphismInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "Components", [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    local splitting_field;
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    splitting_field := UnderlyingSplittingField( input_types[1].category );
    
    return CapJitDataTypeOfListOf( rec( filter := IsHomalgMatrix, ring := splitting_field ) );
    
end );

#! @Description
#!  Given an object $\bigoplus_i a_i\chi_i \in \bigoplus_{i \leq |\mathrm{Irr}(G)|} \mathrm{Rows}_k$
#!  turn it into a list of objects $[ a_1\chi_1, \dots, a_{|\mathrm{Irr}(G)|}\chi_{|\mathrm{Irr}(G)|}$.
#! @Arguments object
#! @Returns a list of objects
DeclareAttribute( "DecompositionIntoSimpleObjects", IsObjectInSkeletalCategoryOfGroupRepresentations );

CapJitAddTypeSignature( "DecompositionIntoSimpleObjects", [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( input_types[1].category ) );
    
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
DeclareOperation( "Ranks", [ IsObjectInSkeletalCategoryOfGroupRepresentations ] );

CapJitAddTypeSignature( "Ranks", [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

#! @Description
#!  TODO:
#!  The arguments are an object $O$ and an integer $i$.
#!  The output is the rank of the $i$'th summand of $O$.
#! @Arguments O, i
#! @Returns integer
DeclareOperation( "[]", [ IsObjectInSkeletalCategoryOfGroupRepresentations, IsInt ] );

CapJitAddTypeSignature( "[]", [ IsObjectInSkeletalCategoryOfGroupRepresentations, IsInt ], function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    return rec( filter := IsBigInt );
    
end );

#! @Description
#!  TODO:
#!  The arguments are a morphism $\alpha \colon A \to B$ in a disconnected additive closure $C^\oplus$  of an object finite
#!  pre-additive category $C$ and two integers $i,j$.
#!  The output is the $i$'th morphism matrix in <C>ListOfMatrices</C>($\alpha$), i.e.,
#!  the morphism matrix for the $i$'th object of the underlying category.
#! @Arguments alpha, i, j
#! @Returns a morphism $C$
DeclareOperation( "[]", [ IsMorphismInSkeletalCategoryOfGroupRepresentations, IsInt ] );

CapJitAddTypeSignature( "[]", [ IsMorphismInSkeletalCategoryOfGroupRepresentations, IsInt ], function ( input_types )
    local splitting_field;
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    splitting_field := UnderlyingSplittingField( input_types[1].category );
    
    return rec( filter := IsHomalgMatrix, ring := splitting_field );
    
end );

#! @Description
#!  Given an object in <A>C</A> $\coloneqq \bigoplus_{i=1}^n \mathrm{Rows}_R$ with
#!  datum $[ n, l_1, l_2 ]$ and an integer $1 \leq k \leq n$,
#!  If $k$ is a supporting summand, i.e., $k \in l_1$,
#!  return the integer of $l_2$ at position $\texttt{Pos}(l_2, k)$.
#!  If $k$ is not a supporting summand then return 0.
#! @Arguments object, integer
#! @Returns an integer
DeclareOperation( "Component", [ IsObjectInSkeletalCategoryOfGroupRepresentations, IsBigInt ] );

CapJitAddTypeSignature( "Component", [ IsObjectInSkeletalCategoryOfGroupRepresentations, IsBigInt ],
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
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
DeclareOperation( "Component", [ IsMorphismInSkeletalCategoryOfGroupRepresentations, IsBigInt ] );

CapJitAddTypeSignature( "Component", [ IsMorphismInSkeletalCategoryOfGroupRepresentations, IsBigInt ],
  function ( input_types )
    local splitting_field;
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[1].category ) );
    
    splitting_field := UnderlyingSplittingField( input_types[1].category );
    
    return rec( filter := IsHomalgMatrix, ring := splitting_field );
    
end );

#! @Description
#!  The arguments are a category <A>C</A> $\coloneqq \bigoplus_{i=1}^n \mathrm{Rows}_R$,
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
DeclareOperation( "DecomposeProductOfCharacters", [ IsSkeletalCategoryOfGroupRepresentations, IsBigInt, IsBigInt ] );

CapJitAddTypeSignature( "DecomposeProductOfCharacters",
                        [ IsSkeletalCategoryOfGroupRepresentations, IsList, IsBigInt, IsBigInt ],
                        
  function ( input_types )
    
    Assert( 0, input_types[2].element_type.filter = IsIrreducibleCharacter );
    
    return CapJitDataTypeOfNTupleOf( 3,
                IsBigInt,
                CapJitDataTypeOfListOf( IsBigInt ),
                CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( input_types[1].category ) ) );
    
end );

# TODO: make this function global and anonymous for the compiler? Then remove remaining type signatures.
#! @Description
#! The argument is an irreducible object $a$ in $\bigoplus_{i=1}^n \mathrm{Rows}_R$.
#! The output is the decomposition of the second exterior power $\wedge^2 a$ into irreducibles.
#! @Returns object
#! @Arguments a, b
DeclareOperation( "SecondExteriorPowerOfSimpleObject", [ IsSkeletalCategoryOfGroupRepresentations,
                                                         IsObjectInSkeletalCategoryOfGroupRepresentations ] );

CapJitAddTypeSignature( "SecondExteriorPowerOfSimpleObject", [ IsSkeletalCategoryOfGroupRepresentations,
                                                               IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                                               
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[2].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( input_types[1].category );
    
end );

####################################
##
#! @Section Functors
##
####################################

#! @Description
#!  TODO
#! @Returns TODO
#! @Arguments TODO
DeclareOperation( "FunctorProdPWPIntoSGRepsOnObject",
                  [ IsSkeletalCategoryOfGroupRepresentations,
                    IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ] );

#! @Description
#!  TODO
#! @Returns TODO
#! @Arguments TODO
DeclareOperation( "FunctorProdPWPIntoSGRepsOnMorphism",
                  [ IsSkeletalCategoryOfGroupRepresentations,
                    IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ] );

#! @Description
#!  TODO
#! @Returns TODO
#! @Arguments TODO
DeclareOperation( "FunctorSGRepsIntoProdPWPOnObject",
                  [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
                    IsObjectInSkeletalCategoryOfGroupRepresentations ] );

#! @Description
#!  TODO
#! @Returns TODO
#! @Arguments TODO
DeclareOperation( "FunctorSGRepsIntoProdPWPOnMorphism",
                  [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
                    IsMorphismInSkeletalCategoryOfGroupRepresentations ] );

####################################
##
#! @Section Global functions
##
####################################

#! @Description
#!  TODO
DeclareGlobalFunction( "INSTALL_FUNCTIONS_FOR_SKELETAL_CATEGORY_OF_GROUP_REPRESENTATIONS" );

CapJitAddTypeSignature( "IsOne", [ IsIrreducibleCharacter ], IsBool );

CapJitAddTypeSignature( "ComplexConjugate", [ IsIrreducibleCharacter ], IsIrreducibleCharacter );

CapJitAddTypeSignature( "AntiSymmetricParts", [ IsCharacterTable, IsList, IsBigInt ],
  function ( input_types )
    
    Assert( 0, input_types[2].element_type.filter = IsIrreducibleCharacter );
    
    return CapJitDataTypeOfListOf( IsVirtualCharacter );
    
end );

## Compilation helper functions

#! @Description
#!  TODO
DeclareGlobalFunction( "SGREPS_ScalarProduct" );

CapJitAddTypeSignature( "SGREPS_ScalarProduct", [ IsList, IsBigInt, IsBigInt, IsBigInt ],
  function ( input_types )
    
    Assert( 0, input_types[1].element_type.filter = IsIrreducibleCharacter );
    
    return rec( filter := IsBigInt );
    
end );

#! @Description
#!  TODO
DeclareGlobalFunction( "SGREPS_IndexOfTrivialCharacter" );

CapJitAddTypeSignature( "SGREPS_IndexOfTrivialCharacter", [ IsList ],
  function ( input_types )
    
    Assert( 0, input_types[1].element_type.filter = IsIrreducibleCharacter );
    
    return rec( filter := IsBigInt );
    
end );

#! @Description
#!  TODO
DeclareGlobalFunction( "SGREPS_IndexOfDualOfIrreducibleCharacter" );

CapJitAddTypeSignature( "SGREPS_IndexOfDualOfIrreducibleCharacter", [ IsSkeletalCategoryOfGroupRepresentations, IsBigInt ], IsBigInt );

#! @Description
#!  TODO
DeclareGlobalFunction( "SGREPS_DualObjectDatum" );

CapJitAddTypeSignature( "SGREPS_DualObjectDatum", [ IsSkeletalCategoryOfGroupRepresentations, IsBigInt, IsList, IsList ],
  function( input_types )
    
    Assert( 0, input_types[3].element_type.filter = IsBigInt );
    Assert( 0, input_types[4].element_type.filter = IsBigInt );
    
    return CapJitDataTypeOfNTupleOf( 3,
                IsBigInt,
                CapJitDataTypeOfListOf( IsBigInt ),
                CapJitDataTypeOfListOf( IsBigInt ) );
                
    
end );

#! @Description
#!  TODO
DeclareGlobalFunction( "SGREPS_DualMorphismDatum" );

CapJitAddTypeSignature( "SGREPS_DualMorphismDatum", [ IsSkeletalCategoryOfGroupRepresentations, IsBigInt, IsList, IsList ],
  function( input_types )
    local splitting_field;
    
    Assert( 0, input_types[3].element_type.filter = IsBigInt );
    Assert( 0, input_types[4].element_type.filter = IsHomalgMatrix );
    
    splitting_field := UnderlyingSplittingField( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 3,
                IsBigInt,
                CapJitDataTypeOfListOf( IsBigInt ),
                CapJitDataTypeOfListOf( rec( filter := IsHomalgMatrix, ring := splitting_field ) ) );
                
    
end );

