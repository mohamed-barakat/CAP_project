# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

# 1 ≤ i ≤ m = Support(a)
#
#    a⊗b
#     |
#     | σ((χ₁,...,χ₁,...,χₘ,...,χₘ), b)
#     |    └───────┘     └───────┘
#     |    a₁ times      aₘ times
#     ↓
# ⊕ᵢ aᵢ·(χᵢ⊗b)
InstallGlobalFunction( SGREPS_Braiding_1_Morphism,
  function( SGReps, a, b, ab )
    local L_a;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    L_a := DecompositionIntoSimpleObjects( a );
    
    return SGREPS_RightDistributivityExpandingPermutation( SGReps, L_a, b, ab );
    
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
#
#   ⊕ᵢ ɑᵢ·(χᵢ⊗b)
#        |
#        | ⊕ᵢ ɑᵢ·[ σ(χᵢ, (χ₁,...,χ₁,...,χₙ,...,χₙ)) ]
#        |                └───────┘     └───────┘
#        |                b₁ times      bₙ times
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χᵢ⊗χⱼ) ]
InstallGlobalFunction( SGREPS_Braiding_2_Morphism,
  function( SGReps, a, b, ab )
    local a_nr_support, a_support, a_components, L_b, sigmas, a_sigmas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    L_b := DecompositionIntoSimpleObjects( b );
    
    sigmas := List( [ 1 .. a_nr_support ], function( i )
        local xi, xib;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        
        xib := TensorProductOnObjects( SGReps, xi, b );
        
        return SGREPS_LeftDistributivityExpandingPermutation( SGReps, xi, L_b, xib );
        
    end );
    
    # The list of aᵢ-many duplications of σᵢ.
    a_sigmas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> sigmas[i] ) ) );
    
    return SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_sigmas, ab );
    
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
#
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χᵢ⊗χⱼ) ]
#        |
#        | ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·ɣ(χᵢ,χⱼ) ]
#        ↓
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χⱼ⊗χᵢ) ]
InstallGlobalFunction( SGREPS_Braiding_3_Morphism,
  function( SGReps, a, b, ab )
    local a_nr_support, a_support, a_components, b_nr_support, b_support, b_components, b_gammas, ab_gammas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    b_nr_support := NrSupport( b );
    b_support := Support( b );
    b_components := Components( b );
    
    b_gammas := List( [ 1 .. a_nr_support ], function( i )
        local xi, gamma_ij, b_gamma_ij;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        
        gamma_ij := List( [ 1 .. b_nr_support ], function( j )
            local xj;
            
            xj := ObjectConstructor( SGReps, NTuple( 3, 1, [ b_support[j] ], [ 1 ] ) );
            
            return SGREPS_BraidingOnIrreducibles( SGReps, xi, xj );
            
        end );
        
        # The list of bⱼ-many duplications of ɣᵢⱼ.
        b_gamma_ij := Concatenation( List( [ 1 .. b_nr_support ], j ->
            List( [ 1 .. b_components[j] ], k -> gamma_ij[j] ) ) );
        
        return DirectSumFunctorial( SGReps, b_gamma_ij );
        
    end );
    
    # The list of aᵢ-many duplications of [⊕ⱼ bⱼ·ɣᵢⱼ].
    ab_gammas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> b_gammas[i] ) ) );
    
    return DirectSumFunctorial( SGReps, ab_gammas );
        
end );

# 1 ≤ i ≤ m = Support(a)
# 1 ≤ j ≤ n = Support(b)
#
# ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·(χⱼ⊗χᵢ) ]
#        │
#        │ ⊕ᵢ ɑᵢ·[ σ⁻¹((χ₁,...,χ₁,...,χₙ,...,χₙ), χᵢ) ]
#        │              └───────┘     └───────┘
#        │              b₁ times      bₙ times
#        ↓
# ⊕ᵢ ɑᵢ·(b⊗χᵢ)
InstallGlobalFunction( SGREPS_Braiding_4_Morphism,
  function( SGReps, a, b, ab )
    local a_nr_support, a_support, a_components, L_b, sigmas, a_sigmas;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    L_b := DecompositionIntoSimpleObjects( b );
    
    sigmas := List( [ 1 .. a_nr_support ], function( i )
        local xi, bxi;
        
        xi := ObjectConstructor( SGReps, NTuple( 3, 1, [ a_support[i] ], [ 1 ] ) );
        bxi := TensorProductOnObjects( SGReps, b, xi );
        
        return SGREPS_RightDistributivityFactoringPermutation( SGReps, L_b, xi, bxi );
        
    end );
    
    # The list of aᵢ-many duplications of σᵢ.
    a_sigmas := Concatenation( List( [ 1 .. a_nr_support ], i ->
        List( [ 1 .. a_components[i] ], j -> sigmas[i] ) ) );
    
    return SGREPS_DirectSumFunctorialForListOfMorphismPermutations( SGReps, a_sigmas, ab );
    
end );

