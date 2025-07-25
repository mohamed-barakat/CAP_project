# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

right_distributivity_expanding_permutation := FunctionWithCache(
    function( object_b, list_of_objects, direct_sum, support_tensor_product, is_expanded )
      local permutation_list, k_permutation, size_support, size_list_of_objects, height, l, i, k, direct_sum_support,
            multiplicity_li, sum_up_to_l_minus_1, j, b_j_times_c_kij, cols, rows, height_of_zeros, object_b_list,
            multiplicity_directsum_i;
      
      if not is_expanded then
          
          list_of_objects := CAP_INTERNAL_ExpandSemisimpleCategoryObjectList( list_of_objects );
          
      fi;
      
      # Error( "\033[31mDEBUGPRINT[10]\033[0m" );
      
      permutation_list := [ ];
      size_list_of_objects := Size( list_of_objects );
      object_b_list := SemisimpleCategoryObjectList( object_b );
      direct_sum_support := Support( direct_sum );
      
      for k in support_tensor_product do
          
          k_permutation := [ ];
          
          for l in [ 1 .. size_list_of_objects ] do
              
              height := 0;
              
              for i in direct_sum_support do
                  
                  multiplicity_li := Multiplicity( list_of_objects[l], i );
                  
                  sum_up_to_l_minus_1 :=
                    Sum( List( [ 1 .. l - 1 ], m -> Multiplicity( list_of_objects[m], i ) ) );
                  
                  multiplicity_directsum_i := Multiplicity( direct_sum, i );
                  
                  for j in object_b_list do
                      
                      b_j_times_c_kij := j[1] * Multiplicity( k, i, j[2] );
                      
                      cols := multiplicity_li * b_j_times_c_kij;
                      
                      rows :=  multiplicity_directsum_i * b_j_times_c_kij;
                      
                      height_of_zeros := sum_up_to_l_minus_1 * b_j_times_c_kij;
                      
                      Append( k_permutation,
                        List( [ 1 .. cols ], m -> height + height_of_zeros + m ) );
                      
                      height := height + rows;
                      
                    # if Position( support_tensor_product, k ) = 2 then
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
                    #     Print( "b_j_times_c_kij:" );
                    #     Display( b_j_times_c_kij );
                    #
                    #     Print( "cols:" );
                    #     Display( cols );
                    #
                    #     Print( "rows:" );
                    #     Display( rows );
                    #
                    #     Print( "height_of_zeros:" );
                    #     Display( height_of_zeros );
                    #
                    #     Print( "previous_height:" );
                    #     Display( previous_height );
                    #
                    #     Print( "height:" );
                    #     Display( height );
                    #
                        
                        # Print( "result:" );
                        # Display( result );
                        
                        # Error( "\033[31mDEBUGPRINT[57]\033[0m" );
                    #
                    # fi;
                    
                  od;
                  
              od;
              
          od;
          
          # Print( "k: " );
          # Display( Position( support_tensor_product, k ) );

          # Print( "k_permutation:" );
          # Display( k_permutation );
        
          Add( permutation_list, [ k_permutation, k ] );
          
      od;
      
      # Error( "\033[31mDEBUGPRINT[24]\033[0m" );
      return permutation_list;
      
    end
);

left_distributivity_expanding_permutation := FunctionWithCache(
    function( object_b, list_of_objects, direct_sum, support_tensor_product, is_expanded )
      local permutation_list, k_permutation, size_list_of_objects, height, l, i, k, direct_sum_support,
            j, l_times_j, c_kij, list_of_objects_j, rows, zeros_above, ones, step, object_b_list;
      
      if not is_expanded then
          
          list_of_objects := CAP_INTERNAL_ExpandSemisimpleCategoryObjectList( list_of_objects );
          
      fi;
      
      permutation_list := [ ];
      
      size_list_of_objects := Size( list_of_objects );
      
      object_b_list := SemisimpleCategoryObjectList( object_b );
      
      direct_sum_support := Support( direct_sum );
      
      for k in support_tensor_product do
          
          k_permutation := [ ];
          
          for l in [ 1 .. size_list_of_objects ] do
              
              height := 0;
              
              for i in object_b_list do
                  
                  for j in direct_sum_support do
                      
                      l_times_j := Multiplicity( list_of_objects[l], j );
                      
                      c_kij := Multiplicity( k, i[2], j );
                      
                      list_of_objects_j := Multiplicity( direct_sum, j );
                      
                      rows := i[1] * list_of_objects_j * c_kij;
                      
                      zeros_above := Sum( List( [ 1 .. l - 1 ], m -> Multiplicity( list_of_objects[m], j ) ) ) * c_kij;
                      
                      ones := l_times_j * c_kij;
                      
                      step := list_of_objects_j * c_kij;
                      
                      Append( k_permutation, Flat(
                        List( [ 1 .. i[1] ], m -> List( [ 1 .. ones ], n -> height + (m-1)*step + zeros_above + n ) )
                      ) );
                      
                      height := height + rows;
                      
                  od;
                  
              od;
              
          od;
          
          Add( permutation_list, [ k_permutation, k ] );
          
      od;
      
      return permutation_list;
      
    end
);

