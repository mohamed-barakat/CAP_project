# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Declarations
#

DeclareGlobalFunction( "SGREPS_PreComposeMorphismPermutationsWithSameSupport" );

# A precomposition of only 3 morphisms (instead of a list) might be enough.
# DeclareGlobalFunction( "SGREPS_PreComposeThreeMorphismPermutationsWithSameSupport" );
DeclareGlobalFunction( "SGREPS_PreComposeListOfMorphismPermutationsWithSameSupport" );

DeclareGlobalFunction( "SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices" );

DeclareGlobalFunction( "SGREPS_FunctorFromInverseMorphismPermutationsToMorphismMatrices" );

DeclareGlobalFunction( "SGREPS_RightDistributivityExpandingPermutation" );

DeclareGlobalFunction( "SGREPS_LeftDistributivityExpandingPermutation" );

DeclareGlobalFunction( "SGREPS_RightDistributivityFactoringPermutation" );

DeclareGlobalFunction( "SGREPS_LeftDistributivityFactoringPermutation" );

DeclareGlobalFunction( "SGREPS_KroneckerProductOfPermutationWithIdentityFromRight" );

DeclareGlobalFunction( "SGREPS_KroneckerProductOfPermutationWithIdentityFromLeft" );

DeclareGlobalFunction( "SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromRight" );

DeclareGlobalFunction( "SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromLeft" );

DeclareGlobalFunction( "SGREPS_DirectSumFunctorialForListOfMorphismPermutations" );

CapJitAddTypeSignature( "*", [ IsPerm, IsPerm ], IsPerm );

CapJitAddTypeSignature( "ListPerm", [ IsPerm, IsBigInt ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );
