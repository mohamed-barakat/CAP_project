#! @Chapter Examples and tests

#! @Section Tests

#! @Example

#! #@if String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "GroupRepresentationsForCAP", false );
#! true

# ReadPackage( "GroupRepresentationsForCAP",
#     "gap/SkeletalCategoryOfGroupRepresentations_CompilerLogic.gi" );
#! true

CapJitAddTypeSignature( "Union", [ IsList ], function ( input_types )
    
    return CapJitDataTypeOfListOf( IsBigInt );
    
end );

QQ := HomalgFieldOfRationalsInSingular( );;

precompile_SkeletalCategoryOfGroupRepresentations := function( group, homalg_field, name )
    
    CapJitPrecompileCategoryAndCompareResult(
        { group, homalg_field } ->
            SkeletalCategoryOfGroupRepresentations( group, homalg_field ),
        [ group, homalg_field ],
        "GroupRepresentationsForCAP",
        Concatenation(
            "SkeletalCategoryOfGroupRepresentations_",
            name
        ) :
        # operations := "primitive",
        # operations := [ "TensorUnit" ],
        operations := [ # "IsEqualForObjects",
                        # "IsEqualForMorphisms",
                        # "IsCongruentForMorphisms",
                        # "IsWellDefinedForObjects",
                        # "IsWellDefinedForMorphisms",
                        # "ObjectConstructor",
                        # "MorphismConstructor",
                        # "ObjectDatum",
                        # "MorphismDatum",
                        # "IdentityMorphism",
                        # "PreCompose",
                        # "ZeroMorphism",
                        # "IsZeroForMorphisms",
                        # "AdditionForMorphisms",
                        # "SumOfMorphisms",
                        # "AdditiveInverseForMorphisms",
                        # "SubtractionForMorphisms",
                        # "ZeroObject",
                        # "MultiplyWithElementOfCommutativeRingForMorphisms",
                        # "DirectSum",
                        # "DirectSumFunctorial",
                        # "DirectSumFunctorialWithGivenDirectSums",
                        # "ProjectionInFactorOfDirectSumWithGivenDirectSum",
                        # "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
                        # "UniversalMorphismIntoDirectSumWithGivenDirectSum",
                        # "UniversalMorphismFromDirectSumWithGivenDirectSum",
                        # "KernelObject",
                        # "KernelEmbeddingWithGivenKernelObject",
                        # "Lift",
                        # "CokernelObject",
                        # "CokernelProjectionWithGivenCokernelObject",
                        # "Colift",
                        # "TensorUnit",
                        # "LeftUnitorWithGivenTensorProduct",
                        # "RightUnitorWithGivenTensorProduct",
                        "TensorProductOnObjects",
                        # "TensorProductOnMorphismsWithGivenTensorProducts",
                        # "AssociatorLeftToRightWithGivenTensorProducts", # ✗
                        # "BraidingWithGivenTensorProducts", # ✗
                        # "LeftDistributivityExpandingWithGivenObjects",
                        # "LeftDistributivityFactoringWithGivenObjects",
                        # "RightDistributivityExpandingWithGivenObjects",
                        # "RightDistributivityFactoringWithGivenObjects",
                        # "DualOnObjects",
                        # "DualOnMorphisms",
                        # "CoevaluationForDualWithGivenTensorProduct", # ✗
                        # "EvaluationForDualWithGivenTensorProduct", # ✗
                      ],
        number_of_objectified_objects_in_data_structure_of_object := 1,
        number_of_objectified_morphisms_in_data_structure_of_object := 0,
        number_of_objectified_objects_in_data_structure_of_morphism := 2,
        number_of_objectified_morphisms_in_data_structure_of_morphism := 1
    ); end;;

S4 := SymmetricGroup( 4 );;

# CapJitEnableStepByStepCompilation();

# CapJitSetDebugLevel(1);

# CapJitCompiledFunction( SGREPS_Associator_1_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_2_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_3_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_4_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_5_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_6_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_7_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_123_Morphism );
# CapJitCompiledFunction( SGREPS_Associator_567_Morphism );

