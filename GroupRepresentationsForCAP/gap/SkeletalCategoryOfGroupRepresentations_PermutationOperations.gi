# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

InstallGlobalFunction( SGREPS_PreComposeListOfMorphismPermutationsWithSameSupport,
  function( SGReps, morphisms )
    local nr_morphisms, nr_support, compositions;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    nr_morphisms := Length( morphisms );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, nr_morphisms >= 2 );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, ForAll( [ 1 .. nr_morphisms-1 ], i ->
        morphisms[i][1] = morphisms[i+1][1] and
        morphisms[i][2] = morphisms[i+1][2] ) );
    
    # All morphisms have the same support.
    nr_support := morphisms[1][1];
    
    compositions := List( [ 1 .. nr_support ], function( i )
        local perms, composition;
        
        #  From the j'th morphism we take the i'th permutation.
        perms := List( [ 1 .. nr_morphisms ], j -> PermList( morphisms[j][3][i] ) );
        
        # The composition πₙ·π₂·...·π₁ corresponds to the permutation-matrix product P₁·P₂·...·Pₙ.
        composition := Iterated( Reversed( perms ), \* );
        
        # For a given support, all permutations have the same length.
        # So we can use the lengths of permutations of the first morphism.
        composition := ListPerm( composition, Length( morphisms[1][3][i] ) );
        
        return composition;
        
    end );
    
    return NTuple( 3, nr_support, morphisms[1][2], compositions );
    
end );

InstallGlobalFunction( SGREPS_PreComposeMorphismPermutationsWithSameSupport,
  function( SGReps, alpha, beta )
    local nr_support, alpha_permutations, beta_permutations, compositions;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, alpha[1] = beta[1] and alpha[2] = beta[2] );
    
    nr_support := alpha[1];
    
    alpha_permutations := alpha[3];
    beta_permutations := beta[3];
    
    compositions := List( [ 1 .. nr_support ], function( i )
        local pi_2, pi_1, composition;
        
        pi_1 := PermList( alpha_permutations[i] );
        pi_2 := PermList( beta_permutations[i] );
        
        # The composition π₂·π₁ corresponds to the permutation-matrix product P₁·P₂,
        # which is what we need for the morphisms.
        composition := ListPerm( pi_2 * pi_1, Length( alpha_permutations[i] ) );
        
        return composition;
        
    end );
    
    return NTuple( 3, nr_support, alpha[2], compositions );
    
end );

InstallGlobalFunction( SGREPS_FunctorFromMorphismPermutationsToMorphismMatrices,
  function( SGReps, source, morphism, target )
    local splitting_field, nr_support, support, permutations, matrices;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    splitting_field := UnderlyingSplittingField( SGReps );
    
    nr_support := morphism[1];
    support := morphism[2];
    permutations := morphism[3];
    
    matrices := List( [ 1 .. nr_support ], function( i )
        local dim, homalg_matrix;
        
        # Could be replaced by Length( permutations[i] ), but this gives a correctness check.
        dim := Component( source, support[i] );
        
        return CertainColumns( HomalgIdentityMatrix( dim, splitting_field ), permutations[i] );
        
    end );
    
    # Error( "\033[31mDEBUGPRINT[47]\033[0m" );
    return MorphismConstructor( SGReps, source, NTuple( 3, nr_support, support, matrices ), target );
    
end );

InstallGlobalFunction( SGREPS_FunctorFromInverseMorphismPermutationsToMorphismMatrices,
  function( SGReps, source, morphism, target )
    local splitting_field, nr_support, support, permutations, matrices;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    splitting_field := UnderlyingSplittingField( SGReps );
    
    nr_support := morphism[1];
    support := morphism[2];
    permutations := morphism[3];
    
    matrices := List( [ 1 .. nr_support ], function( i )
        local dim, homalg_matrix;
        
        # Could be replaced by Length( permutations[i] ), but this gives a correctness check.
        dim := Component( source, support[i] );
        
        # By using CertainRows we construct the transposed matrix,
        # which is the inverse matrix of the original permutation.
        return CertainRows( HomalgIdentityMatrix( dim, splitting_field ), permutations[i] );
        
    end );
    
    # Error( "\033[31mDEBUGPRINT[47]\033[0m" );
    return MorphismConstructor( SGReps, source, NTuple( 3, nr_support, support, matrices ), target );
    
end );

