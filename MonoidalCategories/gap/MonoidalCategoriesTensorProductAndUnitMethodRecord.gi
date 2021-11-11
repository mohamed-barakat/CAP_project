InstallValue( MONOIDAL_CATEGORIES_BASIC_METHOD_NAME_RECORD, rec(

TensorProductOnObjects := rec(
  filter_list := [ "category", "object", "object" ],
  cache_name := "TensorProductOnObjects",
  return_type := "object",
  dual_operation := "TensorProductOnObjects",
),

TensorUnit := rec(
  filter_list := [ "category" ],
  cache_name := "TensorUnit",
  return_type := "object",
  dual_operation := "TensorUnit",
),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( MONOIDAL_CATEGORIES_BASIC_METHOD_NAME_RECORD );

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( MONOIDAL_CATEGORIES_BASIC_METHOD_NAME_RECORD, "MonoidalCategories" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( MONOIDAL_CATEGORIES_BASIC_METHOD_NAME_RECORD );
