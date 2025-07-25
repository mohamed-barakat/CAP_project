# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

# Sebastian's PhD. thesis Lemma I.3.54 and Construction I.3.55.
# Note: there are typos with the duals, they have to be swapped.
# 
# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ m = Support(a)
# 
# 1·χᵤ → a⊗aᵛ = (⨁ᵢ aᵢχᵢ)⊗(⨁ⱼ aⱼχⱼ)ᵛ
# 
# 
# Since the unit is 1 = 1·χᵤ in SGReps, we only
# need to care about the matrix at the support
# of the trivial character.
# All other matrices will be a 0x? matrix.
# 
# In the first morphism box, Rows( Diag(...) ) translates
# categorically into UniversalMorphismIntoDirectSum(...)
# where one needs to keep track of the zeros which the Diag
# introduces. Our code does this implicitly by using
# the coevaluations for duals in the category of rows.
InstallGlobalFunction( SGREPS_CoevaluationForDual_1_Morphism,
  function( SGReps, unit, a, aav )
    local DS, Rows, unit_support, unit_character_nr, unit_rows, a_nr_support, a_support, a_components, aav_nr_support, aav_support, aav_components, diagonal, coevalutions, diagonal_sum, morphism_unit, morphisms, matrices, morphism;
    
    #% TODO CAP_JIT_RESOLVE_FUNCTION
    
    DS := ModelingCategory( SGReps );
    Rows := UnderlyingAdditiveCategory( DS );
    
    unit_support := Support( unit );
    unit_character_nr := unit_support[1];
    
    unit_rows := TensorUnit( Rows );
    
    # a = (⨁ᵢ aᵢχᵢ)
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := List( [ 1 .. a_nr_support ], i ->
        ObjectConstructor( Rows, Components( a )[i] ) );
        
    # a⊗aᵛ = (⨁ᵢ aᵢχᵢ)⊗(⨁ⱼ aⱼχⱼ)ᵛ
    aav_nr_support := NrSupport( aav );
    aav_support := Support( aav );
    aav_components := List( [ 1 .. aav_nr_support ], i ->
        ObjectConstructor( Rows, Components( aav )[i] ) );
        
    # [ a₁⊗a₁ᵛ, ..., aₘ⊗aₘᵛ ]
    diagonal := List( [ 1 .. a_nr_support ], i ->
        TensorProductOnObjects( Rows, a_components[i], DualOnObjects( Rows, a_components[i] ) ) );
        
    # coev_aᵢ: 1 → aᵢ⊗aᵢᵛ = aᵢ·aᵢ
    coevalutions := List( [ 1 .. a_nr_support ], i ->
        CoevaluationForDualWithGivenTensorProduct( Rows, unit_rows, a_components[i], diagonal[i] ) );
        
    # The sum (⨁ᵢ aᵢ⊗aᵢᵛ) = (𝚺ᵢ aᵢ·aᵢ) is the coefficient of the trivial character χᵤ in a⊗aᵛ:
    # 
    # ⟨a⊗aᵛ,χᵤ⟩ = ⟨⨁ᵢ⨁ⱼ aᵢχᵢ⊗aⱼχⱼᵛ,χᵤ⟩
    #           = 𝚺ᵢ𝚺ⱼ aᵢ·aⱼ·⟨χᵢ⊗χⱼᵛ,χᵤ⟩
    #           = 𝚺ᵢ𝚺ⱼ aᵢ·aⱼ·⟨χᵢ,χⱼ⟩
    #           = 𝚺ᵢ aᵢ·aᵢ
    diagonal_sum := aav_components[ unit_character_nr ];
    
    #                  1
    #                 ╱⏐╲
    #                ╱ ⏐ ╲
    #               ╱  ⏐  ╲
    #              ╱   ⏐   ╲
    #         coev_a₁ ... coev_aₘ
    #            ╱     ⏐     ╲
    #           ╱      ⏐      ╲
    #          ╱       ⏐       ╲
    #         ↓        ↓        ↓
    #       a₁⊗a₁ᵛ    ...     aₘ⊗aₘᵛ
    #         ‖        ‖        ‖
    #       a₁·a₁     ...     aₘ·aₘ
    # 
    morphism_unit := UniversalMorphismIntoDirectSumWithGivenDirectSum( Rows,
                            diagonal,
                            unit_rows,
                            coevalutions,
                            diagonal_sum );
                            
    # Construct zero morphisms for all supported components of a⊗aᵛ.
    morphisms := List( [ 1 .. aav_nr_support ], i ->
        ZeroMorphism( Rows, ZeroObject( Rows ), aav_components[i] ) );
        
    # Replace the zero morphism at component χᵤ.
    # χᵤ is guaranteed to exist in a⊗aᵛ (see the above computation).
    morphisms[ SafeUniquePosition( aav_support, unit_character_nr ) ] := morphism_unit;
    
    matrices := List( [ 1 .. aav_nr_support ], i -> UnderlyingMatrix( morphisms[i] ) );
    
    morphism := MorphismConstructor( SGReps,
                                     unit,
                                     NTuple( 3, aav_nr_support, aav_support, matrices ),
                                     aav );
                                     
    return morphism;
    
end );

