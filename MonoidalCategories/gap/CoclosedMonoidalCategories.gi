InstallValue( CAP_INTERNAL_COCLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS, rec( ) );

##
CAP_INTERNAL_COCLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.InternalCoHomOnMorphisms := 
  [ [ "InternalCoHomOnMorphismsWithGivenInternalCoHoms", 1 ],
    [ "InternalCoHomOnObjects", 2 ] ];
##
InstallMethod( InternalCoHomOnMorphisms,
               [ IsCapCategoryMorphism, IsCapCategoryMorphism ],
               
  function( morphism_1, morphism_2 )
    
    return InternalCoHomOnMorphismsWithGivenInternalCoHoms( 
             InternalCoHomOnObjects( Source( morphism_1 ), Range( morphism_2 ) ),
             morphism_1, morphism_2,
             InternalCoHomOnObjects( Range( morphism_1 ), Source( morphism_2 ) )
           );
    
end );

CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD( CAP_INTERNAL_COCLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS );
