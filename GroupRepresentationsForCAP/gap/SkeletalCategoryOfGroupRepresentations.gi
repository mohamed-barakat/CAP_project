# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

#! @Chapter Semisimple Categories

ReadPackage( "GroupRepresentationsForCAP", "gap/precompiled_categories/SkeletalCategoryOfGroupRepresentations_S4_Q.gi" );

####################################
##
## Constructors
##
####################################

##
InstallMethod( SkeletalCategoryOfGroupRepresentations,
               [ IsGroup, IsFieldForHomalg ],
               
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, G, splitting_field )
    local name, category_filter, category_object_filter, category_morphism_filter, character_table, irreducible_characters, nr_irreducible_characters, category_of_rows, direct_sum_category, decompose_product_of_characters, object_datum_type, object_datum, object_constructor, morphism_datum_type, morphism_datum, morphism_constructor, modeling_tower_object_datum, modeling_tower_object_constructor, modeling_tower_morphism_datum, modeling_tower_morphism_constructor, ProductPWP, SGReps;
    
    Assert( 0, HasCharacteristic( splitting_field ) and Characteristic( splitting_field ) = 0 );
    
    ##
    name :=
        Concatenation( "SkeletalGroupRepresentations( ",
                       String( G ),
                       ", ",
                       String( splitting_field ),
                       " )" );
                       
    ##
    category_filter := IsSkeletalCategoryOfGroupRepresentations;
    category_object_filter := IsObjectInSkeletalCategoryOfGroupRepresentations;
    category_morphism_filter := IsMorphismInSkeletalCategoryOfGroupRepresentations;
    
    ##
    object_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( IsBigInt ) );
            
    ##
    object_constructor :=
      function( SGReps, triple )
        local length, support, ranks;
        
        length := triple[1];
        support := triple[2];
        ranks := triple[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= length and length <= NrIrreducibleCharacters( SGReps ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( ranks ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length ], i ->
            1 <= support[i] and support[i] <= NrIrreducibleCharacters( SGReps ) ) );
        
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length - 1 ], i ->
            support[i] < support[i+1] ) );
        
        # Assert( 0, ForAll( ranks, rank -> not 0 = rank ) );
        
        return CreateCapCategoryObjectWithAttributes( SGReps,
                       TripleOfNrSupportListOfSupportListOfRanks, triple );
                       
    end;
    
    ##
    object_datum := { SGReps, obj } -> TripleOfNrSupportListOfSupportListOfRanks( obj );
    
    ##
    morphism_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( rec( filter := IsHomalgMatrix, ring := splitting_field ) ) );
            
    ##
    morphism_constructor :=
      function( SGReps, S, triple, T )
        local splitting_field, length, support, matrices, matrix, length_source, support_source, ranks_source, length_target, support_target, ranks_target, i, current_support, source, target, s, t;
        
        splitting_field := UnderlyingSplittingField( SGReps );
        
        length := triple[1];
        support := triple[2];
        matrices := triple[3];
        
        length_source := NrSupport( S );
        support_source := Support( S );
        ranks_source := Components( S );
        
        length_target := NrSupport( T );
        support_target := Support( T );
        ranks_target := Components( T );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= length and length <= NrIrreducibleCharacters( SGReps ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( matrices ) = length );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length ], i ->
            1 <= support[i] and support[i] <= NrIrreducibleCharacters( SGReps ) ) );
            
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. length - 1 ], i ->
            support[i] < support[i+1] ) );
        
        # Assert( 0, ForAll( matrices, matrix ->
        #   ( not 0 = NrRows( matrix ) ) and ( not 0 = NrCols( matrix ) ) ) );
        
        # For all matrices in 'matrices',
        # the source and target at a support must be equal to the objects
        # in 'S' and 'T' at the same support.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. length ] do
            
            current_support := support[i];
            
            matrix := matrices[i];
            
            source := NrRows( matrix );
            target := NrCols( matrix );
            
            Assert( 0, source = Component( S, current_support ) and
                       target = Component( T, current_support ) );
                       
        od;
        
        # For any object s in 'S' there must be a morphism m
        # at the same support with Source( m ) = s.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. length_source ] do
            
            current_support := support_source[i];
            
            s := ranks_source[i];
            
            # Get the matrix at support i or a 0x0 matrix.
            matrix := [ [ HomalgZeroMatrix( 0, 0, splitting_field ) ], matrices{ Positions( support, current_support ) } ][ BooleanToInteger( current_support in support ) + 1 ][1];
            
            source := NrRows( matrix );
            
            Assert( 0, s = source );
            
        od;
        
        # For any object t in 'T' there must be a morphism m
        # at the same support with Target( m ) = t.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. length_target ] do
            
            current_support := support_target[i];
            
            t := ranks_target[i];
            
            # Get the morphism at support i or a 0x0 morphism.
            matrix := [ [ HomalgZeroMatrix( 0, 0, splitting_field ) ], matrices{ Positions( support, current_support ) } ][ BooleanToInteger( current_support in support ) + 1 ][1];
            
            target := NrCols( matrix );
            
            Assert( 0, t = target );
            
        od;
        
        return CreateCapCategoryMorphismWithAttributes( SGReps,
                    S,
                    T,
                    TripleOfNrSupportListOfSupportListOfMatrices, triple );
                    
    end;
    
    ##
    morphism_datum := { SGReps, phi } -> TripleOfNrSupportListOfSupportListOfMatrices( phi );
    
    ####################################
    # Modeling
    ####################################
    
    character_table := CharacterTable( G );
    
    irreducible_characters := Irr( character_table );
    
    nr_irreducible_characters := Length( irreducible_characters );
    
    ## building the categorical tower:
    
    category_of_rows :=
        CategoryOfRows(
            splitting_field
            : no_precompiled_code := false,
              FinalizeCategory := true );
              
    direct_sum_category :=
        DirectSumOfAdditiveCategory(
            nr_irreducible_characters,
            category_of_rows
            : no_precompiled_code := false,
              FinalizeCategory := true );
              
    ## From the raw object data to the object in the modeling category.
    modeling_tower_object_constructor :=
      function( SGReps, triple )
        local direct_sum_category, category_of_rows, nr_support, support, ranks, objects_rows;
        
        direct_sum_category := ModelingCategory( SGReps );
        
        category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
        
        nr_support := triple[1];
        support := triple[2];
        ranks := triple[3];
        
        # Turn the integer ranks into objects of category_of_rows.
        objects_rows :=
            List( [ 1 .. nr_support ], n ->
                ObjectConstructor( category_of_rows, ranks[n] ) );
                
        return ObjectConstructor( direct_sum_category, NTuple( 3, nr_support, support, objects_rows ) );
        
    end;
    
    ## From the object in the modeling category to the raw object data.
    modeling_tower_object_datum :=
      function( SGReps, object )
        local nr_support, support, objects_rows, ranks;
        
        nr_support := NrSupport( object );
        support := Support( object );
        objects_rows := Components( object );
        
        # Turn the objects of category_of_rows into integers.
        ranks :=
            List( [ 1 .. nr_support ], n ->
                RankOfObject( objects_rows[n] ) );
                
        return NTuple( 3, nr_support, support, ranks );
        
    end;
    
    ## From the raw morphism data to the morphism in the modeling category.
    modeling_tower_morphism_constructor :=
      function( SGReps, source, triple, target )
        local direct_sum_category, category_of_rows, nr_support, support, matrices, morphisms_rows;
        
        direct_sum_category := ModelingCategory( SGReps );
        
        category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
        
        nr_support := triple[1];
        support := triple[2];
        matrices := triple[3];
        
        # Turn the Homalg matrices into morphisms of category_of_rows.
        morphisms_rows :=
            List( [ 1 .. nr_support ], n ->
                AsCategoryOfRowsMorphism( category_of_rows, matrices[n] ) );
                
        return MorphismConstructor(
            direct_sum_category,
            source,
            NTuple( 3, nr_support, support, morphisms_rows ),
            target );
            
    end;
    
    ## From the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( SGReps, morphism )
        local nr_support, support, morphisms_rows, matrices;
        
        nr_support := NrSupport( morphism );
        support := Support( morphism );
        morphisms_rows := Components( morphism );
        
        # Turn the morphisms of category_of_rows into Homalg matrices.
        matrices :=
            List( [ 1 .. nr_support ], n ->
                UnderlyingMatrix( morphisms_rows[n] ) );
                
        return NTuple( 3, nr_support, support, matrices );
        
    end;
    
    SGReps :=
        ReinterpretationOfCategory( direct_sum_category,
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
            
    ProductPWP :=
        ProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations(
            irreducible_characters
            : no_precompiled_code := true,
              FinalizeCategory := true );
            
    # DeactivateCachingOfCategory( SGReps );
    
    # CapCategorySwitchLogicOff( SGReps );
    
    SetIsRigidSymmetricClosedMonoidalCategory( SGReps, true );
    
    SetUnderlyingGroup( SGReps, G );
    
    SetUnderlyingSplittingField( SGReps, splitting_field );
    
    SetNrIrreducibleCharacters( SGReps, nr_irreducible_characters );
    
    SetUnderlyingIrreducibleCharacters( SGReps, irreducible_characters );
    
    SetUnderlyingCharacterTable( SGReps, character_table );
    
    SetAssociatorData( SGReps, AssociatorsOnIrreduciblesFromDatabase( G ) );
    
    SetUnderlyingProductCategoryOfPermutationsWithProduct( SGReps, ProductPWP );
    
    Append( SGReps!.compiler_hints.category_attribute_names,
        [ "UnderlyingSplittingField",
          "UnderlyingGroup",
          "UnderlyingCharacterTable",
          "UnderlyingIrreducibleCharacters",
          "NrIrreducibleCharacters",
          "UnderlyingProductCategoryOfPermutationsWithProduct" ] );
          
    INSTALL_FUNCTIONS_FOR_SKELETAL_CATEGORY_OF_GROUP_REPRESENTATIONS(
        SGReps, irreducible_characters, nr_irreducible_characters );
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        # Using the S₄ with ℚ is general enough for many operations including TensorProduct.
        ADD_FUNCTIONS_FOR_SkeletalCategoryOfGroupRepresentations_S4_Q( SGReps );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( SGReps );
        
    fi;
    
    return SGReps;
    
end ) );