# 1 ≤ i ≤ m = Support(a)
#
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢ⊗χⱼᵛ) ]
#        │
#        │ ⊕ᵢ ɑᵢ·[ σ⁻¹(χᵢ, (χ₁ᵛ,...,χ₁ᵛ,...,χₘᵛ,...,χₘᵛ)) ]
#        │                  └─────────┘     └─────────┘
#        │                   a₁ times        aₘ times
#        ↓
#   ⊕ᵢ ɑᵢ·(χᵢ⊗aᵛ)
InstallGlobalFunction( SGREPS_CoevaluationForDual_2_Morphism,
  function( SGReps, a, aav )
    local a_nr_support, a_support, a_components, av, L_av, sigmas, a_sigmas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    av := DualOnObjects( SGReps, a );
    
    L_av := DecompositionIntoSimpleObjects( av );
    
    sigmas := List( [ 1 .. a_nr_support ], function( i )
        local xi, xiav;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        xiav := TensorProductOnObjects( SGReps, xi, av );
        
        return SGREPS_LeftDistributivityFactoringPermutation( SGReps, xi, L_av, xiav );
        
    end );
    
    # The list of aᵢ-many duplications of σᵢ.
    a_sigmas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> sigmas[i] ) ) );
    
    return SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_sigmas, aav );
    
end );

# 1 ≤ i ≤ m = Support(a)
#
# ⊕ᵢ ɑᵢ·(χᵢ⊗aᵛ)
#     │
#     │ σ⁻¹((χ₁,...,χ₁,...,χₘ,...,χₘ), aᵛ)
#     │      └───────┘     └───────┘
#     │      a₁ times      aₘ times
#     ↓
# (⊕ᵢ ɑᵢ·χᵢ)⊗aᵛ
#     ‖
#    a⊗aᵛ
InstallGlobalFunction( SGREPS_CoevaluationForDual_3_Morphism,
  function( SGReps, a, aav )
    local L_a, av;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    L_a := DecompositionIntoSimpleObjects( a );
    
    av := DualOnObjects( SGReps, a );
    
    return SGREPS_RightDistributivityFactoringPermutation( SGReps, L_a, av, aav );
    
end );

InstallGlobalFunction( SGREPS_CoevaluationForDual_23_Morphism,
  function( SGReps, a, aav )
    local morphism_2, morphism_3, morphism_23;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    morphism_2 := SGREPS_CoevaluationForDual_2_Morphism( SGReps, a, aav );
    
    morphism_3 := SGREPS_CoevaluationForDual_3_Morphism( SGReps, a, aav );
    
    morphism_23 := SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, morphism_2, morphism_3 );
    
    return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, aav, morphism_23, aav );
    
