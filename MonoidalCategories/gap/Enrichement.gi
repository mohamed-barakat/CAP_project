##
InstallValue( CAP_INTERNAL_MONOIDAL_CATEGORIES_ENRICHING_OPERATIONS, rec( ) );

##
CAP_INTERNAL_MONOIDAL_CATEGORIES_ENRICHING_OPERATIONS.PreCompositionOfHomomorphismStructure :=
  [ [ "PreCompositionOfHomomorphismStructureWithGivenObjects", 1 ],
    [ "TensorProductOnObjects", 1 ],
    [ "HomomorphismStructureOnObjects", 3 ] ];
##
InstallMethod( PreCompositionOfHomomorphismStructure,
               [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ],
               
  function( object_1, object_2, object_3 )
    
    return PreCompositionOfHomomorphismStructureWithGivenObjects(
             TensorProductOnObjects( HomomorphismStructureOnObjects( object_1, object_2 ), HomomorphismStructureOnObjects( object_2, object_3 ) ),
             object_1, object_2, object_3,
             HomomorphismStructureOnObjects( object_1, object_3 )
           );
    
end );

CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD( CAP_INTERNAL_MONOIDAL_CATEGORIES_ENRICHING_OPERATIONS );
