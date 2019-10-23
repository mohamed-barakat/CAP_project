InstallValue( ENRICHING_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD, rec(

## Basic Operations for Monoidal Categories
PreCompositionOfHomomorphismStructureWithGivenObjects := rec(
  installation_name := "PreCompositionOfHomomorphismStructure",
  filter_list := [ "other_object", "object", "object", "object", "other_object" ],
  return_type := "other_morphism",
  ## TODO: add support for dual_*
),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( ENRICHING_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( ENRICHING_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD );
