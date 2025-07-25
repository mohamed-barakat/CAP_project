# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Declarations
#

#
# No morphisms 0 -> 1,2,3,...
# 
# Only 1,2,3,... -> 0
#


####################################
##
#! @Section GAP Categories
##
####################################

#! @Description
#!  TODO
#! @Arguments TODO
#! @Returns TODO
DeclareCategory( "IsCategoryOfPermuationsWithProducts",
                 IsCapCategory );

#! @Description
#!  TODO
#! @Arguments TODO
#! @Returns TODO
DeclareCategory( "IsObjectInCategoryOfPermuationsWithProducts",
                 IsCapCategoryObject );

#! @Description
#!  TODO
#! @Arguments TODO
#! @Returns TODO
DeclareCategory( "IsMorphismInCategoryOfPermuationsWithProducts",
                 IsCapCategoryMorphism );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#!  TODO
#! @Arguments TODO
#! @Returns TODO
DeclareGlobalFunction( "CategoryOfPermuationsWithProducts" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  TODO
#! @Arguments TODO
#! @Returns TODO
DeclareAttribute( "NumberElements", IsObjectInCategoryOfPermuationsWithProducts );

CapJitAddTypeSignature( "NumberElements", [ IsObjectInCategoryOfPermuationsWithProducts ], IsBigInt );

#! @Description
#!  TODO
#! @Arguments TODO
#! @Returns TODO
DeclareAttribute( "ListOfColumns", IsMorphismInCategoryOfPermuationsWithProducts );

CapJitAddTypeSignature( "ListOfColumns", [ IsMorphismInCategoryOfPermuationsWithProducts ],
                                            
  function ( input_types )
    
    Assert( 0, IsCategoryOfPermuationsWithProducts( input_types[1].category ) );
    
    return CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) );
    
end );

#######################################
##
#! @Section Functors
##
#######################################

##
DeclareOperation( "FunctorPWPToCategoryOfRows",
                  [ IsCapCategory, IsCapCategory ] );

