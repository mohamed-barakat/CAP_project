# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Declarations
#

DeclareGlobalFunction( "SGREPS_Associator_1_Morphism" );

DeclareGlobalFunction( "SGREPS_Associator_2_Morphism" );

DeclareGlobalFunction( "SGREPS_Associator_3_Morphism" );

DeclareGlobalFunction( "SGREPS_Associator_4_Morphism" );

CapJitAddTypeSignature( "SGREPS_Associator_4_Morphism",
                        [ IsSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

DeclareGlobalFunction( "SGREPS_Associator_5_Morphism" );

DeclareGlobalFunction( "SGREPS_Associator_6_Morphism" );

DeclareGlobalFunction( "SGREPS_Associator_7_Morphism" );

DeclareGlobalFunction( "SGREPS_Associator_123_Morphism" );

CapJitAddTypeSignature( "SGREPS_Associator_123_Morphism",
                        [ IsSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

DeclareGlobalFunction( "SGREPS_Associator_567_Morphism" );

CapJitAddTypeSignature( "SGREPS_Associator_567_Morphism",
                        [ IsSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );
