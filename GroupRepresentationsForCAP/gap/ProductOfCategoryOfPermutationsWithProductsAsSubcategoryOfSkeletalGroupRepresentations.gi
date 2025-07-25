# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

#! @Chapter Semisimple Categories

ReadPackage(
    "GroupRepresentationsForCAP",
    "gap/precompiled_categories/Product_Of_CategoryOfPermutationsWithProducts_AsSubcategoryOfSkeletalGroupRepresentations_S4_precompiled.gi" );

####################################
##
## Constructors
##
####################################

##
InstallMethod( ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
               [ IsList ],
               
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, irreducible_characters )
    local name, category_filter, category_object_filter, category_morphism_filter, nr_irreducible_characters, PWP, ProductPWP, object_datum_type, object_datum, object_constructor, morphism_datum_type, morphism_datum, morphism_constructor, modeling_tower_object_datum, modeling_tower_object_constructor, modeling_tower_morphism_datum, modeling_tower_morphism_constructor, Subcat;
    
    ##
    name := Concatenation( "𝚷( ", String( Length( irreducible_characters ) ), ", CategoryOfPermutationsWithProducts )" );
    
    ##
    category_filter := IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations;
    category_object_filter := IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations;
    category_morphism_filter := IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations;
    
    ##
    object_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( IsBigInt ) );
    
    ##
    object_constructor :=
      function( Subcat, triple )
        local length, support, list_nr_elements;
        
        length := triple[1];
        support := triple[2];
        list_nr_elements := triple[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= length and length <= NrIrreducibleCharacters( Subcat ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( list_nr_elements ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length ], i ->
            1 <= support[i] and support[i] <= NrIrreducibleCharacters( Subcat ) ) );
        
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length - 1 ], i ->
            support[i] < support[i+1] ) );
        
        # Assert( 0, ForAll( list_nr_elements, rank -> not 0 = rank ) );
        
        return CreateCapCategoryObjectWithAttributes( Subcat,
                       TripleOfNrSupportListOfSupportListOfNumberElements, triple );
        
    end;
    
    ##
    object_datum := { Subcat, obj } -> TripleOfNrSupportListOfSupportListOfNumberElements( obj );
    
    ##
    morphism_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf(
                CapJitDataTypeOfListOf(
                    CapJitDataTypeOfNTupleOf( 2,
                        IsBigInt,
                        IsBigInt ) ) ) );
                        
    ##
    morphism_constructor :=
      function( Subcat, S, triple, T )
        local length, support, list_list_columns, matrix, length_source, support_source, ranks_source, length_target, support_target, ranks_target, i, current_support, source, target, s, t;
        
        length := triple[1];
        support := triple[2];
        list_list_columns := triple[3];
        
        length_source := NrSupport( S );
        support_source := Support( S );
        ranks_source := Components( S );
        
        length_target := NrSupport( T );
        support_target := Support( T );
        ranks_target := Components( T );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= length and length <= NrIrreducibleCharacters( Subcat ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( list_list_columns ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length ], i ->
            1 <= support[i] and support[i] <= NrIrreducibleCharacters( Subcat ) ) );
        
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length - 1 ], i ->
            support[i] < support[i+1] ) );
        
        return
            CreateCapCategoryMorphismWithAttributes( Subcat,
                S,
                T,
                TripleOfNrSupportListOfSupportListOfListOfColumns, triple );
                
    end;
    
    ##
    morphism_datum :=
        { Subcat, phi } -> TripleOfNrSupportListOfSupportListOfListOfColumns( phi );
        
    ####################################
    # Modeling
    ####################################
    
    ## building the categorical tower:
    
    nr_irreducible_characters := Length( irreducible_characters );
    
    PWP := CategoryOfPermuationsWithProducts( : FinalizeCategory := true );
    
    ProductPWP :=
        SparseDirectProductOfCartesianCategory(
            nr_irreducible_characters,
            PWP
            : no_precompiled_code := false,
              FinalizeCategory := true );
              
    ## From the raw object data to the object in the modeling category.
    modeling_tower_object_constructor :=
      function( Subcat, triple )
        local ProductPWP, C, nr_support, support, list_nr_elements, components;
        
        ProductPWP := ModelingCategory( Subcat );
        
        C := UnderlyingCartesianCategory( ProductPWP );
        
        nr_support := triple[1];
        support := triple[2];
        list_nr_elements := triple[3];
        
        # Turn the integer list_nr_elements into objects of C.
        components :=
            List( [ 1 .. nr_support ], n ->
                ObjectConstructor( C, list_nr_elements[n] ) );
                
        return ObjectConstructor( ProductPWP, NTuple( 3, nr_support, support, components ) );
        
    end;
    
    ## From the object in the modeling category to the raw object data.
    modeling_tower_object_datum :=
      function( Subcat, object )
        local nr_support, support, components, list_nr_elements;
        
        nr_support := NrSupport( object );
        support := Support( object );
        components := Components( object );
        
        # Turn the objects of C into integers.
        list_nr_elements :=
            List( [ 1 .. nr_support ], n ->
                NumberElements( components[n] ) );
                
        return NTuple( 3, nr_support, support, list_nr_elements );
        
    end;
    
    ## From the raw morphism data to the morphism in the modeling category.
    modeling_tower_morphism_constructor :=
      function( Subcat, source, triple, target )
        local ProductPWP, C, nr_support, support, list_list_columns, source_components, morphisms;
        
        ProductPWP := ModelingCategory( Subcat );
        
        C := UnderlyingCartesianCategory( ProductPWP );
        
        nr_support := triple[1];
        support := triple[2];
        list_list_columns := triple[3];
        
        source_components := Components( source );
        
        # Turn list_list_columns into morphisms of C.
        # We need to extract the target, i.e., the number of columns,
        # from 'list_list_columns', since some objects in 'target' might
        # be terminal objects, and hence not available (sparse datastructure).
        morphisms :=
            List( [ 1 .. nr_support ], n ->
                MorphismConstructor( C,
                    source[ support[n] ],
                    list_list_columns[n],
                    ObjectConstructor( C, Sum( List( list_list_columns[n], col -> col[2] - col[1] + 1 ) ) ) ) );
                    
        return
            MorphismConstructor( ProductPWP,
                source,
                NTuple( 3, nr_support, support, morphisms ),
                target );
                
    end;
    
    ## From the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Subcat, morphism )
        local nr_support, support, morphisms, list_list_columns;
        
        nr_support := NrSupport( morphism );
        support := Support( morphism );
        morphisms := Components( morphism );
        
        # Unbox the morphisms of C.
        list_list_columns := List( [ 1 .. nr_support ], n -> ListOfColumns( morphisms[n] ) );
        
        return NTuple( 3, nr_support, support, list_list_columns );
        
    end;
    
    Subcat :=
        ReinterpretationOfCategory( ProductPWP,
            rec( name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 object_constructor := object_constructor,
                 object_datum := object_datum,
                 object_datum_type := object_datum_type,
                 morphism_constructor := morphism_constructor,
                 morphism_datum := morphism_datum,
                 morphism_datum_type := morphism_datum_type,
                 modeling_tower_object_constructor := modeling_tower_object_constructor,
                 modeling_tower_object_datum := modeling_tower_object_datum,
                 modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                 modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                 only_primitive_operations := true, )
            : FinalizeCategory := false );
            
    # DeactivateCachingOfCategory( Subcat );
    
    # CapCategorySwitchLogicOff( Subcat );
    
    SetUnderlyingIrreducibleCharacters( Subcat, irreducible_characters );
    
    SetNrIrreducibleCharacters( Subcat, nr_irreducible_characters );
    
    Append( Subcat!.compiler_hints.category_attribute_names,
        [ "NrIrreducibleCharacters",
          "UnderlyingIrreducibleCharacters" ] );
          
    ## See AddTensorProductOnObjects in
    ## SkeletalCategoryOfGroupRepresentations.gi
    ##
    ## DirectSum -> DirectProduct
    AddTensorProductOnObjects( Subcat,
      function( Subcat, object_1, object_2 )
        local ProductPWP, PWP, irreducible_characters, model_1, model_2, length_1, length_2, support_1, support_2, components_1, components_2, product;
        
        ProductPWP := ModelingCategory( Subcat );
        
        PWP := UnderlyingCartesianCategory( ProductPWP );
        
        irreducible_characters := UnderlyingIrreducibleCharacters( Subcat );
        
        model_1 := ModelingObject( Subcat, object_1 );
        model_2 := ModelingObject( Subcat, object_2 );
        
        length_1 := NrSupport( model_1 );
        length_2 := NrSupport( model_2 );
        
        support_1 := Support( model_1 );
        support_2 := Support( model_2 );
        
        components_1 := Components( model_1 );
        components_2 := Components( model_2 );
        
        product :=
            DirectProduct( Subcat, List( [ 1 .. length_1 ], i ->
                DirectProduct( Subcat, List( [ 1 .. length_2 ], function( j )
                    local multiplicity_of_product, decomposition, decomposition_nr_support, decomposition_support, decomposition_components, result;
                    
                    multiplicity_of_product :=
                        TensorProductOnObjects( PWP, components_1[i], components_2[j] );
                        
                    decomposition := DecomposeProductOfCharacters( Subcat, support_1[i], support_2[j] );
                    
                    decomposition_nr_support := decomposition[1];
                    
                    decomposition_support := decomposition[2];
                    
                    decomposition_components := decomposition[3];
                    
                    decomposition_components :=
                        List( [ 1 .. decomposition_nr_support ], n ->
                            TensorProductOnObjects( PWP, decomposition_components[n], multiplicity_of_product ) );
                            
                    result :=
                        ObjectConstructor( ProductPWP,
                            NTuple( 3,
                                decomposition_nr_support,
                                decomposition_support,
                                decomposition_components ) );
                                
                    return ReinterpretationOfObject( Subcat, result );
                    
                end ) ) ) );
                
        return product;
        
    end );
    
    ## See AddTensorProductOnMorphismsWithGivenTensorProducts in
    ## SkeletalCategoryOfGroupRepresentations.gi
    ##
    ## DirectSum -> DirectProduct
    ## DirectSumFunctorial -> DirectProductFunctorial
    AddTensorProductOnMorphismsWithGivenTensorProducts( Subcat,
      function( Subcat, source, alpha, gamma, target )
        local ProductPWP, PWP, nr_irreducible_characters, irreducible_characters, alpha_model, gamma_model, length_alpha, length_gamma, support_alpha, support_gamma, components_alpha, components_gamma, tensored_morphisms_matrix, support, length_support, indices_tensored_morphisms, tensored_morphisms, products_of_morphisms, positions, list_list_columns;
        
        ProductPWP := ModelingCategory( Subcat );
        
        PWP := UnderlyingCartesianCategory( ProductPWP );
        
        irreducible_characters := UnderlyingIrreducibleCharacters( Subcat );
        nr_irreducible_characters := NrIrreducibleCharacters( Subcat );
        
        alpha_model := ModelingMorphism( Subcat, alpha );
        gamma_model := ModelingMorphism( Subcat, gamma );
        
        length_alpha := NrSupport( alpha_model );
        length_gamma := NrSupport( gamma_model );
        
        support_alpha := Support( alpha_model );
        support_gamma := Support( gamma_model );
        
        components_alpha := Components( alpha_model );
        components_gamma := Components( gamma_model );
        
        support := Union2( Support( source ), Support( target ) );
        
        length_support := Length( support );
        
        # A matrix with elements
        # [ [ ɑ₁⊗ɣ₁ ], ..., [ ɑ₁⊗ɣₗ ] ].
        # [     .                .
        # [     .        .       .
        # [     .                .
        # [ [ ɑₙ⊗ɣ₁ ], ..., [ ɑₙ⊗ɣₗ ] ].
        tensored_morphisms :=
            List( [ 1 .. length_alpha ], i ->
                List( [ 1 .. length_gamma ], j ->
                    TensorProductOnMorphisms( PWP, components_alpha[i], components_gamma[j] ) ) );
                    
        # (ɑ⊗ɣ)ₖ := 𝚷ᵢ 𝚷ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ)
        products_of_morphisms :=
            List( [ 1 .. length_support ],
              function( k )
                local alpha_gamma_identity, nr_rows, nr_cols, list_of_sources, list_of_targets, inner_products, outer_product;
                
                # Precompute the tensor products (ɑᵢ⊗ɣⱼ)⊗Iₙ₍ᵢⱼ₎ₖ
                alpha_gamma_identity :=
                    List( [ 1 .. length_alpha ], i ->
                        List( [ 1 .. length_gamma ],
                          function( j )
                            local n_ijk, alpha_gamma, identity_morphism, direct_sum;
                            
                            # n₍ᵢⱼ₎ₖ = ⟨χᵢ·χⱼ,χₖ⟩
                            n_ijk := SGREPS_ScalarProduct( irreducible_characters, support[k], support_alpha[i], support_gamma[j] );
                            
                            # If n₍ᵢⱼ₎ₖ = 0, then Iₙ₍ᵢⱼ₎ₖ = 0 so (ɑᵢ⊗ɣⱼ)⊗Iₙ₍ᵢⱼ₎ₖ = 0.
                            # 
                            # if n_ijl = 0 then
                            #
                            #     return ZeroMorphism( PWP, ZeroObject( PWP ), ZeroObject( PWP ) );
                            #
                            # fi;
                            
                            # ɑᵢ⊗ɣⱼ
                            alpha_gamma := tensored_morphisms[i][j];
                            
                            # Iₙ₍ᵢⱼ₎ₖ
                            identity_morphism :=
                                IdentityMorphism( PWP, ObjectConstructor( PWP, n_ijk ) );
                                
                            # (ɑᵢ⊗ɣⱼ)⊗Iₙ₍ᵢⱼ₎ₖ
                            return TensorProductOnMorphisms( PWP, alpha_gamma, identity_morphism );
                            
                          end ) );
                          
                nr_rows := Length( alpha_gamma_identity );
                nr_cols := Length( alpha_gamma_identity[1] );
                
                # Compute the inner products: 𝚷ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ)
                
                list_of_sources :=
                    List( [ 1 .. nr_rows ], i ->
                        List( [ 1 .. nr_cols ], j ->
                            Source( alpha_gamma_identity[i][j] ) ) );
                            
                list_of_targets :=
                    List( [ 1 .. nr_rows ], i ->
                        List( [ 1 .. nr_cols ], j ->
                            Target( alpha_gamma_identity[i][j] ) ) );
                            
                inner_products :=
                    List( [ 1 .. nr_rows ], i ->
                        DirectProductFunctorialWithGivenDirectProducts( PWP,
                            DirectProduct( PWP, list_of_sources[i] ),
                            list_of_sources[i],
                            alpha_gamma_identity[i],
                            list_of_targets[i],
                            DirectProduct( PWP, list_of_targets[i] ) ) );
                            
                # Compute the outer product: 𝚷ᵢ 𝚷ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ).
                
                outer_product :=
                    DirectProductFunctorialWithGivenDirectProducts( PWP,
                        Component( ModelingObject( Subcat, source ), k ),
                        List( [ 1 .. Length( inner_products ) ], i -> Source( inner_products[i] ) ),
                        inner_products,
                        List( [ 1 .. Length( inner_products ) ], i -> Target( inner_products[i] ) ),
                        Component( ModelingObject( Subcat, target ), k ) );
                        
                return outer_product;
                
            end );
            
        list_list_columns :=
            List( [ 1 .. length_support ], i ->
                ListOfColumns( products_of_morphisms[i] ) );;
                
        return MorphismConstructor( Subcat,
                    source,
                    NTuple(3,
                        length_support,
                        support,
                        list_list_columns ),
                    target );
                    
    end );
    
    # TODO: Should be a derivation in CartesianMonoidal
    AddRightDistributivityExpandingWithGivenObjects( Subcat,
      function( Subcat, source, L, a, target )
        local nr_L, projection_list, projection_list_tensored, id, diagram;
        
        nr_L := Length( L );
        
        id := IdentityMorphism( Subcat, a );
        
        diagram :=
            List( L, summand ->
                TensorProductOnObjects( Subcat, summand, a ) );
                
        projection_list :=
            List( [ 1 .. nr_L ], i ->
                ProjectionInFactorOfDirectProduct( Subcat, L, i ) );
                
        projection_list_tensored :=
            List( [ 1 .. nr_L ], i ->
                TensorProductOnMorphismsWithGivenTensorProducts( Subcat,
                    source,
                    projection_list[i],
                    id,
                    diagram[i] ) );
                    
        return UniversalMorphismIntoDirectProductWithGivenDirectProduct( Subcat, diagram, source, projection_list_tensored, target );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        ADD_FUNCTIONS_FOR_Product_Of_CategoryOfPermutationsWithProducts_AsSubcategoryOfSkeletalGroupRepresentations_S4_precompiled( Subcat );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( Subcat );
        
    fi;
    
    return Subcat;
    
end ) );

