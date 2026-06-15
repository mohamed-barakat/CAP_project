# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Implementations
#

##
AddDerivationToCAP( AssociatorLeftToRightWithGivenTensorProducts,
                    "AssociatorLeftToRightWithGivenTensorProducts as the identity morphism",
                    [ [ IdentityMorphism, 1 ] ],
                    
  function( cat, left_associated_object, object_1, object_2, object_3, right_associated_object )
    
    return IdentityMorphism( cat, left_associated_object );
    
end : CategoryFilter := IsStrictMonoidalCategory );

##
AddDerivationToCAP( AssociatorRightToLeftWithGivenTensorProducts,
                    "AssociatorRightToLeft as the identity morphism",
                    [ [ IdentityMorphism, 1 ] ],
                    
  function( cat, right_associated_object, object_1, object_2, object_3, left_associated_object )
    
    return IdentityMorphism( cat, right_associated_object );
    
end : CategoryFilter := IsStrictMonoidalCategory );

##
AddDerivationToCAP( LeftUnitorWithGivenTensorProduct,
                    "LeftUnitorWithGivenTensorProduct as the identity morphism",
                    [ [ IdentityMorphism, 1 ] ],
                    
  function( cat, object, unit_tensored_object )
    
    return IdentityMorphism( cat, object );
      
end : CategoryFilter := IsStrictMonoidalCategory );

##
AddDerivationToCAP( LeftUnitorInverseWithGivenTensorProduct,
                    "LeftUnitorInverseWithGivenTensorProduct as the identity morphism",
                    [ [ IdentityMorphism, 1 ] ],
                    
  function( cat, object, unit_tensored_object )
    
    return IdentityMorphism( cat, object );
    
end : CategoryFilter := IsStrictMonoidalCategory );

##
AddDerivationToCAP( RightUnitorWithGivenTensorProduct,
                    "RightUnitorWithGivenTensorProduct as the identity morphism",
                    [ [ IdentityMorphism, 1 ] ],
                    
  function( cat, object, object_tensored_unit )
    
    return IdentityMorphism( cat, object );
    
end : CategoryFilter := IsStrictMonoidalCategory );

##
AddDerivationToCAP( RightUnitorInverseWithGivenTensorProduct,
                    "RightUnitorInverseWithGivenTensorProduct as the identity morphism",
                    [ [ IdentityMorphism, 1 ] ],
                    
  function( cat, object, object_tensored_unit )
    
    return IdentityMorphism( cat, object );
    
end : CategoryFilter := IsStrictMonoidalCategory );