end );

# 1 ≤ i ≤ m = Support(a)
#
#    aᵛ⊗a
#      ‖
# aᵛ⊗(⊕ᵢ ɑᵢ·χᵢ)
#      │
#      │ σ(aᵛ, (χ₁,...,χ₁,...,χₘ,...,χₘ))
#      │        └───────┘     └───────┘
#      │        a₁ times      aₘ times
#      ↓
# ⊕ᵢ ɑᵢ·(aᵛ⊗χᵢ)
InstallGlobalFunction( SGREPS_EvaluationForDual_1_Morphism,
  function( SGReps, a, ava )
    local L_a, av;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    av := DualOnObjects( SGReps, a );
    
    L_a := DecompositionIntoSimpleObjects( a );
    
    return SGREPS_LeftDistributivityExpandingPermutation( SGReps, av, L_a, ava );
    
end );

# 1 ≤ i ≤ m = Support(a)
#
# (⊕ᵢ ɑᵢ·(aᵛ⊗χᵢ))
#        │
#        │ ⊕ᵢ ɑᵢ·[ σ((χ₁ᵛ,...,χ₁ᵛ,...,χₘᵛ,...,χₘᵛ), χᵢ) ]
#        │            └─────────┘     └─────────┘
#        │             a₁ times        aₘ times
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢᵛ⊗χⱼ) ]
InstallGlobalFunction( SGREPS_EvaluationForDual_2_Morphism,
  function( SGReps, a, ava )
    local a_nr_support, a_support, a_components, av, L_av, sigmas, a_sigmas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    av := DualOnObjects( SGReps, a );
    
    L_av := DecompositionIntoSimpleObjects( av );
    
    sigmas := List( [ 1 .. a_nr_support ], function( i )
        local xi, avxi;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        avxi := TensorProductOnObjects( SGReps, av, xi );
        
        return SGREPS_RightDistributivityExpandingPermutation( SGReps, L_av, xi, avxi );
        
    end );
    
    # The list of aᵢ-many duplications of σᵢ.
    a_sigmas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> sigmas[i] ) ) );
    
    return SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_sigmas, ava );
    
end );

# Sebastian's PhD. thesis Lemma I.3.54 and Construction I.3.55.
# Note: there are typos with the duals, they have to be swapped.
# 
# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ m = Support(a)
# 
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ aⱼ·(χᵢᵛ⊗χⱼ) ] → 1·χᵤ
# 
# 
# Since the unit is 1 = 1·χᵤ in SGReps, we only
# need to care about the matrix at the support
# of the trivial character.
# All other matrices will be of dimensions 0x?.
# 
# In the first morphism box, Cols( Diag(...) ) translates
# categorically into UniversalMorphismFromDirectSum(...)
# where one needs to keep track of the zeros which the Diag
# introduces. Our code does this implicitly by using
# the evaluations for duals in the category of rows.
InstallGlobalFunction( SGREPS_EvaluationForDual_3_Morphism,
  function( SGReps, ava, a, unit )
    local DS, Rows, unit_support, unit_character_nr, unit_rows, a_nr_support, a_support, a_components, ava_nr_support, ava_support, ava_components, diagonal, coevalutions, diagonal_sum, morphism_unit, morphisms, matrices, morphism;
    
    #% TODO CAP_JIT_RESOLVE_FUNCTION
    
    DS := ModelingCategory( SGReps );
    Rows := UnderlyingAdditiveCategory( DS );
    
    unit_support := Support( unit );
    unit_character_nr := unit_support[1];
    
    unit_rows := TensorUnit( Rows );
    
    # a = (⨁ᵢ aᵢχᵢ)
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := List( [ 1 .. a_nr_support ], i ->
        ObjectConstructor( Rows, Components( a )[i] ) );
        
    # aᵛ⊗a = (⨁ᵢ aᵢχᵢ)ᵛ⊗(⨁ⱼ aⱼχⱼ)
    ava_nr_support := NrSupport( ava );
    ava_support := Support( ava );
    ava_components := List( [ 1 .. ava_nr_support ], i ->
        ObjectConstructor( Rows, Components( ava )[i] ) );
        
    # [ a₁ᵛ⊗a₁, ..., aₘᵛ⊗aₘ ]
    diagonal := List( [ 1 .. a_nr_support ], i ->
        TensorProductOnObjects( Rows, DualOnObjects( Rows, a_components[i] ), a_components[i] ) );
        
    # ev_aᵢ: aᵢ·aᵢ = aᵢ⊗aᵢᵛ → 1
    coevalutions := List( [ 1 .. a_nr_support ], i ->
        EvaluationForDualWithGivenTensorProduct( Rows, diagonal[i], a_components[i], unit_rows ) );
        
    # The sum (⨁ᵢ aᵢᵛ⊗aᵢ) = (𝚺ᵢ aᵢ·aᵢ) is the coefficient of the trivial character χᵤ in aᵛ⊗a:
    # 
    # ⟨aᵛ⊗a,χᵤ⟩ = ⟨⨁ᵢ⨁ⱼ aᵢχᵢᵛ⊗aⱼχⱼ,χᵤ⟩
    #           = 𝚺ᵢ𝚺ⱼ aᵢ·aⱼ·⟨χᵢᵛ⊗χⱼ,χᵤ⟩
    #           = 𝚺ᵢ𝚺ⱼ aᵢ·aⱼ·⟨χᵢ,χⱼ⟩
    #           = 𝚺ᵢ aᵢ·aᵢ
    diagonal_sum := ava_components[ unit_character_nr ];
    
    #                  1
    #                 ↗↑↖
    #                ╱ ⏐ ╲
    #               ╱  ⏐  ╲
    #              ╱   ⏐   ╲
    #           ev_a₁ ... ev_aₘ
    #            ╱     ⏐     ╲
    #           ╱      ⏐      ╲
    #          ╱       ⏐       ╲
    #      a₁ᵛ⊗a₁     ...    aₘᵛ⊗aₘ
    #         ‖        ‖        ‖
    #       a₁·a₁     ...     aₘ·aₘ
    # 
    morphism_unit := UniversalMorphismFromDirectSumWithGivenDirectSum( Rows,
                            diagonal,
                            unit_rows,
                            coevalutions,
                            diagonal_sum );
                            
    # Construct zero morphisms for all supported components of aᵛ⊗a.
    morphisms := List( [ 1 .. ava_nr_support ], i ->
        ZeroMorphism( Rows, ava_components[i], ZeroObject( Rows ) ) );
        
    # Replace the zero morphism at component χᵤ.
    # χᵤ is guaranteed to exist in a⊗aᵛ (see the above computation).
    morphisms[ SafeUniquePosition( ava_support, unit_character_nr ) ] := morphism_unit;
    
    matrices := List( [ 1 .. ava_nr_support ], i -> UnderlyingMatrix( morphisms[i] ) );
    
    morphism := MorphismConstructor( SGReps,
                                     ava,
                                     NTuple( 3, ava_nr_support, ava_support, matrices ),
                                     unit );
                                     
    return morphism;
    
end );

InstallGlobalFunction( SGREPS_EvaluationForDual_12_Morphism,
  function( SGReps, ava, a )
    local morphism_1, morphism_2, morphism_12;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    morphism_1 := SGREPS_EvaluationForDual_1_Morphism( SGReps, a, ava );
    
    morphism_2 := SGREPS_EvaluationForDual_2_Morphism( SGReps, a, ava );
    
    morphism_12 := SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, morphism_1, morphism_2 );
    
    return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, ava, morphism_12, ava );
    
end );

