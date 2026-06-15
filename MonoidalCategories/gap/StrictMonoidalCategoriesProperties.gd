# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Declarations
#

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsStrictMonoidalCategory  :=
  Concatenation(
          ListOfDefiningOperations( "IsCapCategory" ),
          [ "TensorProductOnListOfObjects",
            "TensorProductOnListOfMorphisms",
            ] );

#! @Description
#!  The property of the category <A>C</A> being strict monoidal.
#! @Arguments C
DeclareProperty( "IsStrictMonoidalCategory", IsCapCategory );

AddCategoricalProperty( [ "IsStrictMonoidalCategory", "IsStrictMonoidalCategory" ] );
