#! @Chapter Examples and tests

#! @Section Tests

#! @Example

#! #@if String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "GroupRepresentationsForCAP", false );
#! true

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

precompile_CategoryOfPermutationsWithProducts := function( )
    
    CapJitPrecompileCategoryAndCompareResult(
        CategoryOfPermuationsWithProducts,
        [ ],
        "GroupRepresentationsForCAP",
        "CategoryOfPermutationsWithProducts_precompiled"
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
                          "DirectProduct",
                          "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
                          "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
                          "DirectProductFunctorialWithGivenDirectProducts",
                          "TensorUnit",
                          "LeftUnitorWithGivenTensorProduct",
                          "RightUnitorWithGivenTensorProduct",
                          "TensorProductOnObjects",
                          "TensorProductOnMorphismsWithGivenTensorProducts",
                          ],
          # : operations := "",
          number_of_objectified_objects_in_data_structure_of_object := 1,
          number_of_objectified_morphisms_in_data_structure_of_object := 0,
          number_of_objectified_objects_in_data_structure_of_morphism := 1,
          number_of_objectified_morphisms_in_data_structure_of_morphism := 1 );
          
end;;

# CapJitEnableStepByStepCompilation();

# CapJitSetDebugLevel( 1 );

precompile_CategoryOfPermutationsWithProducts( );;

# CategoryOfPermutationsWithProducts( )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
