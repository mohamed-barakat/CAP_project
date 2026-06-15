# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Declarations
#

####################################
##
#! @Chapter Monoidal Categories
##
#! @Section Strict Monoidal Categories
##
####################################

DeclareGlobalVariable( "STRICT_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD" );

#! @Description
#! 
#! @Returns a morphism
#! @Arguments list_of_objs
DeclareOperation( "TensorProductOnListOfObjects",
                  [ IsList ] );

#! @Description
#! 
#! @Returns a morphism
#! @Arguments list_of_mors
DeclareOperation( "TensorProductOnListOfMorphisms",
                  [ IsList ] );

#! @Description
#! 
#! @Returns a morphism
#! @Arguments s, list_of_mors, r
DeclareOperation( "TensorProductOnListOfMorphismsWithGivenTensorProducts",
                  [ IsCapCategoryObject, IsList, IsCapCategoryObject ] );