precompile_SkeletalCategoryOfGroupRepresentations( S4, QQ, "S4_Q" );;

# WARNING: Could not find matching declaration of [] for input [ <Category "IsHomalgRing">, <Category "IsInt"> ]
# while compiling function with name "Function added to SkeletalGroupRepresentations( SymmetricGroup( [ 1 .. 4 ] ), Q ) for AssociatorLeftToRightWithGivenTensorProducts"
# located at /home/tom/.gap/pkg/CAP_project/GroupRepresentationsForCAP/gap/SkeletalCategoryOfGroupRepresentations.gi:745
# 
# Error, reached the pre-set memory limit
# (change it with the -o command line option) in
#   result_func := function ( tree, result, keys, additional_arguments )
#       local new_bindings, key, name;
#       for key in keys do
#           tree.(key) := result.(key);
#       od;
#       if tree.type = "EXPR_DECLARATIVE_FUNC" and tree.id = old_func_id
#           then
#           Assert( 0, tree.nams = old_nams );
#           tree.id := new_func_id;
#           tree.nams := StructuralCopy( new_nams );
#           Assert( 0, 
#            IsEqualSet( Filtered( RecNames( tree.bindings ), 
#                function ( name )
#                     return StartsWith( name, "BINDING_" );
#                 end ), List( tree.bindings.names, function ( name )
#                     return Concatenation( "BINDING_", name );
#                 end ) ) );
#           new_bindings := rec(
#               type := "FVAR_BINDING_SEQ",
#               names := [  ] );
#           for name in tree.bindings.names do
#               CapJitAddBinding( new_bindings, 
#                new_nams[SafeUniquePosition( old_nams, name )], 
#                CapJitValueOfBinding( tree.bindings, name ) );
#           od;
#           tree.bindings := new_bindings;
#       fi;
#       if tree.type = "EXPR_REF_FVAR" and tree.func_id = old_func_id then
#           Assert( 0, tree.name in old_nams );
#           tree.func_id := new_func_id;
#           tree.name := new_nams[SafeUniquePosition( old_nams, tree.name )]
#            ;
#       fi;
#       return tree;
#   end
#  ; at /home/tom/.gap/pkg/CAP_project/CompilerForCAP/gap/InlineFunctionCall\
# s.gi:70 called from 
# CAP_JIT_INTERNAL_REPLACED_FVARS_FUNC_ID( tree, 
#  CAP_JIT_INTERNAL_FUNCTION_ID, tree.nams 
#  ) at /home/tom/.gap/pkg/CAP_project/CompilerForCAP/gap/Tools.gi:308 called 
# from
# pre_func( tree, additional_arguments 
#  ) at /home/tom/.gap/pkg/CAP_project/CompilerForCAP/gap/IterateOverTree.gi\
# :117 called from
# CAP_JIT_INTERNAL_ITERATE_OVER_TREE( tree.(key), pre_func, result_func, 
#  additional_arguments_func, additional_arguments_func( tree, key, 
#    additional_arguments ), cache_binding_results 
#  ) at /home/tom/.gap/pkg/CAP_project/CompilerForCAP/gap/IterateOverTree.gi\
# :187 called from
# CAP_JIT_INTERNAL_ITERATE_OVER_TREE( tree.(key), pre_func, result_func, 
#  additional_arguments_func, additional_arguments_func( tree, key, 
#    additional_arguments ), cache_binding_results 
#  ) at /home/tom/.gap/pkg/CAP_project/CompilerForCAP/gap/IterateOverTree.gi\
# :187 called from
# CAP_JIT_INTERNAL_ITERATE_OVER_TREE( tree.(key), pre_func, result_func, 
#  additional_arguments_func, additional_arguments_func( tree, key, 
#    additional_arguments ), cache_binding_results 
#  ) at /home/tom/.gap/pkg/CAP_project/CompilerForCAP/gap/IterateOverTree.gi\
# :187 called from
# ...  at *stdin*:102
# you can 'return;'
# brk> 
# gap> time;
# 2783104

# SkeletalCategoryOfGroupRepresentations( S4, QQ )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
