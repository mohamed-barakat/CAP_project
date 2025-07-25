# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

# 1 ≤ i ≤ m = Support(a)
#
# (a⊗b)⊗c
#     │
#     │ σ((χ₁,...,χ₁,...,χₘ,...,χₘ), b) ⊗ 1𞁞
#     │    └───────┘     └───────┘
#     │    a₁ times      aₘ times
#     ↓
# (⊕ᵢ aᵢ·(χᵢ⊗b))⊗c
#     │
#     │ σ((χ₁⊗b,...,χ₁⊗b,...,χₘ⊗b,...,χₘ⊗b), c)
#     │    └───────────┘     └───────────┘
#     │      a₁ times          aₘ times
#     ↓
# ⊕ᵢ aᵢ·[(χᵢ⊗b)⊗c],
InstallGlobalFunction( SGREPS_Associator_1_Morphism,
  function( SGReps, a, b, c, abc )
    local ab, L, L_tensor_b, sigma_1, sigma_1_tensor_id_c, sigma_2;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    ab := TensorProductOnObjects( SGReps, a, b );
    
    L := DecompositionIntoSimpleObjects( a );
    L_tensor_b := List( L, a_i -> TensorProductOnObjects( SGReps, a_i, b ) );
    
    # a⊗b  ⥲  ⊕ᵢ aᵢ·(χᵢ⊗b)
    sigma_1 := SGREPS_RightDistributivityExpandingPermutation( SGReps, L, b, ab );
    
    # (a⊗b)⊗c  ⥲  (⊕ᵢ aᵢ·(χᵢ⊗b))⊗c
    sigma_1_tensor_id_c := SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromRight( SGReps, sigma_1, c, abc );
    
    # (⊕ᵢ aᵢ·(χᵢ⊗b))⊗c  ⥲  ⊕ᵢ aᵢ·[(χᵢ⊗b)⊗c]
    sigma_2 := SGREPS_RightDistributivityExpandingPermutation( SGReps, L_tensor_b, c, abc );
    
    return SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, sigma_1_tensor_id_c, sigma_2 );
    
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
#
# ⊕ᵢ ɑᵢ·[(χᵢ⊗b)⊗c]
#        │
#        │ ⊕ᵢ ɑᵢ·[ σ(χᵢ, (χ₁,...,χ₁,...,χₙ,...,χₙ)) ⊗ 1𞁞 ]
#        │                └───────┘     └───────┘
#        │                b₁ times      bₙ times
#        ↓
# ⊕ᵢ ɑᵢ·[ [⊕ⱼ bⱼ·(χᵢ⊗χⱼ)] ⊗ c ]
#        │
#        │ ⊕ᵢ ɑᵢ·σ((χᵢ⊗χ₁,...,χᵢ⊗χ₁,...,χᵢ⊗χₙ,...,χᵢ⊗χₙ), c)
#        │          └─────────────┘     └─────────────┘
#        │              b₁ times             bₙ times
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]
InstallGlobalFunction( SGREPS_Associator_2_Morphism,
  function( SGReps, a, b, c, abc )
    local a_nr_support, a_support, a_components, L, source_nr_support, source_support, sigmas, a_sigmas, sum_a_sigmas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    L := DecompositionIntoSimpleObjects( b );
    
    # The list of composed expanding morphisms:
    # σᵢ: (χᵢ⊗b)⊗c  ⥲  ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ]
    sigmas := List( [ 1 .. a_nr_support ], function( i )
        local xi, xib, xibc, sigma_1, sigma_1_tensor_id_c, xi_tensor_L, sigma_2;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        xib := TensorProductOnObjects( SGReps, xi, b );
        xibc := TensorProductOnObjects( SGReps, xib, c );
        
        # χᵢ⊗b = [χᵢ⊗(b₁χ₁⊕ ...⊕ bₖχₖ)] = [χᵢ⊗(χ₁⊕ ...⊕ χ₁⊕ ...⊕ χₖ⊕ ...⊕ χₖ)]  ⥲  [⊕ⱼ bⱼ·(χᵢ⊗χⱼ)]
        sigma_1 := SGREPS_LeftDistributivityExpandingPermutation( SGReps, xi, L, xib );
        
        # Error( "\033[31mDEBUGPRINT[First expanding]\033[0m" );
        # [χᵢ⊗b]⊗c = [χᵢ⊗(b₁χ₁⊕ ...⊕ bₖχₖ)]⊗c  ⥲  [⊕ⱼ bⱼ·(χᵢ⊗χⱼ)]⊗c
        sigma_1_tensor_id_c := SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromRight( SGReps, sigma_1, c, xibc );
        
        # Error( "\033[31mDEBUGPRINT[Tensor Product]\033[0m" );
        xi_tensor_L := List( L, xj -> TensorProductOnObjects( SGReps, xi, xj ) );
        
        # [⊕ⱼ bⱼ·(χᵢ⊗χⱼ)]⊗c  ⥲  ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ]
        sigma_2 := SGREPS_RightDistributivityExpandingPermutation( SGReps, xi_tensor_L, c, xibc );
        
        # Error( "\033[31mDEBUGPRINT[Second expanding]\033[0m" );
        
        return SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, sigma_1_tensor_id_c, sigma_2 );
        
    end );
    
    # ɑᵢ·σᵢ
    a_sigmas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> sigmas[i] ) ) );
        
    # ⊕ᵢ ɑᵢ·σᵢ:  ɑᵢ·[(χᵢ⊗b)⊗c]  ⥲  ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]
    sum_a_sigmas := SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_sigmas, abc );
    
    return sum_a_sigmas;
    
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
# 1 ≤ k ≤ o = Support(c)
#
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]
#        │
#        │ ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·σ_(χᵢ⊗χⱼ, (χ₁,...,χ₁,...,χₒ,...,χₒ)) ]
#        │                          └───────┘     └───────┘
#        │                          c₁ times,     cₒ times
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
InstallGlobalFunction( SGREPS_Associator_3_Morphism,
  function( SGReps, a, b, c, abc )
    local a_nr_support, a_support, a_components, b_nr_support, b_support, b_components, L, inner_summands, a_inner_summands, outer_sum;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    b_nr_support := NrSupport( b );
    b_support := Support( b );
    b_components := Components( b );
    
    L := DecompositionIntoSimpleObjects( c );
    
    # ⊕ⱼ bⱼ·σⱼ:  bⱼ·[(χᵢ⊗xⱼ)⊗c]  ⥲  bⱼ·[⊕ₖ cₖ·[(χᵢ⊗χⱼ)⊗χₖ]]
    inner_summands := List( [ 1 .. a_nr_support ], function( i )
        local xi, sigmas, b_sigmas, xibc, sum_b_sigmas;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        
        # σⱼ:  (χᵢ⊗xⱼ)⊗c  ⥲  ⊕ₖ cₖ·[(χᵢ⊗χⱼ)⊗χₖ]
        sigmas := List( [ 1 .. b_nr_support ], function( j )
            local xj, xixj, xixjc;
            
            xj := ObjectConstructor( SGReps, NTuple( 3, 1, [ b_support[j] ], [ 1 ] ) );
            xixj := TensorProductOnObjects( SGReps, xi, xj );
            xixjc := TensorProductOnObjects( SGReps, xixj, c );
            
            return SGREPS_LeftDistributivityExpandingPermutation( SGReps, xixj, L, xixjc );
            
        end );
        
        # The list of bⱼ-many duplications of σⱼ.
        b_sigmas := Concatenation( List( [ 1 .. b_nr_support ], i ->
            List( [ 1 .. b_components[i] ], j -> sigmas[i] ) ) );
            
        xibc := TensorProductOnObjects( SGReps, TensorProductOnObjects( SGReps, xi, b ), c );
        
        # ⊕ⱼ bⱼ·σⱼ:  bⱼ·[(χᵢ⊗xⱼ)⊗c]  ⥲  bⱼ·[⊕ₖ cₖ·[(χᵢ⊗χⱼ)⊗χₖ]]
        sum_b_sigmas := SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, b_sigmas, xibc );
        
        return sum_b_sigmas;
        
    end );
    
    # The list of aᵢ-many duplications of ⊕ⱼ bⱼ·σⱼ.
    a_inner_summands := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> inner_summands[i] ) ) );
        
    # ⊕ᵢ ɑᵢ·[⊕ⱼ bⱼ·σⱼ]:  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
    outer_sum := SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_inner_summands, abc );
    
    return outer_sum;
    
end );

# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
#                   │
#                   │ ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·αᵢⱼₖ ]
#                   ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]
# 
# TODO: use abc somewhere?
InstallGlobalFunction( SGREPS_Associator_4_Morphism,
  function( SGReps, a, b, c, abc )
    local DS, Rows, splitting_field, unit, associator_data, a_nr_support, a_support, a_components, b_nr_support, b_support, b_components, c_nr_support, c_support, c_components, outer_summands, a_summands, a_sum;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    DS := ModelingCategory( SGReps );
    
    Rows := UnderlyingAdditiveCategory( DS );
    
    splitting_field := UnderlyingSplittingField( SGReps );
    
    unit := TensorUnit( SGReps );
    
    associator_data := AssociatorData( SGReps );
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    b_nr_support := NrSupport( b );
    b_support := Support( b );
    b_components := Components( b );
    
    c_nr_support := NrSupport( c );
    c_support := Support( c );
    c_components := Components( c );
    
    outer_summands := List( [ 1 .. a_nr_support ], function( i )
        local xi, inner_summands, b_summands, b_sum;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        
        inner_summands := List( [ 1 .. b_nr_support ], function( j )
            local xj, summands, c_summands, c_sum;
            
            xj := ObjectConstructor( SGReps, NTuple( 3, 1, [ b_support[j] ], [ 1 ] ) );
            
            summands := List( [ 1 .. c_nr_support ], function( k )
                local xk, xixjxk, xixjxk_nr_support, xixjxk_support, xixjxk_components, morphism_list;
                
                xk := ObjectConstructor( SGReps, NTuple( 3, 1, [ c_support[k] ], [ 1 ] ) );
                
                xixjxk := TensorProductOnObjects( SGReps, TensorProductOnObjects( SGReps, xi, xj ), xk );
                
                if IsEqualForObjects( SGReps, xi, unit ) or
                   IsEqualForObjects( SGReps, xj, unit ) or
                   IsEqualForObjects( SGReps, xk, unit ) then
                    
                    return IdentityMorphism( SGReps, xixjxk );
                    
                else
                    
                    xixjxk_nr_support := NrSupport( xixjxk );
                    xixjxk_support := Support( xixjxk );
                    xixjxk_components := Components( xixjxk );
                    
                    morphism_list := List( [ 1 .. xixjxk_nr_support ], function( l )
                        local matrices, string, dimension, homalg_matrix;
                        
                        matrices := associator_data[ a_support[i] ][ b_support[j] ][ c_support[k] ];
                        
                        string := Concatenation( "[", matrices[ xixjxk_support[l] ], "]" );
                        
                        dimension := xixjxk_components[l];
                        
                        homalg_matrix := HomalgMatrix( string, dimension, dimension, splitting_field );
                        # homalg_matrix := HomalgIdentityMatrix( dimension, splitting_field ); # Wrong, only shows that the type signature problems stem from here.
                        
                        return homalg_matrix;
                        
                    end );
                    
                    return MorphismConstructor( SGReps,
                                xixjxk,
                                NTuple( 3, xixjxk_nr_support, xixjxk_support, morphism_list ),
                                xixjxk );
                    
                fi;
                
            end );
            
            c_summands := Concatenation( List( [ 1 .. c_nr_support ], k ->
                List( [ 1 .. c_components[k] ], l -> summands[k] ) ) );
                
            c_sum := DirectSumFunctorial( SGReps, c_summands );
            
            return c_sum;
            
        end );
        
        b_summands := Concatenation( List( [ 1 .. b_nr_support ], j ->
            List( [ 1 .. b_components[j] ], k -> inner_summands[j] ) ) );
            
        b_sum := DirectSumFunctorial( SGReps, b_summands );
        
        return b_sum;
        
    end );
    
    a_summands := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> outer_summands[i] ) ) );
    
    a_sum := DirectSumFunctorial( SGReps, a_summands );
    
    return a_sum;
    
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
# 1 ≤ k ≤ o = Support(c)
#
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]
#        │
#        │ ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ σ⁻¹(χᵢ, (χᵢ⊗(χⱼ⊗χ₁),...,χᵢ⊗(χⱼ⊗χ₁),...,χᵢ⊗(χⱼ⊗χₒ),...,χᵢ⊗(χⱼ⊗χₒ))) ] ]
#        │                          └───────────────────────┘     └───────────────────────┘
#        │                                   c₁ times                        cₒ times
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(⊕ₖ cₖ·[χⱼ⊗χₖ]) ] ]
#        │
#        │ ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ 1_χᵢ ⊗  σ⁻¹(χⱼ, (χⱼ⊗χ₁,...,χⱼ⊗χ₁,...,χⱼ⊗χₖ,...,χⱼ⊗χₖ)) ] ]
#        │                                  └─────────────┘     └─────────────┘
#        │                                      c₁ times             cₒ times
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ)) ] ]
#        ‖
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]
InstallGlobalFunction( SGREPS_Associator_5_Morphism,
  function( SGReps, a, b, c, abc )
    local a_nr_support, a_support, a_components, b_nr_support, b_support, b_components, bc, L, inner_summands, a_inner_summands, xibc, outer_sum;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    b_nr_support := NrSupport( b );
    b_support := Support( b );
    b_components := Components( b );
    
    bc := TensorProductOnObjects( SGReps, b, c );
    
    L := DecompositionIntoSimpleObjects( c );
    
    # ⊕ⱼ bⱼ·σⱼ: ⊕ⱼ bⱼ·[⊕ₖ cₖ·[χᵢ⊗(χⱼ⊗χₖ)]]  ⥲  ⊕ⱼ bⱼ·[χᵢ⊗(⊕ₖ cₖ·[χⱼ⊗χₖ])]
    inner_summands := List( [ 1 .. a_nr_support ], function( i )
        local xi, sigmas, b_sigmas, xibc, sum_b_sigmas;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        
        # σⱼ: ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ]  ⥲  χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ)) = χᵢ⊗(χⱼ⊗c)
        sigmas := List( [ 1 .. b_nr_support ], function( j )
            local xj, xjc, xixjc, xj_tensor_L, first_left_factoring, second_left_factoring, id_xi_tensor_second_left_factoring;
            
            xj := ObjectConstructor( SGReps, NTuple( 3, 1, [ b_support[j] ], [ 1 ] ) );
            xjc := TensorProductOnObjects( SGReps, xj, c );
            xixjc := TensorProductOnObjects( SGReps, xi, xjc );
            
            xj_tensor_L := List( [ 1 .. Length( L ) ], k -> TensorProductOnObjects( SGReps, xj, L[k] ) );
            
            # ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ]  ⥲  χᵢ⊗(⊕ₖ cₖ·[χⱼ⊗χₖ])
            first_left_factoring := SGREPS_LeftDistributivityFactoringPermutation( SGReps, xi, xj_tensor_L, xixjc );
            
            # ⊕ₖ cₖ·[χⱼ⊗χₖ]  ⥲  χⱼ⊗ (⊕ₖ cₖ·χₖ) = χⱼ⊗c
            second_left_factoring := SGREPS_LeftDistributivityFactoringPermutation( SGReps, xj, L, xjc );
            
            # χᵢ⊗(⊕ₖ cₖ·[χⱼ⊗χₖ])  ⥲  χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ)) = χᵢ⊗(χⱼ⊗c)
            id_xi_tensor_second_left_factoring :=
                SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromLeft( SGReps,
                                                                                        xi,
                                                                                        second_left_factoring,
                                                                                        xixjc );
                                                                                        
            return SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, first_left_factoring, id_xi_tensor_second_left_factoring );
            
        end );
        
        # bⱼ·σⱼ: bⱼ·[⊕ₖ cₖ·[χᵢ⊗(χⱼ⊗χₖ)]]  ⥲  bⱼ·(χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ))) = bⱼ·(χᵢ⊗(χⱼ⊗c))
        b_sigmas := Concatenation( List( [ 1 .. b_nr_support ], j ->
            List( [ 1 .. b_components[j] ], k -> sigmas[j] ) ) );
        
        xibc := TensorProductOnObjects( SGReps, xi, bc );
        
        # ⊕ⱼ bⱼ·σⱼ: ⊕ⱼ bⱼ·[⊕ₖ cₖ·[χᵢ⊗(χⱼ⊗χₖ)]]  ⥲  ⊕ⱼ bⱼ·[χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ))] = ⊕ⱼ bⱼ·[χᵢ⊗(χⱼ⊗c)]
        sum_b_sigmas := SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, b_sigmas, xibc );
        
        # Error( "\033[31mDEBUGPRINT[First Direct Sum]\033[0m" );
        
        return sum_b_sigmas;
        
    end );
    
    # ɑᵢ·[⊕ⱼ bⱼ·σⱼ]: ɑᵢ·[⊕ⱼ bⱼ·[⊕ₖ cₖ·[χᵢ⊗(χⱼ⊗χₖ)]]]  ⥲  ɑᵢ·[⊕ⱼ bⱼ·[χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ))]] = ɑᵢ·[⊕ⱼ bⱼ·[χᵢ⊗(χⱼ⊗c)]]
    a_inner_summands := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], k -> inner_summands[i] ) ) );
    
    # ⊕ᵢ ɑᵢ·[⊕ⱼ bⱼ·σⱼ]: ⊕ᵢ ɑᵢ·[⊕ⱼ bⱼ·[⊕ₖ cₖ·[χᵢ⊗(χⱼ⊗χₖ)]]]  ⥲  ⊕ᵢ ɑᵢ·[⊕ⱼ bⱼ·[χᵢ⊗(χⱼ⊗ (⊕ₖ cₖ·χₖ))]] = ⊕ᵢ ɑᵢ·[⊕ⱼ bⱼ·[χᵢ⊗(χⱼ⊗c)]]
    outer_sum := SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_inner_summands, abc );
    
    # Error( "\033[31mDEBUGPRINT[Second Direct Sum]\033[0m" );
    
    return outer_sum;
    
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
#
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]
#        │
#        │ ⊕ᵢ ɑᵢ·[ σ⁻¹(χᵢ, (χᵢ⊗(χ₁⊗c),...,χᵢ⊗(χ₁⊗c),...,χᵢ⊗(χₙ⊗c),...,χᵢ⊗(χₙ⊗c)) ]
#        │                  └─────────────────────┘     └─────────────────────┘
#        │                         b₁ times                    bₙ times
#        ↓
# ⊕ᵢ ɑᵢ·[ χᵢ⊗ [⊕ⱼ bⱼ·(χⱼ⊗c) ]]
#        │
#        │ ⊕ᵢ ɑᵢ·[ (1_χᵢ)⊗ σ⁻¹((χ₁⊗c,...,χ₁⊗c,...,χₙ⊗c,...,χₙ⊗c), c) ]
#        │                      └───────────┘     └───────────┘
#        │                        b₁ times          bₙ times
#        ↓
# ⊕ᵢ ɑᵢ·[ χᵢ⊗((⊕ⱼ bⱼ·χⱼ)⊗c) ]
#        ‖
# ⊕ᵢ ɑᵢ·[ χᵢ⊗(b⊗c) ]
InstallGlobalFunction( SGREPS_Associator_6_Morphism,
  function( SGReps, a, b, c, abc )
    local a_nr_support, a_support, a_components, b_nr_support, b_support, b_components, bc, sigmas, a_sigmas, sum_a_sigmas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    b_nr_support := NrSupport( b );
    b_support := Support( b );
    b_components := Components( b );
    
    bc := TensorProductOnObjects( SGReps, b, c );
    
    # σᵢ: ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ]  ⥲  χᵢ⊗(b⊗c)
    sigmas := List( [ 1 .. a_nr_support ], function( i )
        local xi, L_xixjc, xibc, left_factoring, L_xjc, L_b, L_bc, right_factoring, id_xi, id_c_tensor_right_factoring;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        
        L_b := DecompositionIntoSimpleObjects( b );
        
        L_bc := List( [ 1 .. Length( L_b ) ], k -> TensorProductOnObjects( SGReps, L_b[k], c ) );
            
        xibc := TensorProductOnObjects( SGReps, xi, bc );
        
        # ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ]  ⥲  χᵢ⊗ [⊕ⱼ bⱼ·(χⱼ⊗c) ]
        left_factoring := SGREPS_LeftDistributivityFactoringPermutation( SGReps, xi, L_bc, xibc );
        
        # ⊕ⱼ bⱼ·(χⱼ⊗c)  ⥲  (⊕ⱼ bⱼ·χⱼ)⊗c = b⊗c
        right_factoring := SGREPS_RightDistributivityFactoringPermutation( SGReps, L_b, c, bc );
        
        # χᵢ⊗ [⊕ⱼ bⱼ·(χⱼ⊗c) ]  ⥲  χᵢ⊗((⊕ⱼ bⱼ·χⱼ)⊗c) = χᵢ⊗(b⊗c)
        id_c_tensor_right_factoring :=
            SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromLeft( SGReps,
                                                                                    xi,
                                                                                    right_factoring,
                                                                                    xibc );
                                                                                    
        return SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, left_factoring, id_c_tensor_right_factoring );
        
    end );
    
    # ɑᵢ·σᵢ: ɑᵢ·[⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ]]  ⥲  ɑᵢ·[χᵢ⊗(b⊗c)]
    a_sigmas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> sigmas[i] ) ) );
    
    # ⊕ᵢ ɑᵢ·σᵢ: ɑᵢ·[⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ]]  ⥲  ɑᵢ·[χᵢ⊗(b⊗c)]
    sum_a_sigmas := SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_sigmas, abc );
    
    # Error( "\033[31mDEBUGPRINT[DirectSumFunctorial]\033[0m" );
    
    return sum_a_sigmas;
    
end );

# 1 ≤ i ≤ m = Support(a)
# 
# ⊕ᵢ aᵢ·[ χᵢ⊗(b⊗c) ]
#     │
#     │ σ⁻¹((χ₁⊗ (b⊗c),...,χ₁⊗(b⊗c),...,χₘ⊗(b⊗c),...,χₘ⊗(b⊗c)), (b⊗c))
#     │      └────────────────────┘     └───────────────────┘
#     │             a₁ times                   aₘ times
#     ↓
# (⊕ᵢ aᵢ·χᵢ)⊗(b⊗c)
#     ‖
#  a⊗(b⊗c)
InstallGlobalFunction( SGREPS_Associator_7_Morphism,
  function( SGReps, a, b, c, abc )
    local L, bc, factoring_morphism;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    L := DecompositionIntoSimpleObjects( a );
    
    bc := TensorProductOnObjects( SGReps, b, c );
    
    #⊕ᵢ aᵢ·[ χᵢ⊗(b⊗c) ]  ⥲  (⊕ᵢ aᵢ·χᵢ)⊗(b⊗c) = a⊗(b⊗c)
    factoring_morphism := SGREPS_RightDistributivityFactoringPermutation( SGReps, L, bc, abc );
    
    return factoring_morphism;
    
end );

InstallGlobalFunction( SGREPS_Associator_123_Morphism,
  function( SGReps, a, b, c, abc )
    local morphism_1, morphism_2, morphism_3, morphism_123;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    # (a⊗b)⊗c  ⥲  ⊕ᵢ aᵢ((χᵢ⊗b)⊗c)
    morphism_1 := SGREPS_Associator_1_Morphism( SGReps, a, b, c, abc );
    
    # ⊕ᵢ ɑᵢ((χᵢ⊗b)⊗c)  ⥲  ⊕ᵢ ɑᵢ ⊕ⱼ bⱼ((χᵢ⊗χⱼ)⊗c)
    morphism_2 := SGREPS_Associator_2_Morphism( SGReps, a, b, c, abc );
    
    # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
    morphism_3 := SGREPS_Associator_3_Morphism( SGReps, a, b, c, abc );
    
    morphism_123 := SGREPS_PreComposeListOfMorphismPermutationsWithSameSupport( SGReps, [ morphism_1, morphism_2, morphism_3 ] );
    
    morphism_123 := SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, abc, morphism_123, abc );
    
    return morphism_123;
    
end );

InstallGlobalFunction( SGREPS_Associator_567_Morphism,
  function( SGReps, a, b, c, abc )
    local morphism_5, morphism_6, morphism_7, morphism_567;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]
    morphism_5 := SGREPS_Associator_5_Morphism( SGReps, a, b, c, abc );
    
    # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]  ⥲  ⊕ᵢ ɑᵢ·[ χᵢ⊗(b⊗c) ]
    morphism_6 := SGREPS_Associator_6_Morphism( SGReps, a, b, c, abc );
    
    # ⊕ᵢ aᵢ·[ χᵢ⊗(b⊗c) ]  ⥲  a⊗(b⊗c)
    morphism_7 := SGREPS_Associator_7_Morphism( SGReps, a, b, c, abc );
    
    morphism_567 := SGREPS_PreComposeListOfMorphismPermutationsWithSameSupport( SGReps, [ morphism_5, morphism_6, morphism_7 ] );
    
    morphism_567 := SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, abc, morphism_567, abc );
    
    return morphism_567;
    
end );

