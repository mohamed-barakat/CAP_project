#! @Chapter Examples and tests

#! @Section Tests

#! @Example

#! #@if String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "LinearClosuresForCAP", false );
#! true

homalg_field := DummyHomalgField( );;
# commutative_homalg_ring := DummyCommutativeHomalgRing( );;
# homalg_ring := DummyHomalgRing( );;
# QQ := HomalgFieldOfRationalsInSingular( );;
# QQxy := QQ * "x,y";;
# EQQxy := KoszulDualRing( QQxy );;

DummyHomalgFieldElementFilter := RingElementFilter( homalg_field );;

CapJitAddTypeSignature( "Union", [ IsList ], function ( input_types )
    
    Assert( 0,
        input_types[1].element_type.filter = IsList and
        input_types[1].element_type.element_type.filter = IsBigInt );
        
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

precompile_DirectSumOfCategoryOfRows := function( homalg_ring, name )
    
    CapJitPrecompileCategoryAndCompareResult(
        homalg_ring ->
            DirectSumOfAdditiveCategory(
                5, CategoryOfRows( homalg_ring : FinalizeCategory := true ) ),
        [ homalg_ring ],
        "AdditiveClosuresForCAP",
        Concatenation( "DirectSumOfAdditiveCategory_Rows_", name )
        : operations := [ "IsEqualForObjects",
                          "IsEqualForMorphisms",
                          "IsCongruentForMorphisms",
                          "IsWellDefinedForObjects",
                          "IsWellDefinedForMorphisms",
                          "ObjectConstructor",
                          "MorphismConstructor",
                          "ObjectDatum",
                          "MorphismDatum",
                          "IdentityMorphism",
                          "PreCompose",
                          "ZeroMorphism",
                          "IsZeroForMorphisms",
                          "AdditionForMorphisms",
                          # "SumOfMorphisms", # ✗
                          "AdditiveInverseForMorphisms",
                          "SubtractionForMorphisms",
                          "ZeroObject",
                          "DirectSum",
                          "DirectSumFunctorialWithGivenDirectSums",
                          "ProjectionInFactorOfDirectSumWithGivenDirectSum",
                          "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
                          "UniversalMorphismIntoDirectSumWithGivenDirectSum",
                          "UniversalMorphismFromDirectSumWithGivenDirectSum",
                          "MultiplyWithElementOfCommutativeRingForMorphisms",
                          "KernelObject",
                          "KernelEmbeddingWithGivenKernelObject",
                          "Lift",
                          "CokernelObject",
                          "CokernelProjectionWithGivenCokernelObject",
                          "Colift",
                          ],
          # : operations := "",
          number_of_objectified_objects_in_data_structure_of_object := 2,
          number_of_objectified_morphisms_in_data_structure_of_object := 0,
          number_of_objectified_objects_in_data_structure_of_morphism := 2,
          number_of_objectified_morphisms_in_data_structure_of_morphism := 2 );
          
end;;

# CapJitEnableStepByStepCompilation();

# CapJitSetDebugLevel( 1 );

precompile_DirectSumOfCategoryOfRows( homalg_field, "Field" );;
# precompile_CategoryOfRows( commutative_homalg_ring, "CommutativeRing" );;
# precompile_CategoryOfRows( EQQxy, "HomalgExteriorRingOverField" );;
# precompile_CategoryOfRows( homalg_ring, "ArbitraryRing" );;

# DirectSumOfAdditiveCategory( 5, CategoryOfRows( homalg_field ) )!.precompiled_functions_added;
# true

#! #@fi

#! @EndExample