# 1 ≤ i ≤ m = Support(a)
#
# ⊕ᵢ ɑᵢ·(b⊗χᵢ)
#      │
#      │ σ⁻¹(b, (χ₁,...,χ₁,...,χₘ,...,χₘ))
#      │         └───────┘     └───────┘
#      │         a₁ times      aₘ times
#      ↓
# b⊗(⊕ᵢ ɑᵢ·χᵢ)
#      ‖
#     b⊗a
InstallGlobalFunction( SGREPS_Braiding_5_Morphism,
  function( SGReps, a, b, ab )
    local L_a;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    L_a := DecompositionIntoSimpleObjects( a );
    
    return SGREPS_LeftDistributivityFactoringPermutation( SGReps, b, L_a, ab );
    
end );

InstallGlobalFunction( SGREPS_Braiding_12_Morphism,
  function( SGReps, a, b, ab )
    local morphism_1, morphism_2, morphism_12;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    morphism_1 := SGREPS_Braiding_1_Morphism( SGReps, a, b, ab );
    
    morphism_2 := SGREPS_Braiding_2_Morphism( SGReps, a, b, ab );
    
    morphism_12 := SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, morphism_1, morphism_2 );
    
    return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, ab, morphism_12, ab );
    
end );

InstallGlobalFunction( SGREPS_Braiding_45_Morphism,
  function( SGReps, a, b, ba )
    local morphism_4, morphism_5, morphism_45;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    morphism_4 := SGREPS_Braiding_4_Morphism( SGReps, a, b, ba );
    
    morphism_5 := SGREPS_Braiding_5_Morphism( SGReps, a, b, ba );
    
    morphism_45 := SGREPS_PreComposeMorphismPermutationsWithSameSupport( SGReps, morphism_4, morphism_5 );
    
    return SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices( SGReps, ba, morphism_45, ba );
    
end );

InstallGlobalFunction( SGREPS_BraidingOnIrreducibles,
  function( SGReps, xi, xj )
    local xixj, unit, DS, Rows, splitting_field, xixj_nr_support, xixj_support, xixj_components, exterior_power, components;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    xixj := TensorProductOnObjects( SGReps, xi, xj );
    
    unit := TensorUnit( SGReps );
    
    if IsEqualForObjects( SGReps, unit, xi ) or
       IsEqualForObjects( SGReps, unit, xj ) then
        
        return IdentityMorphism( SGReps, xixj );
        
    elif not IsEqualForObjects( SGReps, xi, xj ) then
        
        # Case xᵢ ≠ xⱼ: Sebastian's PhD. thesis construction I.3.42.
        
        # ɣ(xᵢ,xⱼ) = id
        return IdentityMorphism( SGReps, xixj );
        
    else
        
        # Case xᵢ = xⱼ: Sebastian's PhD. thesis Theorem I.3.44.
        
        DS := ModelingCategory( SGReps );
        Rows := UnderlyingAdditiveCategory( DS );
        
        splitting_field := UnderlyingSplittingField( SGReps );
        
        xixj_nr_support := NrSupport( xixj );
        xixj_support := Support( xixj );
        xixj_components := Components( xixj );
        
        exterior_power := SecondExteriorPowerOfSimpleObject( SGReps, xi );
        
        components := List( [ 1 .. xixj_nr_support ], function( i )
            local nr_minus_1, nr_1, diagonal;
            
            nr_minus_1 := Component( exterior_power, xixj_support[i] );
            
            nr_1 := xixj_components[i] - nr_minus_1;
            
            diagonal := Concatenation( List( [ 1 .. nr_1 ], i -> 1 ), List( [ 1 .. nr_minus_1 ], i -> -1 ) );
            
            return HomalgDiagonalMatrix( diagonal, splitting_field );
            
        end );
        
        return MorphismConstructor( SGReps, xixj, NTuple( 3, xixj_nr_support, xixj_support, components ), xixj );
        
    fi;
    
end );