##
distributivity_function := function( new_source, object_b, list_of_objects, new_range, permutation_function, invert )
  local support, support_tensor_product, size_support, direct_sum, morphism_list, k, permutation,
        object, dim, homalg_matrix, permutation_list, entry;
    
    support_tensor_product := Support( new_source );
    
    direct_sum := DirectSum( list_of_objects );
    
    permutation_list := permutation_function( object_b, list_of_objects, direct_sum, support_tensor_product, true );
    
    # Error( "\033[31mDEBUGPRINT[3]\033[0m" );
    
    if invert then
        
        permutation_list := 
          List( permutation_list, entry ->
            [ ListPerm( PermList( entry[1] )^(-1), Size( entry[1] ) ), entry[2] ] );
        
    fi;
    
    morphism_list := [ ];
    
    for entry in permutation_list do
        
        object := Component( new_source, entry[2] );
        
        dim := Dimension( object );
        
        homalg_matrix := CertainRows(
          HomalgIdentityMatrix( dim, field ),
          entry[1] );
        
        Add( morphism_list, [ VectorSpaceMorphism( object, homalg_matrix, object ), entry[2] ] );
        
    od;
    
    return SemisimpleCategoryMorphism( new_source, morphism_list, new_range );
  
end;

##
distributivity_expanding_for_triple := FunctionWithCache(
    function( object_1, object_2, direct_sum, object_list_with_actual_objects, left_term )
      local object, support_tensor_product_all, direct_sum_2, support_tensor_product_partial,
            tensored_object_list_with_actual_objects, permutation_list_1, permutation_list_2, morphism_list, size, i,
            dim, string, vector_space_object;
      
      direct_sum_2 := TensorProductOnObjects( direct_sum, object_1 );
      
      object := TensorProductOnObjects( direct_sum_2, object_2 );
      
      support_tensor_product_all := Support( object );
      
      support_tensor_product_partial := Support( direct_sum_2 );
      
      tensored_object_list_with_actual_objects := 
        List( object_list_with_actual_objects, pair -> [ pair[1], TensorProductOnObjects( pair[2], object_1 ) ] );
      
      if left_term then
          
          permutation_list_1 :=
            right_distributivity_expanding_permutation( 
              object_1, object_list_with_actual_objects, direct_sum, support_tensor_product_partial, false );
          
          # Error( "\033[31mDEBUGPRINT[First expanding]\033[0m" );
          
          permutation_list_1 :=
            CAP_INTERNAL_TensorProductOfPermutationListWithObjectFromRight( permutation_list_1, object_2, support_tensor_product_all );
          
          # Error( "\033[31mDEBUGPRINT[TensorProduct]\033[0m" );
          
          permutation_list_2 :=
            right_distributivity_expanding_permutation(
              object_2, tensored_object_list_with_actual_objects, direct_sum_2, support_tensor_product_all, false );
          
          # Error( "\033[31mDEBUGPRINT[Second expanding]\033[0m" );
          
      else
          
          permutation_list_1 :=
            left_distributivity_expanding_permutation( 
              object_1, object_list_with_actual_objects, direct_sum, support_tensor_product_partial, false );
          
          # Error( "\033[31mDEBUGPRINT[First expanding]\033[0m" );
          
          permutation_list_1 :=
            CAP_INTERNAL_TensorProductOfPermutationListWithObjectFromRight( permutation_list_1, object_2, support_tensor_product_all );
          
          # Error( "\033[31mDEBUGPRINT[TensorProduct]\033[0m" );
          
          permutation_list_2 :=
            right_distributivity_expanding_permutation(
              object_2, tensored_object_list_with_actual_objects, direct_sum_2, support_tensor_product_all, false );
          
          # Error( "\033[31mDEBUGPRINT[Second expanding]\033[0m" );
          
      fi;
      
      # permutation_list_2 :=
      #   right_distributivity_expanding_permutation(
      #     object_2, tensored_object_list_with_actual_objects, direct_sum_2, support_tensor_product_all, false );
          
      morphism_list := [ ];
      
      ## CLAIM: permutation_lists are sorted w.r.t. ordering in second component
      size := Size( permutation_list_1 );
      
      for i in [ 1 .. size ] do
          
          Add( morphism_list,
               [ ListPerm( ( PermList( permutation_list_1[i][1] )^(-1) * PermList( permutation_list_2[i][1] )^(-1) )^(-1),
                 Size( permutation_list_1[i][1] ) ),
                 permutation_list_1[i][2] ] 
          );
          
      od;
      
      return morphism_list;
      
    end
);

