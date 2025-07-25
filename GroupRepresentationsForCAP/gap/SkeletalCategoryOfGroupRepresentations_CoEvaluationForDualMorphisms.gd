# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Declarations
#

DeclareGlobalFunction( "SGREPS_CoevaluationForDual_1_Morphism" );

CapJitAddTypeSignature( "SGREPS_CoevaluationForDual_1_Morphism",
                        [ IsSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations ],
                          
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[2].category ) );
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[3].category ) );
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[4].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

DeclareGlobalFunction( "SGREPS_CoevaluationForDual_2_Morphism" );
DeclareGlobalFunction( "SGREPS_CoevaluationForDual_3_Morphism" );
DeclareGlobalFunction( "SGREPS_CoevaluationForDual_23_Morphism" );

DeclareGlobalFunction( "SGREPS_EvaluationForDual_1_Morphism" );
DeclareGlobalFunction( "SGREPS_EvaluationForDual_2_Morphism" );
DeclareGlobalFunction( "SGREPS_EvaluationForDual_3_Morphism" );

CapJitAddTypeSignature( "SGREPS_EvaluationForDual_3_Morphism",
                        [ IsSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations,
                          IsObjectInSkeletalCategoryOfGroupRepresentations ],
                          
  function ( input_types )
    
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[2].category ) );
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[3].category ) );
    Assert( 0, IsSkeletalCategoryOfGroupRepresentations( input_types[4].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

DeclareGlobalFunction( "SGREPS_EvaluationForDual_12_Morphism" );