####################################
##
## Basic operations
##
####################################

InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SKELETAL_CATEGORY_OF_GROUP_REPRESENTATIONS,
  
  function( SGReps, irreducible_characters, nr_irreducible_characters )
    local decompose_product_of_characters, left_distributivity_expanding_permutation, right_distributivity_expanding_permutation, right_distributivity_function, left_distributivity_function, KroneckerProductOfPermutationWithIdentityFromRight, KroneckerProductOfPermutationWithIdentityFromLeft, TensorProductOfMorphismPermutationsWithIdentityMorphismFromRight, TensorProductOfMorphismPermutationsWithIdentityMorphismFromLeft, DirectSumForPermutationLists, distributivity_expanding_for_triple, distributivity_factoring_for_triple;
    
    ####################################
    # Monoidal structure
    ####################################
    
    ##
    AddTensorUnit( SGReps,
      function( SGReps )
        local irreducible_characters, unit_index;
        
        irreducible_characters := UnderlyingIrreducibleCharacters( SGReps );
        
        unit_index := SGREPS_IndexOfTrivialCharacter( irreducible_characters );
        
        return ObjectConstructor( SGReps, NTuple( 3, 1, [ unit_index ], [ 1 ] ) );
        
    end );
    
    # Sebastian's PhD. thesis construction I.3.47.
    AddLeftUnitorWithGivenTensorProduct( SGReps,
      function( SGReps, object, tensor_product )
        
        return IdentityMorphism( SGReps, object );
        
    end );
    
    # Sebastian's PhD. thesis construction I.3.47.
    AddRightUnitorWithGivenTensorProduct( SGReps,
      function( SGReps, object, tensor_product )
        
        return IdentityMorphism( SGReps, object );
        
    end );
    
    # Sebastian's PhD. thesis construction I.3.12.
    AddTensorProductOnObjects( SGReps,
      function( SGReps, object_1, object_2 )
        local direct_sum_category, category_of_rows, irreducible_characters, model_1, model_2, length_1, length_2, support_1, support_2, components_1, components_2, product;
        
        direct_sum_category := ModelingCategory( SGReps );
        
        category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
        
        irreducible_characters := UnderlyingIrreducibleCharacters( SGReps );
        
        model_1 := ModelingObject( SGReps, object_1 );
        model_2 := ModelingObject( SGReps, object_2 );
        
        length_1 := NrSupport( model_1 );
        length_2 := NrSupport( model_2 );
        
        support_1 := Support( model_1 );
        support_2 := Support( model_2 );
        
        components_1 := Components( model_1 );
        components_2 := Components( model_2 );
        
        # Example: (χ₁⊕2χ₄)·(χ₂⊕3χ₃)
        #        = [(χ₁·χ₂) ⊕ (χ₁·3χ₃)] ⊕ [(2χ₄·χ₂) ⊕ (2χ₄·3χ₃)]
        #        = [(χ₁·χ₂) ⊕ 3(χ₁·χ₃)] ⊕ [2(χ₄·χ₂) ⊕ 6(χ₄·χ₃)]
        #        = [ (χ₄)   ⊕   3(χ₃) ] ⊕ [2(χ₁⊕χ₂⊕χ₃⊕χ₄) ⊕ 6(χ₂⊕χ₄)]
        #        = 2χ₁⊕8χ₂⊕5χ₃⊕9χ₄
        product :=
            DirectSum( SGReps, List( [ 1 .. length_1 ], i ->
                DirectSum( SGReps, List( [ 1 .. length_2 ], function( j )
                    local multiplicity_of_product, decomposition, decomposition_nr_support, decomposition_support, decomposition_components, result;
                    
                    multiplicity_of_product :=
                        TensorProductOnObjects( category_of_rows, components_1[i], components_2[j] );
                    
                    decomposition := DecomposeProductOfCharacters( SGReps, support_1[i], support_2[j] );
                    
                    decomposition_nr_support := decomposition[1];
                    
                    decomposition_support := decomposition[2];
                    
                    decomposition_components := decomposition[3];
                    
                    decomposition_components :=
                        List( [ 1 .. decomposition_nr_support ], n ->
                            TensorProductOnObjects( category_of_rows, decomposition_components[n], multiplicity_of_product ) );
                            
                    result :=
                        ObjectConstructor( direct_sum_category,
                            NTuple( 3,
                                decomposition_nr_support,
                                decomposition_support,
                                decomposition_components ) );
                    
                    return ReinterpretationOfObject( SGReps, result );
                    
                end ) ) ) );
                
        return product;
        
    end );
    
    # Sebastian's PhD. thesis construction I.3.12.
    # (ɑ⊗ɣ)ₖ := ⊕ᵢ ⊕ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ)
    AddTensorProductOnMorphismsWithGivenTensorProducts( SGReps,
      function( SGReps, source, alpha, gamma, target )
        local direct_sum_category, category_of_rows, nr_irreducible_characters, irreducible_characters, alpha_model, gamma_model, length_alpha, length_gamma, support_alpha, support_gamma, components_alpha, components_gamma, tensored_morphisms_matrix, support, length_support, indices_tensored_morphisms, tensored_morphisms, sums_of_morphisms, positions, matrices;
        
        direct_sum_category := ModelingCategory( SGReps );
        
        category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
        
        irreducible_characters := UnderlyingIrreducibleCharacters( SGReps );
        nr_irreducible_characters := NrIrreducibleCharacters( SGReps );
        
        alpha_model := ModelingMorphism( SGReps, alpha );
        gamma_model := ModelingMorphism( SGReps, gamma );
        
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
                    TensorProductOnMorphisms( category_of_rows, components_alpha[i], components_gamma[j] ) ) );
                    
        # (ɑ⊗ɣ)ₖ := ⊕ᵢ ⊕ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ)
        sums_of_morphisms :=
            List( [ 1 .. length_support ],
              function( k )
                local alpha_gamma_identity, nr_rows, nr_cols, list_of_sources, list_of_targets, inner_sums, outer_sum;
                
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
                            #     return ZeroMorphism( category_of_rows, ZeroObject( category_of_rows ), ZeroObject( category_of_rows ) );
                            #
                            # fi;
                            
                            # ɑᵢ⊗ɣⱼ
                            alpha_gamma := tensored_morphisms[i][j];
                            
                            # Iₙ₍ᵢⱼ₎ₖ
                            identity_morphism :=
                                IdentityMorphism( category_of_rows, ObjectConstructor( category_of_rows, n_ijk ) );
                            
                            # (ɑᵢ⊗ɣⱼ)⊗Iₙ₍ᵢⱼ₎ₖ
                            return TensorProductOnMorphisms( category_of_rows, alpha_gamma, identity_morphism );
                            
                          end ) );
                          
                nr_rows := Length( alpha_gamma_identity );
                nr_cols := Length( alpha_gamma_identity[1] );
                
                # Compute the inner sums: ⊕ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ)
                
                list_of_sources :=
                    List( [ 1 .. nr_rows ], i ->
                        List( [ 1 .. nr_cols ], j ->
                            Source( alpha_gamma_identity[i][j] ) ) );
                            
                list_of_targets :=
                    List( [ 1 .. nr_rows ], i ->
                        List( [ 1 .. nr_cols ], j ->
                            Target( alpha_gamma_identity[i][j] ) ) );
                            
                inner_sums :=
                    List( [ 1 .. nr_rows ], i ->
                        DirectSumFunctorialWithGivenDirectSums( category_of_rows,
                            DirectSum( category_of_rows, list_of_sources[i] ),
                            list_of_sources[i],
                            alpha_gamma_identity[i],
                            list_of_targets[i],
                            DirectSum( category_of_rows, list_of_targets[i] ) ) );
                            
                # Compute the outer sum: ⊕ᵢ ⊕ⱼ (ɑᵢ⊗ɣⱼ⊗Iₙ₍ᵢⱼ₎ₖ).
                
                outer_sum :=
                    DirectSumFunctorialWithGivenDirectSums( category_of_rows,
                        Component( ModelingObject( SGReps, source ), k ),
                        List( [ 1 .. Length( inner_sums ) ], i -> Source( inner_sums[i] ) ),
                        inner_sums,
                        List( [ 1 .. Length( inner_sums ) ], i -> Target( inner_sums[i] ) ),
                        Component( ModelingObject( SGReps, target ), k ) );
                
                return outer_sum;
                
            end );
            
        matrices := List( [ 1 .. length_support ], i -> UnderlyingMatrix( sums_of_morphisms[i] ) );;
        
        return MorphismConstructor( SGReps,
                    source,
                    NTuple(3,
                        length_support,
                        support,
                        matrices ),
                    target );
                    
    end );
    
    # Sebastian's PhD. thesis construction I.3.38.
    AddAssociatorLeftToRightWithGivenTensorProducts( SGReps,
      function( SGReps, source, a, b, c, target )
        local morphism_1, morphism_2, morphism_3, morphism_4, morphism_5, morphism_6, morphism_7, morphism_123, morphism_567;
        
        # TODO: This if-statement is currently neccessary, because AssociatorData( SGReps )
        #       from Sebastians database has no entries in these cases,
        #       which results in an out of bounds error later.
        if IsZeroForObjects( SGReps, a ) or IsZeroForObjects( SGReps, b ) or IsZeroForObjects( SGReps, c ) then
            
            return ZeroMorphism( SGReps, source, target );
            
        fi;
        
        # TODO: check if a, b or c is the tensor unit and return IdentityMorphism( source )?
        
        # (a⊗b)⊗c  ⥲  ⊕ᵢ aᵢ((χᵢ⊗b)⊗c)
        # morphism_1 := SGREPS_Associator_1_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ ɑᵢ((χᵢ⊗b)⊗c)  ⥲  ⊕ᵢ ɑᵢ ⊕ⱼ bⱼ((χᵢ⊗χⱼ)⊗c)
        # morphism_2 := SGREPS_Associator_2_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
        # morphism_3 := SGREPS_Associator_3_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]
        # morphism_5 := SGREPS_Associator_5_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]  ⥲  ⊕ᵢ ɑᵢ·[ χᵢ⊗(b⊗c) ]
        # morphism_6 := SGREPS_Associator_6_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ aᵢ·[ χᵢ⊗(b⊗c) ]  ⥲  a⊗(b⊗c)
        # morphism_7 := SGREPS_Associator_7_Morphism( SGReps, a, b, c, source );
        
        # (a⊗b)⊗c  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
        morphism_123 := SGREPS_Associator_123_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]
        morphism_4 := SGREPS_Associator_4_Morphism( SGReps, a, b, c, source );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]  ⥲  a⊗(b⊗c)
        morphism_567 := SGREPS_Associator_567_Morphism( SGReps, a, b, c, source );
        
        return PreComposeList( SGReps, source, [ morphism_123, morphism_4, morphism_567 ], target );
        
    end );
    
    # Sebastian's PhD. thesis construction I.3.42.
    AddBraidingWithGivenTensorProducts( SGReps,
      function( SGReps, ab, a, b, ba )
        local morphism_1, morphism_2, morphism_3, morphism_4, morphism_5, morphism_12, morphism_45, L;
       
        if IsZeroForObjects( SGReps, a ) or IsZeroForObjects( SGReps, b ) then
            
            return ZeroMorphism( SGReps, ab, ba );
            
        fi;
        
        # (a⊗b)⊗c  ⥲  ⊕ᵢ aᵢ·[(χᵢ⊗b)⊗c]
        # morphism_1 := SGREPS_Braiding_1_Morphism( SGReps, a, b, ab );
        
        # ⊕ᵢ ɑᵢ·(χᵢ⊗b)  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χᵢ⊗χⱼ) ]
        # morphism_2 := SGREPS_Braiding_2_Morphism( SGReps, a, b, ab );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χᵢ⊗χⱼ) ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χⱼ⊗χᵢ) ]
        # morphism_3 := SGREPS_Braiding_3_Morphism( SGReps, a, b, ab );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χⱼ⊗χᵢ) ]  ⥲  ⊕ᵢ ɑᵢ·(b⊗χᵢ)
        # morphism_4 := SGREPS_Braiding_4_Morphism( SGReps, a, b, ab );
        
        # ⊕ᵢ ɑᵢ·(b⊗χᵢ)  ⥲  a⊗b
        # morphism_5 := SGREPS_Braiding_5_Morphism( SGReps, a, b, ab );
        
        # (a⊗b)⊗c  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χᵢ⊗χⱼ) ]
        morphism_12 := SGREPS_Braiding_12_Morphism( SGReps, a, b, ab );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χᵢ⊗χⱼ) ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χⱼ⊗χᵢ) ]
        morphism_3 := SGREPS_Braiding_3_Morphism( SGReps, a, b, ab );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χⱼ⊗χᵢ) ]  ⥲  a⊗b
        morphism_45 := SGREPS_Braiding_45_Morphism( SGReps, a, b, ba );
        
        L := [ morphism_12, morphism_3, morphism_45 ];
        
        return PreComposeList( SGReps, ab, L, ba );
        
    end );
    
    # (l₁⊕...⊕lₙ)⊗a ⥲ (l₁⊗a)⊕...⊕(lₙ⊗a)
    # AddRightDistributivityExpandingWithGivenObjects( SGReps,
    #   function( SGReps, source, L, a, target )
    #     local morphism;
    #
    #     morphism := SGREPS_RightDistributivityExpandingPermutation( SGReps, L, a, source );
    #
    #     return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, source, morphism, target );
    #
    # end );
    #
    # (l₁⊕...⊕lₙ)⊗a ⥲ (l₁⊗a)⊕...⊕(lₙ⊗a)
    AddRightDistributivityExpandingWithGivenObjects( SGReps,
      function( SGReps, source, L, a, target )
        local ProductPWP, morphism;
        
        ProductPWP := UnderlyingProductCategoryOfPermutationsWithProduct( SGReps );
        
        morphism :=
            RightDistributivityExpandingWithGivenObjects( ProductPWP,
                FunctorSGRepsIntoProdPWPOnObject( ProductPWP, source ),
                List( L, object -> FunctorSGRepsIntoProdPWPOnObject( ProductPWP, object ) ),
                FunctorSGRepsIntoProdPWPOnObject( ProductPWP, a ),
                FunctorSGRepsIntoProdPWPOnObject( ProductPWP, target ) );
                
        return FunctorProdPWPIntoSGRepsOnMorphism( SGReps, morphism );
        
    end );
    
    # (l₁⊗a)⊕...⊕(lₙ⊗a) ⥲ (l₁⊕...⊕lₙ)⊗a
    AddRightDistributivityFactoringWithGivenObjects( SGReps,
      function( SGReps, source, L, a, target )
        local morphism;
        
        morphism := SGREPS_RightDistributivityFactoringPermutation( SGReps, L, a, source );
        
        return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, source, morphism, target );
        
    end );
    
    # a⊗(l₁⊕...⊕lₙ) ⥲ (a⊗l₁)⊕...⊕(a⊗lₙ)
    AddLeftDistributivityExpandingWithGivenObjects( SGReps,
      function( SGReps, source, a, L, target )
        local morphism;
        
        morphism := SGREPS_LeftDistributivityExpandingPermutation( SGReps, a, L, source );
        
        return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, source, morphism, target );
        
    end );
    
    # (a⊗l₁)⊕...⊕(a⊗lₙ) ⥲ a⊗(l₁⊕...⊕lₙ)
    AddLeftDistributivityFactoringWithGivenObjects( SGReps,
      function( SGReps, source, a, L, target )
        local morphism;
        
        morphism := SGREPS_LeftDistributivityFactoringPermutation( SGReps, a, L, source );
        
        return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, source, morphism, target );
        
    end );
    
    # Sebastian's PhD. thesis section I.3.3.6.
    AddDualOnObjects( SGReps,
      function( SGReps, a )
        local a_nr_support, a_support, a_components, dual_support, dual_datum;
        
        a_nr_support := NrSupport( a );
        a_support := Support( a );
        a_components := Components( a );
        
        dual_support := List( [ 1 .. a_nr_support ], i ->
            SGREPS_IndexOfDualOfIrreducibleCharacter( SGReps, a_support[i] ) );
            
        dual_datum := SGREPS_DualObjectDatum( SGReps, a_nr_support, dual_support, a_components );
        
        return ObjectConstructor( SGReps, dual_datum );
        
    end );
    
    # Sebastian's PhD. thesis section I.3.3.6.
    AddDualOnMorphismsWithGivenDuals( SGReps,
      function( SGReps, source, alpha, target )
        local direct_sum_category, category_of_rows, alpha_model, nr_support, support, components, source_model, target_model, dual_support, dual_components, dual_datum, dual;
        
        direct_sum_category := ModelingCategory( SGReps );
        category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
        
        alpha_model := ModelingMorphism( SGReps, alpha );
        
        nr_support := NrSupport( alpha_model );
        support := Support( alpha_model );
        components := Components( alpha_model );
        
        source_model := ModelingObject( SGReps, source );
        target_model := ModelingObject( SGReps, target );
        
        dual_support := List( [ 1 .. nr_support ], i ->
            SGREPS_IndexOfDualOfIrreducibleCharacter( SGReps, support[i] ) );
            
        dual_components := List( [ 1 .. nr_support ], function( i )
            local s, t;
            
            s := Component( source_model, support[i] );
            t := Component( target_model, support[i] );
            
            return UnderlyingMatrix( DualOnMorphismsWithGivenDuals( category_of_rows, s, components[i], t ) );
            
        end );
        
        dual_datum := SGREPS_DualMorphismDatum( SGReps, nr_support, dual_support, dual_components );
        
        # 'source' and 'target' are swapped because the dual is a contravariant functor.
        return MorphismConstructor( SGReps, source, dual_datum, target );
        
    end );
    
    # Sebastian's PhD. thesis Construction I.3.55.
    # Note: there are typos with the duals, they have to be swapped.
    AddCoevaluationForDualWithGivenTensorProduct( SGReps,
      function( SGReps, unit, a, aav )
        local morphism_1, morphism_2, morphism_3, morphism_23;
        
        # 1·χᵤ → ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢ⊗χⱼᵛ) ]
        morphism_1 := SGREPS_CoevaluationForDual_1_Morphism( SGReps, unit, a, aav );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢ⊗χⱼᵛ) ] → ⊕ᵢ ɑᵢ·(χᵢ⊗aᵛ)
        # morphism_2 := SGREPS_CoevaluationForDual_2_Morphism( SGReps, a, aav );
        
        # ⊕ᵢ ɑᵢ·(χᵢ⊗aᵛ) → a⊗aᵛ
        # morphism_3 := SGREPS_CoevaluationForDual_3_Morphism( SGReps, a, aav );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢ⊗χⱼᵛ) ] → a⊗aᵛ
        morphism_23 := SGREPS_CoevaluationForDual_23_Morphism( SGReps, a, aav );
        
        return PreComposeList( SGReps, unit, [ morphism_1, morphism_23 ], aav );
        
    end );
    
    # Sebastian's PhD. thesis Construction I.3.55.
    # Note: there are typos with the duals, they have to be swapped.
    AddEvaluationForDualWithGivenTensorProduct( SGReps,
      function( SGReps, ava, a, unit )
        local morphism_1, morphism_2, morphism_3, morphism_12;
        
        # aᵛ⊗a → ⊕ᵢ ɑᵢ·(χᵢᵛ⊗a)
        # morphism_1 := SGREPS_EvaluationForDual_1_Morphism( SGReps, ava, a );
        
        # ⊕ᵢ ɑᵢ·(χᵢᵛ⊗a) → ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢᵛ⊗χⱼ) ]
        # morphism_2 := SGREPS_EvaluationForDual_2_Morphism( SGReps, ava, a );
        
        # aᵛ⊗a → ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢᵛ⊗χⱼ) ]
        morphism_12 := SGREPS_EvaluationForDual_12_Morphism( SGReps, ava, a );
        
        # ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢᵛ⊗χⱼ) ] → 1·χᵤ
        morphism_3 := SGREPS_EvaluationForDual_3_Morphism( SGReps, ava, a, unit );
        
        return PreComposeList( SGReps, ava, [ morphism_12, morphism_3 ], unit );
        
    end );
    