##
distributivity_factoring_for_triple := FunctionWithCache(
    function( object_1, object_2, direct_sum, object_list_with_actual_objects, right_term )
      local object, support_tensor_product_all, direct_sum_2, support_tensor_product_partial,
            tensored_object_list_with_actual_objects, permutation_list_1, permutation_list_2, morphism_list, size, i,
            dim, string, vector_space_object, perm;
      
      direct_sum_2 := TensorProductOnObjects( direct_sum, object_2 );
      
      object := TensorProductOnObjects( direct_sum_2, object_1 );
      
      support_tensor_product_all := Support( object );
      
      support_tensor_product_partial := Support( direct_sum_2 );
      
      tensored_object_list_with_actual_objects := 
        List( object_list_with_actual_objects, pair -> [ pair[1], TensorProductOnObjects( pair[2], object_2 ) ] );
      
      if right_term then
          
          permutation_list_1 :=
            left_distributivity_expanding_permutation( 
              object_2, object_list_with_actual_objects, direct_sum, support_tensor_product_partial, false );
          
          permutation_list_1 :=
            CAP_INTERNAL_TensorProductOfPermutationListWithObjectFromLeft( permutation_list_1, object_1, support_tensor_product_all );
          
          permutation_list_2 :=
            left_distributivity_expanding_permutation(
              object_1, tensored_object_list_with_actual_objects, direct_sum_2, support_tensor_product_all, false );
          
          # for i in [ 1 .. Size( permutation_list_1 ) ] do
          #
          #     perm := ListPerm( ( PermList( permutation_list_2[i][1] ) *
          #                         PermList( permutation_list_1[i][1] ) )^(-1), 
          #                       Size( permutation_list_2[i][1] ) );
          #
          #     Display( perm );
          #
          # od;
          # Error( "\033[31mDEBUGPRINT[Permutations]\033[0m" );
          
      else
          
          permutation_list_1 :=
            right_distributivity_expanding_permutation( 
              object_2, object_list_with_actual_objects, direct_sum, support_tensor_product_partial, false );
          
          # for perm in permutation_list_1 do
          #
          #     Display( ListPerm( PermList( perm[1] )^(-1), Length( perm[1] ) ) );
          #
          # od;
          # Error( "\033[31mDEBUGPRINT[Right factoring]\033[0m" );
          
          permutation_list_1 :=
            CAP_INTERNAL_TensorProductOfPermutationListWithObjectFromLeft( permutation_list_1, object_1, support_tensor_product_all );
          
          # for perm in permutation_list_1 do
          #
          #     Display( ListPerm( PermList( perm[1] )^(-1), Length( perm[1] ) ) );
          #
          # od;
          # # Error( "\033[31mDEBUGPRINT[Tensor Product]\033[0m" );
          
          permutation_list_2 :=
            left_distributivity_expanding_permutation(
              object_1, tensored_object_list_with_actual_objects, direct_sum_2, support_tensor_product_all, false );
          
          # for perm in permutation_list_2 do
          #
          #     Display( ListPerm( PermList( perm[1] )^(-1), Length( perm[1] ) ) );
          #
          # od;
          # Error( "\033[31mDEBUGPRINT[Left factoring]\033[0m" );
          
          # for i in [ 1 .. Size( permutation_list_1 ) ] do
          #
          #     perm := ListPerm( ( PermList( permutation_list_2[i][1] ) *
          #                         PermList( permutation_list_1[i][1] ) )^(-1), 
          #                       Size( permutation_list_2[i][1] ) );
          #
          #     Display( perm );
          #
          # od;
          # Error( "\033[31mDEBUGPRINT[Permutations]\033[0m" );
          
      fi;
      
      # BUG: needs to be left_distributivity_expanding_permutation
      # permutation_list_2 :=
      #   right_distributivity_expanding_permutation(
      #     object_1, tensored_object_list_with_actual_objects, direct_sum_2, support_tensor_product_all, false );
      
      morphism_list := [ ];
      
      ## CLAIM: permutation_lists are sorted w.r.t. ordering in second component
      size := Size( permutation_list_1 );
      
      for i in [ 1 .. size ] do
          
          Add( morphism_list,
               [ ListPerm( ( PermList( permutation_list_2[i][1] ) * PermList( permutation_list_1[i][1] ) )^(-1), 
                 Size( permutation_list_2[i][1] ) ),
                 permutation_list_1[i][2] ]
          );
          
      od;
      
      return morphism_list;
      
    end
);

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_1_Morphism,
  function( object_a, object_b, object_c, new_source )
    local object_a_list, object_a_expanded_list, morphism_1;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_a_expanded_list := (Size( object_a_list ) > 1) or (object_a_list[1][1] > 1);
    
    morphism_1 := [ ];
    
    if object_a_expanded_list then
        
        morphism_1 := distributivity_expanding_for_triple( object_b, object_c, object_a, object_a_list, true );
        
    fi;
    
    return morphism_1;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_2_Morphism,
  function( object_a, object_b, object_c, new_source )
    local support, object_a_list, object_b_list, object_b_expanded_list, summand_list, elem, morphism, morphism_2;
    
    support := Support( new_source );
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    object_b_expanded_list := (Size( object_b_list ) > 1) or (object_b_list[1][1] > 1);
    
    morphism_2 := [ ];
    
    if object_b_expanded_list then
        
        summand_list := [ ];
        
        for elem in object_a_list do
            
            morphism := distributivity_expanding_for_triple( elem[2], object_c, object_b, object_b_list, false );
            
            Append( summand_list, List( [ 1 .. elem[1] ], i -> morphism ) );
            
        od;
        
        morphism_2 := CAP_INTERNAL_DirectSumForPermutationLists( summand_list, support );
        
    fi;
    
    return morphism_2;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_3_Morphism,
  function( object_a, object_b, object_c, new_source )
    local object_a_list, object_b_list, object_c_list, object_c_expanded_list, support, morphism_3, outer_summand_list, elem_a, inner_summand_list, elem_b, tensor_product, morphism;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    object_c_list := SemisimpleCategoryObjectListWithActualObjects( object_c );
    
    object_c_expanded_list := (Size( object_c_list ) > 1) or (object_c_list[1][1] > 1);
    
    support := Support( new_source );
    
    morphism_3 := [ ];
    
    if object_c_expanded_list then
        
        outer_summand_list := [ ];
        
        for elem_a in object_a_list do
            
            inner_summand_list := [ ];
            
            for elem_b in object_b_list do
                
                tensor_product := TensorProductOnObjects( elem_a[2], elem_b[2] );
                
                morphism := left_distributivity_expanding_permutation( tensor_product,
                                                                       object_c_list,
                                                                       object_c,
                                                                       Support( TensorProductOnObjects( tensor_product, object_c ) ),
                                                                       false );
                                                                       
                Append( inner_summand_list, List( [ 1 .. elem_b[1] ], i -> morphism ) );
                
            od;
            
            morphism :=
              CAP_INTERNAL_DirectSumForPermutationLists(
                inner_summand_list, Support( TensorProductOnObjects( TensorProductOnObjects( elem_a[2], object_b ), object_c ) )
              );
            
            Append( outer_summand_list, List( [ 1 .. elem_a[1] ], i -> morphism ) );
            
        od;
        
        morphism_3 := CAP_INTERNAL_DirectSumForPermutationLists( outer_summand_list, support );
        
    fi;
    
    return morphism_3;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_4_Morphism,
  function( object_a, object_b, object_c, new_source, associator_data, is_magma_ring, is_complete_data )
    local tensor_product_list, nr_components, morphism_4_string_list, a_list, b_list, c_list, size_a, size_b, size_c, beta, gamma, morphism_4, morphism_4_degree_list, tensor_product_triple_list, a, b, c, i, elem, outer_summand_list, innermost_summand_list, inner_summand_list, morphism, object_a_list, object_b_list, object_c_list, elem_a, elem_b, elem_c, degree, associator_string, morphism_4_position_list, p, g, G, start_pos, multiplicity, matrix, support;
    
    # if is_magma_ring and is_complete_data then
    if Conductor( UnderlyingFieldForHomalgForSemisimpleCategory( CapCategory( object_a ) ) ) <> 1 and is_complete_data then
        
        # This case implicitly assumes the objects to be Z-graded, i.e., IsGZGradedIrreducibleObject,
        # because of Multiplicity(...) with four arguments below.
        
        tensor_product_list := SemisimpleCategoryObjectList( new_source );
        
        nr_components := Size( tensor_product_list );
        
        morphism_4_string_list := List( [ 1 .. nr_components ], i -> "[" );
        
        support := Support( new_source );
        
        a_list := SemisimpleCategoryObjectList( object_a );
        
        b_list := SemisimpleCategoryObjectList( object_b );
        
        c_list := SemisimpleCategoryObjectList( object_c );
        
        size_a := Size( a_list );
        
        size_b := Size( b_list );
        
        size_c := Size( c_list );
        
        ## precomputation
        
        # Implicitly assumes the objects to be Z-graded, i.e., IsGZGradedIrreducibleObject,
        # because of Multiplicity(...) with four arguments below.
        beta := 
          List( tensor_product_list, d ->
            List( a_list, a -> 
              List( b_list, b ->
                Sum( List( c_list, c -> c[1] * SignInt( Multiplicity( d[2], a[2], b[2], c[2] ) ) ) )
               )
            )
          );
        
        gamma := 
          List( [ 1 .. nr_components ], d ->
            List( [ 1 .. size_a ], a ->
              Sum( List( [ 1 .. size_b ], b -> b_list[b][1] * beta[d][a][b] ) )
            )
          );
        
        morphism_4 := List( [ 1 .. nr_components ], i ->[] );
        
        morphism_4_degree_list := List( [ 1 .. nr_components ], i ->[] );
        
        for a in [ 1 .. size_a ] do
            
            for b in [ 1 .. size_b ] do
                
                for c in [ 1 .. size_c ] do
                    
                    if IsYieldingIdentities( a_list[a][2] ) or IsYieldingIdentities( b_list[b][2] ) or IsYieldingIdentities( c_list[c][2] ) then
                        
                        tensor_product_triple_list := 
                          TensorProductOfIrreduciblesOp( [ a_list[a][2], b_list[b][2], c_list[c][2] ], a_list[a][2] );
                        
                        for elem in tensor_product_triple_list do
                            
                            i := PositionProperty( tensor_product_list, j -> j[2] = elem[2] );
                            
                            multiplicity := elem[1];
                            
                            #Compute morphism_4_position_list
                            
                            #1.step: find start position
                            
                            # Implicitly assumes the objects to be Z-graded, i.e., IsGZGradedIrreducibleObject,
                            # because of Multiplicity(...) with four arguments below.
                            start_pos := 
                              Sum( List( [ 1 .. a-1 ], al -> a_list[al][1] * gamma[i][al] ) )
                              + Sum( List( [ 1 .. b-1 ], bl -> b_list[bl][1] * beta[i][a][bl] ) )
                              + Sum( List( [ 1 .. c-1 ], cl -> c_list[cl][1] * SignInt( Multiplicity( tensor_product_list[i][2], a_list[a][2], b_list[b][2], c_list[cl][2] ) ) ) )
                              + 1;
                            
                            #2.step fill in the other positions
                            
                            g := beta[i][a][b];
                            
                            G := gamma[i][a];
                            
                            morphism_4_position_list :=
                              Flat(
                                List( [ 0 .. a_list[a][1]-1 ], al ->
                                  List( [ 0 .. b_list[b][1]-1 ], bl ->
                                    List( [ 0 .. c_list[c][1]-1 ], cl ->
                                    start_pos + cl + al*G + bl*g
                                  )
                                  )
                                )
                              );
                            
                            matrix := String( Flat( IdentityMat( multiplicity ) ) );
                            
                            for p in morphism_4_position_list do
                                
                                morphism_4[i][p] := matrix;
                                
                                morphism_4_degree_list[i][p] := multiplicity;
                                
                            od;
                            
                        od;
                        
                    else
                        
                        for i in [ 1 .. nr_components ] do
                            
                            associator_string :=
                              AssociatorStringListFromData( a_list[a][2], b_list[b][2], c_list[c][2], support[i], associator_data );
                            
                            if not IsEmpty( associator_string ) then
                                
                                #Compute morphism_4_position_list
                                
                                #1.step: find start position
                                
                                # Implicitly assumes the objects to be Z-graded, i.e., IsGZGradedIrreducibleObject,
                                # because of Multiplicity(...) with four arguments below.
                                start_pos := 
                                  Sum( List( [ 1 .. a-1 ], al -> a_list[al][1] * gamma[i][al] ) )
                                  + Sum( List( [ 1 .. b-1 ], bl -> b_list[bl][1] * beta[i][a][bl] ) )
                                  + Sum( List( [ 1 .. c-1 ], cl -> c_list[cl][1] * SignInt( Multiplicity( tensor_product_list[i][2], a_list[a][2], b_list[b][2], c_list[cl][2] ) ) ) )
                                  + 1;
                                
                                #2.step fill in the other positions
                                
                                g := beta[i][a][b];
                                
                                G := gamma[i][a];
                                
                                morphism_4_position_list :=
                                  Flat(
                                    List( [ 0 .. a_list[a][1]-1 ], al ->
                                      List( [ 0 .. b_list[b][1]-1 ], bl ->
                                        List( [ 0 .. c_list[c][1]-1 ], cl ->
                                        start_pos + cl + al*G + bl*g
                                      )
                                      )
                                    )
                                  );
                                
                                degree := Sqrt( Size( SplitString( associator_string, "," ) ) );
                                
                                associator_string := Concatenation( "[", associator_string, "]" );
                                
                                for p in morphism_4_position_list do
                                    
                                    morphism_4[i][p] := associator_string;
                                    
                                    morphism_4_degree_list[i][p] := degree;
                                    
                                od;
                                
                            fi;
                            
                        od;
                      
                    fi;
                    
                od;
                
            od;
            
        od; 
        
        morphism_4 := 
          CAP_INTERNAL_Create_Semisimple_Endomorphism_From_String_List( new_source, morphism_4, morphism_4_degree_list );
        
    else
        
        outer_summand_list := [ ];
        
        object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
        
        object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
        
        object_c_list := SemisimpleCategoryObjectListWithActualObjects( object_c );
        
        for elem_a in object_a_list do
            
            inner_summand_list := [ ];
            
            for elem_b in object_b_list do
                
                innermost_summand_list := [ ];
                
                for elem_c in object_c_list do
                    
                    # Error( "\033[31mDEBUGPRINT[complete data]\033[0m" );
                    
                    # Display( elem_a );
                    # Display( elem_b );
                    # Display( elem_c );
                    
                    morphism := CAP_INTERNAL_AssociatorOnIrreducibles( elem_a[2], elem_b[2], elem_c[2] );
                    
                    Append( innermost_summand_list, List( [ 1 .. elem_c[1] ], i -> morphism ) );
                    
                od;
                
                morphism := DirectSumFunctorial( innermost_summand_list );
                
                Append( inner_summand_list, List( [ 1 .. elem_b[1] ], i -> morphism ) );
                
            od;
            
            morphism := DirectSumFunctorial( inner_summand_list );
            
            Append( outer_summand_list, List( [ 1 .. elem_a[1] ], i -> morphism ) );
            
        od;
        
        morphism_4 := DirectSumFunctorial( outer_summand_list );
      
    fi;
    
    return morphism_4;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_5_Morphism,
  function( object_a, object_b, object_c, new_source )
    local object_a_list, object_b_list, object_c_list, object_c_expanded_list, support, morphism_5, outer_summand_list, elem_a, inner_summand_list, elem_b, tensor_product, morphism;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    object_c_list := SemisimpleCategoryObjectListWithActualObjects( object_c );
    
    object_c_expanded_list := (Size( object_c_list ) > 1) or (object_c_list[1][1] > 1);
    
    support := Support( new_source );
    
    morphism_5 := [ ];
    
    if object_c_expanded_list then
        
        outer_summand_list := [ ];
        
        for elem_a in object_a_list do
            
            inner_summand_list := [ ];
            
            for elem_b in object_b_list do
                
                morphism :=
                  distributivity_factoring_for_triple( elem_a[2], elem_b[2], object_c, object_c_list, true );
                
                Append( inner_summand_list, List( [ 1 .. elem_b[1] ], i -> morphism ) );
                
            od;
            
            morphism := CAP_INTERNAL_DirectSumForPermutationLists( inner_summand_list,
                          Support( TensorProductOnObjects( TensorProductOnObjects( elem_a[2], object_b ), object_c ) ) );
            
            Append( outer_summand_list, List( [ 1 .. elem_a[1] ], i -> morphism ) );
            
            # Error( "\033[31mDEBUGPRINT[First Direct Sum]\033[0m" );
            
        od;
        
        morphism_5 := CAP_INTERNAL_DirectSumForPermutationLists( outer_summand_list, support );
        
    fi;
    
    return morphism_5;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_6_Morphism,
  function( object_a, object_b, object_c, new_source )
    local object_a_list, object_b_list, object_b_expanded_list, support, morphism_6, summand_list, elem, morphism;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    object_b_expanded_list := (Size( object_b_list ) > 1) or (object_b_list[1][1] > 1);
    
    support := Support( new_source );
    
    morphism_6 := [ ];
    
    if object_b_expanded_list then
        
        summand_list := [ ];
        
        for elem in object_a_list do
            
            morphism := distributivity_factoring_for_triple( elem[2], object_c, object_b, object_b_list, false );
            
            Append( summand_list, List( [ 1 .. elem[1] ], i -> morphism ) );
            
        od;
        
        morphism_6 := CAP_INTERNAL_DirectSumForPermutationLists( summand_list, support );
        
    fi;
    
    return morphism_6;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_7_Morphism,
  function( object_a, object_b, object_c, new_source, use_factoring )
    local object_a_list, object_a_expanded_list, support, morphism_7_inverse, tensor_product;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_a_expanded_list := (Size( object_a_list ) > 1) or (object_a_list[1][1] > 1);
    
    support := Support( new_source );
    
    morphism_7_inverse := [ ];
    
    if object_a_expanded_list then
        
        tensor_product := TensorProductOnObjects( object_b, object_c );
        
        morphism_7_inverse := 
          right_distributivity_expanding_permutation
                      ( tensor_product, object_a_list,
                        object_a, support, false );
        
    fi;
    
    if use_factoring then
        
        # The right factoring, i.e., invert all permutations.
        return List( morphism_7_inverse, perm ->
            [ ListPerm( PermList( perm[1] )^(-1), Length( perm[1] ) ),
              perm[2] ] );
        
    else
        
        # Later on in Sebastians code,
        # CertainRows is used to construct the inverse
        # of the right distributivity expanding morphism,
        # so we do not need to invert the permutations.
        return morphism_7_inverse;
        
    fi;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_123_Morphism,
  function( object_a, object_b, object_c, new_source, new_range )
    local morphism_1, morphism_2, morphism_3, first_permutation, first_permutation_morphism_list, perm1, perm2, perm3, chi, support, dim, vector_space_object, underlying_category, homalg_matrix;
    
    # (a⊗b)⊗c  ⥲  ⊕ᵢ aᵢ((χᵢ⊗b)⊗c)
    morphism_1 := SEMISIMPLECATEGORY_Associator_1_Morphism( object_a, object_b, object_c, new_source );
    
    # ⊕ᵢ ɑᵢ((χᵢ⊗b)⊗c)  ⥲  ⊕ᵢ ɑᵢ ⊕ⱼ bⱼ((χᵢ⊗χⱼ)⊗c)
    morphism_2 := SEMISIMPLECATEGORY_Associator_2_Morphism( object_a, object_b, object_c, new_source );
    
    # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ (χᵢ⊗χⱼ)⊗c ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ (χᵢ⊗χⱼ)⊗χₖ ] ] ]
    morphism_3 := SEMISIMPLECATEGORY_Associator_3_Morphism( object_a, object_b, object_c, new_source );
    
    first_permutation_morphism_list := [ ];
    
    first_permutation := IdentityMorphism( new_source );
    
    if not ( IsEmpty( morphism_1 ) and IsEmpty( morphism_2 ) and IsEmpty( morphism_3 ) ) then
        
        support := Support( new_source );
        
        underlying_category := UnderlyingCategoryForSemisimpleCategory( CapCategory( object_a ) );
        
        field := underlying_category!.field_for_matrix_category;
        
        for chi in support do
            
            perm1 := First( morphism_1, i -> i[2] = chi );
            
            if not perm1 = fail then
                
                perm1 := PermList( perm1[1] )^(-1);
                
            else
                
                perm1 := ();
                
            fi;
            
            perm2 := First( morphism_2, i -> i[2] = chi );
            
            if not perm2 = fail then
                
                perm2 := PermList( perm2[1] )^(-1);
                
            else
                
                perm2 := ();
                
            fi;
            
            perm3 := First( morphism_3, i -> i[2] = chi );
            
            if not perm3 = fail then
                
                perm3 := PermList( perm3[1] )^(-1);
                
            else
                
                perm3 := ();
                
            fi;
            
            dim := Multiplicity( new_source, chi );
            
            vector_space_object := MatrixCategoryObject( underlying_category, dim );
            
            homalg_matrix := CertainRows(
              HomalgIdentityMatrix( dim, field ),
              ListPerm( perm1 * perm2 * perm3, dim )
            );
            
            Add( first_permutation_morphism_list, [ VectorSpaceMorphism( vector_space_object, homalg_matrix, vector_space_object ),
                 chi ] );
            
        od;
        
        first_permutation := SemisimpleCategoryMorphism( new_source, first_permutation_morphism_list, new_range );
        
    fi;
    
    return first_permutation;
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Associator_567_Morphism,
  function( object_a, object_b, object_c, new_source, new_range, use_factoring )
    local morphism_5, morphism_6, morphism_7_inverse, second_permutation, second_permutation_morphism_list, perm1, perm2, perm3, chi, support, dim, vector_space_object, underlying_category, homalg_matrix;
    
    # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ ⊕ₖ cₖ·[ χᵢ⊗(χⱼ⊗χₖ) ] ] ]  ⥲  ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]
    morphism_5 := SEMISIMPLECATEGORY_Associator_5_Morphism( object_a, object_b, object_c, new_source );
    
    # ⊕ᵢ ɑᵢ·[ ⊕ⱼ bⱼ·[ χᵢ⊗(χⱼ⊗c) ] ]  ⥲  ⊕ᵢ ɑᵢ·[ χᵢ⊗(b⊗c) ]
    morphism_6 := SEMISIMPLECATEGORY_Associator_6_Morphism( object_a, object_b, object_c, new_source );
    
    # ⊕ᵢ aᵢ·[ χᵢ⊗(b⊗c) ]  ⥲  a⊗(b⊗c)
    morphism_7_inverse := SEMISIMPLECATEGORY_Associator_7_Morphism( object_a, object_b, object_c, new_source, use_factoring );
    
    second_permutation_morphism_list := [ ];
    
    second_permutation := IdentityMorphism( new_source );
    
    if not ( IsEmpty( morphism_5 ) and IsEmpty( morphism_6 ) and IsEmpty( morphism_7_inverse ) ) then
        
        support := Support( new_source );
        
        underlying_category := UnderlyingCategoryForSemisimpleCategory( CapCategory( object_a ) );
        
        field := underlying_category!.field_for_matrix_category;
        
        for chi in support do
            
            perm1 := First( morphism_5, i -> i[2] = chi );
            
            if not perm1 = fail then
                
                perm1 := PermList( perm1[1] )^(-1);
                
            else
                
                perm1 := ();
                
            fi;
            
            perm2 := First( morphism_6, i -> i[2] = chi );
            
            if not perm2 = fail then
                
                perm2 := PermList( perm2[1] )^(-1);
                
            else
                
                perm2 := ();
                
            fi;
            
            perm3 := First( morphism_7_inverse, i -> i[2] = chi );
            
            if not perm3 = fail then
                
                perm3 := PermList( perm3[1] ); ## the inverse!
                
            else
                
                perm3 := ();
                
            fi;
            
            dim := Multiplicity( new_source, chi );
            
            vector_space_object := MatrixCategoryObject( underlying_category, dim );
            
            homalg_matrix := CertainRows(
              HomalgIdentityMatrix( dim, field ),
              ListPerm( perm1 * perm2 * perm3, dim )
            );
            
            Add( second_permutation_morphism_list, [ VectorSpaceMorphism( vector_space_object, homalg_matrix, vector_space_object ),
                 chi ] );
            
        od;
        
        second_permutation := SemisimpleCategoryMorphism( new_source, second_permutation_morphism_list, new_range );
        
    fi;
    
    return second_permutation;
    
end );