InstallGlobalFunction( SGREPS_RightDistributivityExpandingPermutation,
  function( SGReps, L, a, L_tensor_a )
    local characters, L_length, L_sum, L_sum_nr_support, L_sum_support, a_nr_support, a_support, a_components, L_tensor_a_nr_support, L_tensor_a_support, permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    characters := UnderlyingIrreducibleCharacters( SGReps );
    
    L_length := Length( L );
    
    L_sum := DirectSum( SGReps, L );
    L_sum_nr_support := NrSupport( L_sum );
    L_sum_support := Support( L_sum );
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    L_tensor_a_nr_support := NrSupport( L_tensor_a );
    L_tensor_a_support := Support( L_tensor_a );
    
    # Error( "\033[31mDEBUGPRINT[11]\033[0m" );
    
    permutations := List( [ 1 .. L_tensor_a_nr_support ], function( k )
        local a_times_nk, rows, k_permutation;
        
        a_times_nk :=
            List( [ 1 .. L_sum_nr_support ], i ->
                List( [ 1 .. a_nr_support ], function( j )
                    local x_i, x_j, x_k;
                    
                    x_i := characters[ L_sum_support[i] ];
                    x_j := characters[ a_support[j] ];
                    x_k := characters[ L_tensor_a_support[k] ];
                    
                    return a_components[j] * ScalarProduct( x_k, x_i * x_j );
                    
                end ) );
                
        rows :=
            List( [ 1 .. L_sum_nr_support ], i ->
                List( [ 1 .. a_nr_support ], j ->
                    Component( L_sum, L_sum_support[i] ) * a_times_nk[i][j] ) );
                    
        k_permutation := Concatenation( List( [ 1 .. L_length ], function( l )
            local L_l;
            
            L_l := L[l];
            
            return Concatenation( List( [ 1 .. L_sum_nr_support ], function( i )
                local L_sum_support_i, x_i, multiplicity_li, sum_up_to_l_minus_1, multiplicity_directsum_i;
                
                L_sum_support_i := L_sum_support[i];
                
                multiplicity_li := Component( L_l, L_sum_support_i );
                
                sum_up_to_l_minus_1 :=
                    Sum( List( [ 1 .. l - 1 ], m -> Component( L[m], L_sum_support_i ) ) );
                
                return Concatenation( List( [ 1 .. a_nr_support ], function( j )
                    local x_j, a_j_times_n_ijk, height_of_zeros, cols, step, previous_height, prefix_sum_of_rows, result;
                    
                    a_j_times_n_ijk := a_times_nk[i][j];
                    
                    cols := multiplicity_li * a_j_times_n_ijk;
                    
                    height_of_zeros := sum_up_to_l_minus_1 * a_j_times_n_ijk;
                    
                    prefix_sum_of_rows := Sum( Concatenation( rows{[ 1 .. i-1 ]} ) ) + Sum( rows[i]{[ 1 .. j-1 ]} );
                    
                    result := List( [ 1 .. cols ], m -> prefix_sum_of_rows + height_of_zeros + m );
                    
                    # if k = 1 then
                    #
                    #     Print( "k:" );
                    #     Display( k );
                    #
                    #     Print( "l:" );
                    #     Display( l );
                    #
                    #     Print( "i:" );
                    #     Display( i );
                    #
                    #     Print( "j:" );
                    #     Display( j );
                    #
                    #     Print( "a_j_times_n_ijk:" );
                    #     Display( a_j_times_n_ijk );
                    #
                    #     Print( "cols:" );
                    #     Display( cols );
                    #
                    #     Print( "rows:" );
                    #     Display( rows );
                    #
                        # Print( "height_of_zeros:" );
                        # Display( height_of_zeros );
                    #
                        # Print( "previous_height:" );
                        # Display( previous_height );
                        
                        # Print( "prefix_sum_of_rows:" );
                        # Display( prefix_sum_of_rows );
                        
                    #
                    #     Print( "height:" );
                    #     Display( height );
                    #
                        # Print( "result:" );
                        # Display( result );
                    #
                    # fi;
                    
                    return result;
                    
                end ) );
                
            end ) );
            
        end ) );
        
        # Print( "k: " );
        # Display( k );
        #
        # Print( "k_permutation:" );
        # Display( k_permutation );
        
        return k_permutation;
        
    end );
    
    return NTuple( 3, L_tensor_a_nr_support, L_tensor_a_support, permutations );
    
end );

InstallGlobalFunction( SGREPS_RightDistributivityFactoringPermutation,
  function( SGReps, L, a, L_tensor_a )
    local expanding_morphism,  nr_support, support, permutations, factoring_permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    expanding_morphism := SGREPS_RightDistributivityExpandingPermutation( SGReps, L, a, L_tensor_a );
    
    nr_support := expanding_morphism[1];
    support := expanding_morphism[2];
    permutations := expanding_morphism[3];
    
    # Invert all the permutations.
    factoring_permutations := List( [ 1 .. nr_support ], i ->
        ListPerm( PermList( permutations[i] )^(-1), Length( permutations[i] ) ) );
        
    return NTuple( 3, nr_support, support, factoring_permutations );
    
end );

InstallGlobalFunction( SGREPS_LeftDistributivityExpandingPermutation,
  function( SGReps, a, L, a_tensor_L )
    local characters, L_length, L_sum, L_sum_nr_support, L_sum_support, a_nr_support, a_support, a_components, a_tensor_L_nr_support, a_tensor_L_support, permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    characters := UnderlyingIrreducibleCharacters( SGReps );
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    L_length := Length( L );
    L_sum := DirectSum( SGReps, L );
    L_sum_nr_support := NrSupport( L_sum );
    L_sum_support := Support( L_sum );
    
    a_tensor_L_nr_support := NrSupport( a_tensor_L );
    a_tensor_L_support := Support( a_tensor_L );
    
    permutations := List( [ 1 .. a_tensor_L_nr_support ], function( k )
        local n_k, rows;
        
        n_k :=
            List( [ 1 .. a_nr_support ], i ->
                List( [ 1 .. L_sum_nr_support ], function( j )
                    local x_i, x_j, x_k;
                    
                    x_i := characters[ a_support[i] ];
                    x_j := characters[ L_sum_support[j] ];
                    x_k := characters[ a_tensor_L_support[k] ];
                    
                    return ScalarProduct( x_k, x_i * x_j );
                    
                end ) );
                
        rows :=
            List( [ 1 .. a_nr_support ], i ->
                List( [ 1 .. L_sum_nr_support ], j ->
                    a_components[i] * Component( L_sum, L_sum_support[j] ) * n_k[i][j] ) );
                    
        return Concatenation( List( [ 1 .. L_length ], function( l )
            local L_l;
            
            L_l := L[l];
            
            return Concatenation( List( [ 1 .. a_nr_support ], function( i )
                
                return Concatenation( List( [ 1 .. L_sum_nr_support ], function( j )
                    local l_times_j, L_sum_j, n_ijk, zeros_above, ones, step, prefix_sum_of_rows, block_indices;
                    
                    l_times_j := Component( L_l, L_sum_support[j] );
                    L_sum_j := Component( L_sum, L_sum_support[j] );
                    n_ijk := n_k[i][j];
                    
                    zeros_above := Sum( List( [ 1 .. l - 1 ], m -> Component( L[m], L_sum_support[j] ) ) ) * n_ijk;
                    ones := l_times_j * n_ijk;
                    
                    step := L_sum_j * n_ijk;
                    
                    prefix_sum_of_rows := Sum( Concatenation( rows{[ 1 .. i-1 ]} ) ) + Sum( rows[i]{[ 1 .. j-1 ]} );
                    
                    block_indices :=
                        Concatenation( List( [ 1 .. a_components[i] ], m ->
                            List( [ 1 .. ones ], n ->
                                prefix_sum_of_rows + (m-1)*step + zeros_above + n ) ) );
                    
                    return block_indices;
                    
                end ) );
                
            end ) );
            
        end ) );
            
    end );
    
    return NTuple( 3, a_tensor_L_nr_support, a_tensor_L_support, permutations );
    
end );

InstallGlobalFunction( SGREPS_LeftDistributivityFactoringPermutation,
  function( SGReps, a, L, a_tensor_L )
    local expanding_morphism,  nr_support, support, permutations, factoring_permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    expanding_morphism := SGREPS_LeftDistributivityExpandingPermutation( SGReps, a, L, a_tensor_L );
    
    nr_support := expanding_morphism[1];
    support := expanding_morphism[2];
    permutations := expanding_morphism[3];
    
    # Invert all the permutations.
    factoring_permutations := List( [ 1 .. nr_support ], i ->
        ListPerm( PermList( permutations[i] )^(-1), Length( permutations[i] ) ) );
        
    return NTuple( 3, nr_support, support, factoring_permutations );
    
end );

## The components of morphism are not given by a list of matrices, but by a list of permutations.
InstallGlobalFunction( SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromRight,
  function( SGReps, morphism, a, tensor_product )
    local characters, morphism_nr_support, morphism_support, morphism_permutations, a_nr_support, a_support, a_components, tensor_product_nr_support, tensor_product_support, permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    characters := UnderlyingIrreducibleCharacters( SGReps );
    
    morphism_nr_support := morphism[1];
    morphism_support := morphism[2];
    morphism_permutations := morphism[3];
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    tensor_product_nr_support := NrSupport( tensor_product );
    tensor_product_support := Support( tensor_product );
    
    permutations := List( [ 1 .. tensor_product_nr_support ], function( k )
        local n_k, rows;
        
        n_k :=
            List( [ 1 .. morphism_nr_support ], i ->
                List( [ 1 .. a_nr_support ], function( j )
                    local x_i, x_j, x_k;
                    
                    x_i := characters[ morphism_support[i] ];
                    x_j := characters[ a_support[j] ];
                    x_k := characters[ tensor_product_support[k] ];
                    
                    return ScalarProduct( x_k, x_i  * x_j );
                    
                end ) );
                
        rows :=
            List( [ 1 .. morphism_nr_support ], i ->
                List( [ 1 .. a_nr_support ], j ->
                    n_k[i][j] * a_components[j] * Length( morphism_permutations[i] ) ) );
                    
        return Concatenation( List( [ 1 .. morphism_nr_support ], function( i )
            return Concatenation( List( [ 1 .. a_nr_support ], function( j )
                local n_ijk, list, prefix_sum_of_rows;
                
                n_ijk := n_k[i][j];
                
                # if n_ijk > 0 then
                
                list := SGREPS_KroneckerProductOfPermutationWithIdentityFromRight( SGReps, morphism_permutations[i], a_components[j] * n_ijk );
                
                prefix_sum_of_rows := Sum( Concatenation( rows{[ 1 .. i-1 ]} ) ) + Sum( rows[i]{[ 1 .. j-1 ]} );
                
                return List( list, l -> l + prefix_sum_of_rows );
                
                # fi;
                
            end ) );
            
        end ) );
        
    end );
    
    return NTuple( 3, tensor_product_nr_support, tensor_product_support, permutations );
    
end );