end );

####################################
##
## Attributes
##
####################################

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfRanks( object )[1];
    
end );

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMatrices( morphism )[1];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfRanks( object )[2];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMatrices( morphism )[2];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfRanks( object )[3];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMatrices( morphism )[3];
    
end );

InstallMethodForCompilerForCAP( DecompositionIntoSimpleObjects,
                                [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                
  function( object )
    local SGReps, nr_support, support, components;
    
    SGReps := CapCategory( object );
    
    nr_support := NrSupport( object );
    support := Support( object );
    components := Components( object );
    
    return Concatenation( List( [ 1 .. nr_support ], i ->
        List( [ 1 .. components[i] ], j ->
            ObjectConstructor( SGReps, NTuple( 3, 1, [ support[i] ], [ 1 ] ) ) ) ) );
            
end );

####################################
##
## Operations
##
####################################

InstallMethodForCompilerForCAP( Component,
                                [ IsObjectInSkeletalCategoryOfGroupRepresentations, IsBigInt ],
                                
  function( object, i )
    local support, components;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrIrreducibleCharacters( CapCategory( object ) ) );
    
    support := Support( object );
    
    components := Components( object );
    
    return [ [ 0 ], components{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

InstallMethodForCompilerForCAP( Component,
                                [ IsMorphismInSkeletalCategoryOfGroupRepresentations, IsBigInt ],
                                
  function( morphism, i )
    local splitting_field, zero_matrix, support, matrices;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrIrreducibleCharacters( CapCategory( morphism ) ) );
    
    splitting_field := UnderlyingSplittingField( CapCategory( morphism ) );
    
    zero_matrix := HomalgZeroMatrix( 0, 0, splitting_field );
    
    support := Support( morphism );
    
    matrices := Components( morphism );
    
    return [ [ zero_matrix ], matrices{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

##
InstallMethodForCompilerForCAP( \[\],
                                [ IsObjectInSkeletalCategoryOfGroupRepresentations, IsInt ],
                                
  function( object, i )
    
    return Component( object, i );
    
end );

##
InstallMethodForCompilerForCAP( \[\],
                                [ IsMorphismInSkeletalCategoryOfGroupRepresentations, IsInt ],
                                
  function( morphism, i )
    
    return Component( morphism, i );
    
end );

InstallMethodForCompilerForCAP( DecomposeProductOfCharacters,
                                [ IsSkeletalCategoryOfGroupRepresentations, IsBigInt, IsBigInt ],
                                
  function( SGReps, i, j )
    local direct_sum_category, category_of_rows, nr_irreducible_characters, irreducible_characters, scalar_product, support, components;
    
    direct_sum_category := ModelingCategory( SGReps );
    category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
    
    nr_irreducible_characters := NrIrreducibleCharacters( SGReps );
    
    irreducible_characters := UnderlyingIrreducibleCharacters( SGReps );
    
    scalar_product := List( [ 1 .. nr_irreducible_characters ], k -> SGREPS_ScalarProduct( irreducible_characters, k, i, j ) );
    
    support := Filtered( [ 1 .. nr_irreducible_characters ], k -> not IsZero( scalar_product[k] ) );
    
    components := List( support, k -> ObjectConstructor( category_of_rows, scalar_product[k] ) );
    
    return NTuple( 3, Length( support ), support, components );
    
end );

InstallMethodForCompilerForCAP( SecondExteriorPowerOfSimpleObject,
                                [ IsSkeletalCategoryOfGroupRepresentations,
                                  IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                
  function( SGReps, a )
    local character_table, irreducible_characters, character, exterior_power, scalar_products, components, support;
    
    character_table := UnderlyingCharacterTable( SGReps );
    
    irreducible_characters := UnderlyingIrreducibleCharacters( SGReps );
    
    character := irreducible_characters[ Support( a )[1] ];
    
    exterior_power := AntiSymmetricParts( character_table, [ character ], 2 )[1];
    
    scalar_products := List( [ 1 .. NrIrreducibleCharacters( SGReps ) ], i ->
        ScalarProduct( irreducible_characters[ i ], exterior_power ) );
        
    components := Filtered( scalar_products, prod -> not IsZero( prod ) );
        
    support := Filtered( [ 1 .. NrIrreducibleCharacters( SGReps ) ], i ->
        not IsZero( scalar_products[i] ) );
        
    return ObjectConstructor( SGReps, NTuple( 3, Length( support ), support, components ) );
    
end );

####################################
##
## Functors
##
####################################

InstallMethodForCompilerForCAP( FunctorProdPWPIntoSGRepsOnObject,
                                [ IsSkeletalCategoryOfGroupRepresentations,
                                  IsObjectInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( SGReps, object )
    
    return ObjectConstructor( SGReps, ObjectDatum( object ) );
    
end );


InstallMethodForCompilerForCAP( FunctorProdPWPIntoSGRepsOnMorphism,
                                [ IsSkeletalCategoryOfGroupRepresentations,
                                  IsMorphismInProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations ],
                                
  function( SGReps, morphism )
    local direct_sum_category, category_of_rows, homalg_field, source, target, nr_support_morphism, support_morphism, list_list_columns, matrices;
    
    direct_sum_category := ModelingCategory( SGReps );
    
    category_of_rows := UnderlyingAdditiveCategory( direct_sum_category );
    
    homalg_field := UnderlyingRing( category_of_rows );
    
    source := Source( morphism );
    target := Target( morphism );
    
    nr_support_morphism := NrSupport( morphism );
    support_morphism := Support( morphism );
    list_list_columns := Components( morphism );
    
    matrices :=
        List( [ 1 .. nr_support_morphism ], function( i )
            local nr_rows, nr_cols, block_cols, matrix;
            
            nr_rows := Component( source, support_morphism[i] );
            nr_cols := Component( target, support_morphism[i] );
            
            block_cols := list_list_columns[i];
            
            # Blocks are of the form:
            # ┌   ┐
            # │0ₘₙ│
            # │1ₙ │
            # │0ₗₙ│
            # └   ┘
            block_cols := List( block_cols, function( block )
                local cols;
                
                cols := block[2] + 1 - block[1];
                
                return
                    UnionOfRows( homalg_field, cols, [
                         HomalgZeroMatrix( block[1] - 1, cols, homalg_field ),
                         HomalgIdentityMatrix( cols, homalg_field ),
                         HomalgZeroMatrix( nr_rows - block[2], cols, homalg_field ) ] );
                         
            end );
            
            return UnionOfColumns( homalg_field, nr_rows, block_cols );
            
        end );
        
    return
        MorphismConstructor( SGReps,
            FunctorProdPWPIntoSGRepsOnObject( SGReps, source ),
            NTuple( 3, nr_support_morphism, support_morphism, matrices ),
            FunctorProdPWPIntoSGRepsOnObject( SGReps, target ) );
            
end );

InstallMethodForCompilerForCAP( FunctorSGRepsIntoProdPWPOnObject,
                                [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
                                  IsObjectInSkeletalCategoryOfGroupRepresentations ],
                                
  function( ProductPWP, object )
    
    return ObjectConstructor( ProductPWP, ObjectDatum( object ) );
    
end );

InstallMethodForCompilerForCAP( FunctorSGRepsIntoProdPWPOnMorphism,
                                [ IsProductOfCategoryOfPermutationsWithProductsAsSubcategoryOfSkeletalGroupRepresentations,
                                  IsMorphismInSkeletalCategoryOfGroupRepresentations ],
                                
  function( ProductPWP, morphism )
    
    # COVERAGE_IGNORE_NEXT_LINE
    Error( "Not yet implemented" );
    
end );

####################################
##
## Compilation helper functions
##
####################################

InstallGlobalFunction( SGREPS_ScalarProduct,
  
  function( irreducible_characters, k, i, j )
    local xk, xi, xj, xixj;
    
    xk := irreducible_characters[k];
    xi := irreducible_characters[i];
    xj := irreducible_characters[j];
    
    xixj := xi * xj;
    
    return ScalarProduct( xk, xixj );
    
end );

InstallGlobalFunction( SGREPS_IndexOfTrivialCharacter,
  
  function( irreducible_characters )
    
    return PositionProperty( irreducible_characters, IsOne );
    
end );

InstallGlobalFunction( SGREPS_IndexOfDualOfIrreducibleCharacter,
  
  function( SGReps, character_nr )
    local irreducible_characters, character;
    
    irreducible_characters := UnderlyingIrreducibleCharacters( SGReps );
    
    character := irreducible_characters[ character_nr ];
    
    return Position( irreducible_characters, ComplexConjugate( character ) );
    
end );

InstallGlobalFunction( SGREPS_DualObjectDatum,
  
  function( SGReps, nr_support, dual_support, dual_components )
    local permutation, support, components;
    
    # TODO: Can we use Sortex or would the sorting be
    #       a side-effect which is bad for the compiler?
    permutation := SortingPerm( dual_support );
    
    support := Permuted( dual_support, permutation );
    components := Permuted( dual_components, permutation );
    
    return NTuple( 3, nr_support, support, components );
    
end );

InstallGlobalFunction( SGREPS_DualMorphismDatum,
  
  function( SGReps, nr_support, dual_support, dual_components )
    local permutation, support, components;
    
    # TODO: Can we use Sortex or would the sorting be
    #       a side-effect which is bad for the compiler?
    permutation := SortingPerm( dual_support );
    
    support := Permuted( dual_support, permutation );
    components := Permuted( dual_components, permutation );
    
    return NTuple( 3, nr_support, support, components );
    
end );

####################################
##
## View & Display
##
####################################

SubscriptDigits := [ "₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉" ];

# Convert a number into a unicode subscript.
ToSubscript := function( n )
    local digits, subscripts, d;
    
    if n = 0 then
        
        return SubscriptDigits[1];
        
    fi;
    
    digits := [];
    
    while n > 0 do
        
        Add( digits, n mod 10 );
        
        n := Int( n / 10 );
        
    od;
    
    subscripts := [];
    
    for d in Reversed( digits ) do
        
        Append( subscripts, SubscriptDigits[d + 1] );
        
    od;
    
    return subscripts;
    
end;

##
InstallMethod( DisplayString,
               [ IsObjectInSkeletalCategoryOfGroupRepresentations ],
               
  function( object )
    local string, nr_support, support, ranks, i, character_nr, rank;
    
    string := "";
    
    nr_support := NrSupport( object );
    support := Support( object );
    ranks := Components( object );
    
    if nr_support = 0 then
        
        string := String( 0 );
        
    elif nr_support = 1 then
        
        character_nr := support[1];
        rank := ranks[1];
        
        if rank = 1 then
            
            string := Concatenation( "χ", ToSubscript( character_nr ) );
            
        else
            
            string := Concatenation( String( rank ), "χ", ToSubscript( character_nr ) );
            
        fi;
        
    elif nr_support > 1 then
        
        character_nr := support[1];
        rank := ranks[1];
        
        if rank = 1 then
            
            string := Concatenation( "χ", ToSubscript( character_nr ) );
            
        else
            
            string := Concatenation( String( rank ), "χ", ToSubscript( character_nr ) );
            
        fi;
        
        for i in [ 2 .. nr_support ] do
            
            character_nr := support[i];
            rank := ranks[i];
            
            if rank = 1 then
                
                string := Concatenation( string, "⊕χ", ToSubscript( character_nr ) );
                
            else
                
                string := Concatenation( string, "⊕", String( ranks[i] ), "χ", ToSubscript( character_nr ) );
                
            fi;
            
        od;
        
    fi;
    
    return string;
    
end );

##
InstallMethod( Display,
               [ IsMorphismInSkeletalCategoryOfGroupRepresentations ],
               
  function( morphism )
    local length, support, matrices, i;
    
    if IsZeroForMorphisms( morphism ) then
        
        Display( "0" );
        
    else
        
        length := NrSupport( morphism );
        support := Support( morphism );
        matrices := Components( morphism );
        
        for i in [ 1 .. length ] do
            
            Print( Concatenation( "Component: (", String( support[i] ), ")\n" ) );
            
            Print( "\n" );
            
            Display( matrices[i] );
            
            Print( "\n------------------------\n" );
            
        od;
        
    fi;
    
end );

