# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Implementations
#

InstallTrueMethod( IsMonoidalCategory, IsStrictMonoidalCategory );

##
AddDerivationToCAP( TensorUnit,
                    "TensorProductOnObjects from TensorProductOnListOfObjects",
                    [ [ TensorProductOnListOfObjects, 1 ] ],
                    
  function( cat )
    
    return TensorProductOnListOfObjects( cat, CapJitTypedExpression( [ ], cat -> CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( cat ) ) ) );
    
end : CategoryFilter := IsMonoidalCategory );

##
AddDerivationToCAP( TensorProductOnObjects,
                    "TensorProductOnObjects from TensorProductOnListOfObjects",
                    [ [ TensorProductOnListOfObjects, 1 ] ],
                    
  function( cat, object_1, object_2 )
    
    return TensorProductOnListOfObjects( cat, [ object_1, object_2 ] );
    
end : CategoryFilter := IsMonoidalCategory );

##
AddDerivationToCAP( TensorProductOnMorphisms,
                    "TensorProductOnMorphisms from TensorProductOnListOfMorphisms",
                    [ [ TensorProductOnListOfMorphisms, 1 ] ],
                    
  function( cat, morphism_1, morphism_2 )
    
    return TensorProductOnListOfMorphisms( cat, [ morphism_1, morphism_2 ] );
    
end : CategoryFilter := IsMonoidalCategory );

##
AddDerivationToCAP( TensorProductOnMorphismsWithGivenTensorProducts,
                    "TensorProductOnMorphismsWithGivenTensorProducts from TensorProductOnListOfMorphismsWithGivenTensorProducts",
                    [ [ TensorProductOnListOfMorphismsWithGivenTensorProducts, 1 ] ],
                    
  function( cat, source, morphism_1, morphism_2, range )
    
    return TensorProductOnListOfMorphismsWithGivenTensorProducts( cat, source, [ morphism_1, morphism_2 ], range );
    
end : CategoryFilter := IsMonoidalCategory );