## The components of morphism are not given by a list of matrices, but by a list of permutations.
InstallGlobalFunction( SGREPS_TensorProductOfMorphismPermutationsWithIdentityMorphismFromLeft,
  function( SGReps, a, morphism, tensor_product )
    local characters, morphism_nr_support, morphism_support, morphism_permutations, a_nr_support, a_support, a_components, tensor_product_nr_support, tensor_product_support, permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    characters := UnderlyingIrreducibleCharacters( SGReps );
    
    morphism_nr_support := morphism[1];
    morphism_support := morphism[2];
    morphism_permutations := morphism[3];
    
    a_nr_support := NrSupport( a );
    a_support := Support( a );
    a_components := Components( a );
    
    tensor_product_nr_support := NrSupport( tensor_product );
    tensor_product_support := Support( tensor_product );
    
    permutations := List( [ 1 .. tensor_product_nr_support ], function( k )
        local n_k, rows;
        
        n_k :=
            List( [ 1 .. a_nr_support ], i ->
                List( [ 1 .. morphism_nr_support ], function( j )
                    local x_i, x_j, x_k;
                    
                    x_i := characters[ a_support[i] ];
                    x_j := characters[ morphism_support[j] ];
                    x_k := characters[ tensor_product_support[k] ];
                    
                    return ScalarProduct( x_k, x_i * x_j );
                    
                end ) );
                
        rows :=
            List( [ 1 .. a_nr_support ], i ->
                List( [ 1 .. morphism_nr_support ], j ->
                    n_k[i][j] * a_components[i] * Length( morphism_permutations[j] ) ) );
                    
        return Concatenation( List( [ 1 .. a_nr_support ], function( i )
            return Concatenation( List( [ 1 .. morphism_nr_support ], function( j )
                local n_ijk, list, prefix_sum_of_rows;
                
                n_ijk := n_k[i][j];
                
                # if n_ijk > 0 then
                
                list := SGREPS_KroneckerProductOfPermutationWithIdentityFromRight( SGReps, morphism_permutations[j], n_ijk );
                
                list := SGREPS_KroneckerProductOfPermutationWithIdentityFromLeft( SGReps, list, a_components[1] );
                
                prefix_sum_of_rows := Sum( Concatenation( rows{[ 1 .. i-1 ]} ) ) + Sum( rows[i]{[ 1 .. j-1 ]} );
                
                return List( list, l -> l + prefix_sum_of_rows );
                
                # fi;
                
            end ) );
            
        end ) );
        
    end );
    
    return NTuple( 3, tensor_product_nr_support, tensor_product_support, permutations );
    
end );

##
InstallGlobalFunction( SGREPS_KroneckerProductOfPermutationWithIdentityFromRight,
  function( SGReps, permutation, b )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    return Concatenation( List( permutation, p -> List( [ 1 .. b ], i -> (p - 1) * b + i ) ) );
    
end );

##
InstallGlobalFunction( SGREPS_KroneckerProductOfPermutationWithIdentityFromLeft,
  function( SGReps, permutation, b )
    local length;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    length := Length( permutation );
    
    return Concatenation( List( [ 0 .. b - 1 ], i -> List( permutation, p -> p + i * length ) ) );
    
end );

##
InstallGlobalFunction( SGREPS_DirectSumFunctorialForListOfMorphismPermutations,
  function( SGReps, L, direct_sum )
    local L_length, sum_nr_support, sum_support, sum_permutations;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    
    L_length := Length( L );
    
    sum_nr_support := NrSupport( direct_sum );
    sum_support := Support( direct_sum );
    
    sum_permutations := List( [ 1 .. sum_nr_support ], function( k )
        local rows;
        
        rows := List( [ 1 .. L_length ], function( i )
            local support, permutations;
            
            support := L[i][2];
            permutations := L[i][3];
            
            # The following is: Length( Component( L[i], sum_support[k] ) );
            return [ 0, Length( Concatenation( permutations{ Positions( support, sum_support[k] ) } ) ) ][ BooleanToInteger( sum_support[k] in support ) + 1 ];
            
        end );
            
        # Error( "\033[31mDEBUGPRINT[rows]\033[0m" );
        
        return Concatenation( List( [ 1 .. L_length ], function( i )
            local support, permutations, permutation, height;
            
            support := L[i][2];
            permutations := L[i][3];
            
            # The following is: Component( L[i], sum_support[k] );
            permutation := [ CapJitTypedExpression( [], { } -> CapJitDataTypeOfListOf( IsBigInt ) ), Concatenation( permutations{ Positions( support, sum_support[k] ) } ) ][ BooleanToInteger( sum_support[k] in support ) + 1 ];
            
            height := Sum( rows{[ 1 .. i-1 ]} );
            
            return List( permutation, i -> i + height );
            
        end ) );
        
    end );
    
    return NTuple( 3, sum_nr_support, sum_support, sum_permutations );
    
end );