####################################
##
## Attributes
##
####################################

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfNumberElements( object )[1];
    
end );

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfListOfColumns( morphism )[1];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfNumberElements( object )[2];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfListOfColumns( morphism )[2];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfNumberElements( object )[3];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfListOfColumns( morphism )[3];
    
end );

####################################
##
## Operations
##
####################################

InstallMethodForCompilerForCAP( Component,
                                [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
                                  IsBigInt ],
                                
  function( object, i )
    local support, components;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrIrreducibleCharacters( CapCategory( object ) ) );
    
    support := Support( object );
    
    components := Components( object );
    
    return [ [ 0 ], components{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

InstallMethodForCompilerForCAP( Component,
                                [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
                                  IsBigInt ],
                                
  function( morphism, i )
    local support, list_list_columns;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrIrreducibleCharacters( CapCategory( morphism ) ) );
    
    support := Support( morphism );
    
    list_list_columns := Components( morphism );
    
    # TODO: CapJitTypedExpression
    return [ [ [ ] ], list_list_columns{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

InstallMethodForCompilerForCAP( DecomposeProductOfCharacters,
                                [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations, IsBigInt, IsBigInt ],
                                
  function( Subcat, i, j )
    local ProductPWP, PWP, irreducible_characters, scalar_product, support, components;
    
    ProductPWP := ModelingCategory( Subcat );
    PWP := UnderlyingCartesianCategory( ProductPWP );
    
    irreducible_characters := UnderlyingIrreducibleCharacters( Subcat );
    
    scalar_product := List( [ 1 .. NrIrreducibleCharacters( Subcat ) ], k ->
        SGREPS_ScalarProduct( irreducible_characters, k, i, j ) );
        
    support := Filtered( [ 1 .. Length( irreducible_characters ) ], i ->
        not IsZero( scalar_product[i] ) );
        
    components :=
        List( scalar_product{ support }, character ->
            ObjectConstructor( PWP, character ) );
            
    return NTuple( 3, Length( support ), support, components );
    
end );

####################################
##
## View & Display
##
####################################

##
InstallMethod( DisplayString,
               [ IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
               
  object -> String( TripleOfNrSupportListOfSupportListOfNumberElements( object ) )
  
);

##
InstallMethod( Display,
               [ IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
               
  function( morphism )
    local length, support, list_list_columns, i;
    
    if IsEqualForObjects( Target( morphism ), TerminalObject( CapCategory( morphism ) ) ) then
        
        Display( "T" );
        
    else
        
        length := NrSupport( morphism );
        support := Support( morphism );
        list_list_columns := Components( morphism );
        
        for i in [ 1 .. length ] do
            
            Print( Concatenation( "Component: (", String( support[i] ), ")\n" ) );
            
            Print( "\n" );
            
            Display( list_list_columns[i] );
            
            Print( "\n------------------------\n" );
            
        od;
        
    fi;
    
end );

