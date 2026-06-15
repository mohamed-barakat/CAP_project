# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Implementations
#

InstallValue( STRICT_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD, rec(

## Basic Operations for Strict Monoidal Categories

TensorProductOnListOfObjects := rec(
  filter_list := [ "category", "list_of_objects" ],
  return_type := "object",
  dual_operation := "TensorProductOnListOfObjects",
  dual_arguments_reversed := false,
  # Test in StrictMonoidalCategoriesTest
),

TensorProductOnListOfMorphisms := rec(
  filter_list := [ "category", "list_of_morphisms" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "list_of_mors" ],
  output_source_getter_string := "TensorProductOnListOfObjects( cat, List( list_of_mors, Source ) )",
  output_source_getter_preconditions := [ [ "TensorProductOnListOfObjects", 1 ] ],
  output_range_getter_string := "TensorProductOnListOfObjects( cat, List( list_of_mors, Range ) )",
  output_range_getter_preconditions := [ [ "TensorProductOnListOfObjects", 1 ] ],
  with_given_object_position := "both",
  dual_operation := "TensorProductOnListOfMorphisms",
  dual_arguments_reversed := false,
  compatible_with_congruence_of_morphisms := true,
  # Test in StrictMonoidalCategoriesTest
),

TensorProductOnListOfMorphismsWithGivenTensorProducts := rec(
  filter_list := [ "category", "object", "list_of_morphisms", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "s", "list_of_mors", "r" ],
  output_source_getter_string := "s",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "r",
  output_range_getter_preconditions := [ ],
  dual_operation := "TensorProductOnListOfMorphismsWithGivenTensorProducts",
  dual_with_given_objects_reversed := true,
  compatible_with_congruence_of_morphisms := true,
),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( STRICT_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DECLARATIONS_AND_INSTALLATIONS_FROM_METHOD_NAME_RECORD(
    STRICT_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD,
    "MonoidalCategories",
    "StrictMonoidalCategoriesMethodRecord",
    "Monoidal Categories",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( STRICT_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD, "MonoidalCategories" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( STRICT_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD );
