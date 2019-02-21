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

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.CoEvaluationMorphism :=
  [ [ "CoEvaluationMorphismWithGivenRange", 1 ],
    [ "TensorProductOnObjects", 1 ],
    [ "InternalCoHomOnObjects", 1 ] ];
##
InstallMethod( CoEvaluationMorphism,
               [ IsCapCategoryObject, IsCapCategoryObject ],

  function( object_1, object_2 )

    return CoEvaluationMorphismWithGivenRange(
             object_1, object_2,
             TensorProductOnObjects( object_2, InternalCoHomOnObjects( object_1, object_2 ) )
           );

end );

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.DualCoEvaluationMorphism :=
  [ [ "DualCoEvaluationMorphismWithGivenSource", 1 ],
    [ "TensorProductOnObjects", 1 ],
    [ "InternalCoHomOnObjects", 1 ] ];
##
InstallMethod( DualCoEvaluationMorphism,
               [ IsCapCategoryObject, IsCapCategoryObject ],

  function( object_1, object_2 )

    return DualCoEvaluationMorphismWithGivenSource(
             object_1, object_2,
             InternalCoHomOnObjects( TensorProductOnObjects( object_1, object_2 ), object_1 )
           );

end );

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.MonoidalPreCoComposeMorphism :=
  [ [ "MonoidalPreCoComposeMorphismWithGivenObjects", 1 ],
    [ "TensorProductOnObjects", 1 ],
    [ "InternalCoHomOnObjects", 3 ] ];
##
InstallMethod( MonoidalPreCoComposeMorphism,
               [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ],

  function( object_1, object_2, object_3 )

    return MonoidalPreCoComposeMorphismWithGivenObjects(
             InternalCoHomOnObjects( object_1, object_3 ),
             object_1, object_2, object_3,
             TensorProductOnObjects( InternalCoHomOnObjects( object_1, object_2 ), InternalCoHomOnObjects( object_2, object_3 ) )
           );

end );

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.MonoidalPostCoComposeMorphism :=
  [ [ "MonoidalPostCoComposeMorphismWithGivenObjects", 1 ],
    [ "TensorProductOnObjects", 1 ],
    [ "InternalCoHomOnObjects", 3 ] ];
##
InstallMethod( MonoidalPostCoComposeMorphism,
               [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ],

  function( object_1, object_2, object_3 )

    return MonoidalPostCoComposeMorphismWithGivenObjects(
             InternalCoHomOnObjects( object_1, object_3 ),
             object_1, object_2, object_3,
             TensorProductOnObjects( InternalCoHomOnObjects( object_2, object_3 ), InternalCoHomOnObjects( object_1, object_2 ) )
           );

end );

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.CoDualOnMorphisms :=
  [ [ "CoDualOnMorphismsWithGivenCoDuals", 1 ],
    [ "CoDualOnObjects", 2 ] ];
##
InstallMethod( CoDualOnMorphisms,
               [ IsCapCategoryMorphism ],

  function( morphism )

    return CoDualOnMorphismsWithGivenCoDuals(
             CoDualOnObjects( Range( morphism ) ),
             morphism,
             CoDualOnObjects( Source( morphism ) )
           );

end );

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.CoEvaluationForCoDual :=
  [ [ "CoEvaluationForCoDualWithGivenTensorProduct", 1 ],
    [ "TensorProductOnObjects", 1 ],
    [ "CoDualOnObjects", 1 ],
    [ "TensorUnit", 1 ] ];
##
InstallMethod( CoEvaluationForCoDual,
               [ IsCapCategoryObject ],

  function( object )
    local category;

    category := CapCategory( object );

    return CoEvaluationForCoDualWithGivenTensorProduct(
             TensorUnit( category ),
             object,
             TensorProductOnObjects( object, CoDualOnObjects( object ) )
           );

end );

##
CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.MorphismToCoBidual :=
  [ [ "MorphismToCoBidualWithGivenCoBidual", 1 ],
    [ "CoDualOnObjects", 2 ] ];
##
InstallMethod( MorphismToCoBidual,
               [ IsCapCategoryObject ],

  function( object )

    return MorphismToCoBidualWithGivenCoBidual( object, CoDualOnObjects( CoDualOnObjects( object ) ) );

end );

# ##
# CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.TensorProductInternalHomCompatibilityMorphism :=
#   [ [ "TensorProductInternalHomCompatibilityMorphismWithGivenObjects", 1 ],
#     [ "TensorProductOnObjects", 3 ],
#     [ "InternalHomOnObjects", 3 ] ];
# ##
# InstallMethod( TensorProductInternalHomCompatibilityMorphism,
#                [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ],
#
#   function( object_1_1, object_1_2, object_2_1, object_2_2 )
#
#     return TensorProductInternalHomCompatibilityMorphismWithGivenObjects(
#              object_1_1, object_1_2, object_2_1, object_2_2,
#              [ TensorProductOnObjects( InternalHomOnObjects( object_1_1, object_1_2 ), InternalHomOnObjects( object_2_1, object_2_2 ) ),
#                InternalHomOnObjects( TensorProductOnObjects( object_1_1, object_2_1 ), TensorProductOnObjects( object_1_2, object_2_2 ) ) ]
#            );
#
# end );
#
# ##
# CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.TensorProductDualityCompatibilityMorphism :=
#   [ [ "TensorProductDualityCompatibilityMorphismWithGivenObjects", 1 ],
#     [ "DualOnObjects", 3 ],
#     [ "TensorProductOnObjects", 2 ] ];
# ##
# InstallMethod( TensorProductDualityCompatibilityMorphism,
#                [ IsCapCategoryObject, IsCapCategoryObject ],
#
#   function( object_1, object_2 )
#
#     return TensorProductDualityCompatibilityMorphismWithGivenObjects(
#              DualOnObjects( TensorProductOnObjects( object_1, object_2 ) ),
#              object_1, object_2,
#              TensorProductOnObjects( DualOnObjects( object_1 ), DualOnObjects( object_2 ) )
#            );
#
# end );
#
# ##
# CAP_INTERNAL_CLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS.MorphismFromTensorProductToInternalHom :=
#   [ [ "MorphismFromTensorProductToInternalHomWithGivenObjects", 1 ],
#     [ "DualOnObjects", 1 ],
#     [ "TensorProductOnObjects", 1 ],
#     [ "InternalHomOnObjects", 1 ] ];
# ##
# InstallMethod( MorphismFromTensorProductToInternalHom,
#                [ IsCapCategoryObject, IsCapCategoryObject ],
#
#   function( object_1, object_2 )
#
#     return MorphismFromTensorProductToInternalHomWithGivenObjects(
#              TensorProductOnObjects( DualOnObjects( object_1 ), object_2 ),
#              object_1, object_2,
#              InternalHomOnObjects( object_1, object_2 )
#            );
#
# end );



CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD( CAP_INTERNAL_COCLOSED_MONOIDAL_CATEGORIES_BASIC_OPERATIONS );
