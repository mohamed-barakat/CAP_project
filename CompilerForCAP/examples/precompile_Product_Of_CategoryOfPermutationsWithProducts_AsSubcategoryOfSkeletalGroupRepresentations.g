#! @Chapter Examples and tests

#! @Section Tests

#! @Example

#! #@if String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "GroupRepresentationsForCAP", false );
#! true

CapJitAddTypeSignature( "Union", [ IsList ], function ( input_types )
    
    Assert( 0,
        input_types[1].element_type.filter = IsList and
        input_types[1].element_type.element_type.filter = IsBigInt );
        
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );


CapJitAddTypeSignature( "+", [ IsList, IsBigInt ],
  
  function ( input_types )
    
    Assert( 0,
        input_types[1].element_type.filter = IsNTuple and
        Length( input_types[1].element_type.element_types ) = 2 and
        input_types[1].element_type.element_types[1].filter = IsBigInt and
        input_types[1].element_type.element_types[2].filter = IsBigInt );
        
    return CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) );
    
end );

CapJitAddTypeSignature( "+", [ IsNTuple, IsBigInt ],
  
  function ( input_types )
    
    Assert( 0,
        Length( input_types[1].element_types ) = 2 and
        input_types[1].element_types[1].filter = IsBigInt and
        input_types[1].element_types[2].filter = IsBigInt );
        
    return CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) );
    
end );

precompile_ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations := function( irreducible_characters, name )
    
    CapJitPrecompileCategoryAndCompareResult(
        { irreducible_characters } ->
            ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( irreducible_characters : no_precompiled_code := true ),
        [ irreducible_characters ],
        "GroupRepresentationsForCAP",
        Concatenation( "Product_Of_CategoryOfPermutationsWithProducts_AsSubcategoryOfSkeletalGroupRepresentations_", name, "_precompiled" )
        : operations := [ "IsEqualForObjects",
                          "IsEqualForMorphisms",
                          # "SimplifyEndo",
                          # "IsCongruentForMorphisms",
                          "IsWellDefinedForObjects",
                          "IsWellDefinedForMorphisms",
                          "ObjectConstructor",
                          "MorphismConstructor",
                          "ObjectDatum",
                          "MorphismDatum",
                          "IdentityMorphism",
                          # "PreCompose",
                          "TerminalObject",
                          "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
                          "DirectProduct", # x
                          "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
                          "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
                          "DirectProductFunctorialWithGivenDirectProducts",
                          "TensorProductOnObjects",
                          "TensorProductOnMorphismsWithGivenTensorProducts",
                          "RightDistributivityExpandingWithGivenObjects",
                          ],
          # : operations := "",
          number_of_objectified_objects_in_data_structure_of_object := 1,
          number_of_objectified_morphisms_in_data_structure_of_object := 0,
          number_of_objectified_objects_in_data_structure_of_morphism := 2,
          number_of_objectified_morphisms_in_data_structure_of_morphism := 1 );
          
end;;

# CapJitEnableStepByStepCompilation();

# CapJitSetDebugLevel( 1 );

character_table_S4 := CharacterTable( SymmetricGroup( 4 ) );
irreducible_characters_S4 := Irr( character_table_S4 );

precompile_ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( irreducible_characters_S4, "S4" );;

ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations( irreducible_characters_S4 )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
