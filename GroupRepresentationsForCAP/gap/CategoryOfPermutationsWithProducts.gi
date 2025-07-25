# SPDX-License-Identifier: GPL-2.0-or-later
# AdditiveClosuresForCAP: Additive closures for pre-abelian categories
#
# Implementations
#

# Read precompiled categories
# ReadPackage( "GroupRepresentationsForCAP", "gap/precompiled_categories/CategoryOfPermutationsWithProducts_precompiled.gi" );

####################################
##
## Constructors
##
####################################

##
InstallGlobalFunction( CategoryOfPermuationsWithProducts,
                       
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS )
    local object_datum_type, morphism_datum_type, name, PWP, compare_morphisms, object_datum, object_constructor, morphism_datum, morphism_constructor, SubscriptDigits, ToSubscript;
    
    ##
    name := "CategoryOfPermutationsWithProducts";
    
    ##
    object_datum_type := IsBigInt;
    
    ##
    morphism_datum_type :=
        CapJitDataTypeOfListOf(
            CapJitDataTypeOfNTupleOf( 2,
                IsBigInt,
                IsBigInt ) );
    
    ##
    PWP :=
        CreateCapCategoryWithDataTypes(
            name,
            IsCategoryOfPermuationsWithProducts,
            IsObjectInCategoryOfPermuationsWithProducts,
            IsMorphismInCategoryOfPermuationsWithProducts,
            IsCapCategoryTwoCell,
            object_datum_type,
            morphism_datum_type,
            fail );
            
    SetIsSkeletalCategory( PWP, true );
    
    SetIsCartesianCategory( PWP, true );
    
    ##
    AddObjectDatum( PWP,
      function( PWP, object )
        
        return NumberElements( object );
        
    end );
    
    ##
    AddObjectConstructor( PWP,
      function( PWP, nr_elements )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= nr_elements );
        
        return CreateCapCategoryObjectWithAttributes( PWP,
                       NumberElements, nr_elements );
                       
    end );
    
    ##
    AddMorphismDatum( PWP,
      function( PWP, morphism )
        
        return ListOfColumns( morphism );
        
    end );
    
    ##
    AddMorphismConstructor( PWP,
      function( PWP, S, list_of_columns, T )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( list_of_columns, col -> 1 <= col[1] and 1 <= col[2] ) );
                
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( list_of_columns, col -> col[1] <= col[2] ) );
        
        # S must "give" enough rows.
        #                                       ┌           ┐
        #                                       │0 0 0 ┆ 0 0│
        #                                       │1 0 0 ┆ 0 0│
        # Example: [ 6, [ [1,3], [3,4] ], 5 ] ≙ │0 1 0 ┆ 0 0│
        #                                       │0 0 1 ┆ 1 0│
        #                                       │0 0 0 ┆ 0 1│
        #                                       │0 0 0 ┆ 0 0│
        #                                       └           ┘
        #
        # So S must be greater or equal to 4 = Max( 1, 3, 4 ).
        #
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
            ForAll( list_of_columns, pair ->
                pair[1] <= NumberElements( S ) and
                pair[2] <= NumberElements( S ) ) );
                
        # T must match the number of columns.
        #
        #                                       ┌           ┐
        #                                       │0 0 0 ┆ 0 0│
        #                                       │1 0 0 ┆ 0 0│
        # Example: [ 6, [ [1,3], [3,4] ], 5 ] ≙ │0 1 0 ┆ 0 0│
        #                                       │0 0 1 ┆ 1 0│
        #                                       │0 0 0 ┆ 0 1│
        #                                       │0 0 0 ┆ 0 0│
        #                                       └           ┘
        #
        # So the we get [3-1+1]+[4-3+1] = 5 columns.
        #
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, NumberElements( T ) = Sum( List( list_of_columns, col -> col[2] - col[1] + 1 ) ) );
        
        return CreateCapCategoryMorphismWithAttributes(
                    PWP,
                    S,
                    T,
                    ListOfColumns, list_of_columns );
                    
    end );
    
    ##
    AddIsWellDefinedForObjects( PWP,
      function( PWP, object )
        
        return 0 <= NumberElements( object );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( PWP,
      function( PWP, morphism )
        local S, T, list_of_columns;
        
        S := Source( morphism );
        T := Target( morphism );
        
        list_of_columns := ListOfColumns( morphism );
        
        if not ForAll( list_of_columns, col -> 1 <= col[1] and 1 <= col[2] ) then
            
            return false;
            
        elif not ForAll( list_of_columns, col -> col[1] <= col[2] ) then
            
            return false;
            
        elif not ForAll( list_of_columns, pair ->
            pair[1] <= NumberElements( S ) and
            pair[2] <= NumberElements( S ) )
        then
            
            return false;
            
        elif not NumberElements( T ) = Sum( List( list_of_columns, col -> col[2] - col[1] + 1 ) ) then
            
            return false;
            
        else
            
            return true;
            
        fi;
        
    end );
    
    ##
    AddIsEqualForObjects( PWP,
      function( PWP, object_1, object_2 )
        
        return NumberElements( object_1 ) = NumberElements( object_2 );
        
    end );
    
    ##
    AddIsEqualForMorphisms( PWP,
      function( PWP, morphism_1, morphism_2 )
        
        return ListOfColumns( morphism_1 ) = ListOfColumns( morphism_2 );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( PWP,
      function( PWP, morphism_1, morphism_2 )
        local simplified_morphism_1, simplified_morphism_2;
        
        simplified_morphism_1 := SimplifyEndo( morphism_1, 2 );
        simplified_morphism_2 := SimplifyEndo( morphism_2, 2 );
        
        return IsEqualForMorphisms( simplified_morphism_1, simplified_morphism_2 );
        
    end );
    
    AddSimplifyEndo( PWP,
      function( PWP, phi, i )
        local list_of_columns, merge_consecutive_pairs, simplified_list_of_columns;
        
        list_of_columns := ListOfColumns( phi );
        
        if IsEmpty( list_of_columns ) then
            
            return phi;
            
        else
            
            merge_consecutive_pairs :=
                function( accumulator, next_pair )
                    local previous_pair;
                    
                    previous_pair := Last( accumulator );
                    
                    # Two consective pairs [[n-1, n], [n+1, m]] become [[n-1, m]].
                    if next_pair[1] = previous_pair[2] + 1 then
                        
                        return
                            Concatenation(
                                accumulator{[ 1 .. Length( accumulator ) - 1 ]},
                                [ [ previous_pair[1], next_pair[2] ] ] );
                                
                    else
                        
                        return Concatenation( accumulator, [ next_pair ] );
                        
                    fi;
                    
                end;
                
            simplified_list_of_columns :=
                Iterated(
                    list_of_columns{[ 2 .. Length( list_of_columns ) ]},
                    merge_consecutive_pairs,
                    [ SafeFirst( list_of_columns, ReturnTrue ) ] );
                    
            return
                MorphismConstructor( PWP,
                    Source( phi ),
                    simplified_list_of_columns,
                    Target( phi ) );
                    
        fi;
        
    end );
    
    ##
    AddIdentityMorphism( PWP,
      function( PWP, object )
        local nr_elements, datum;
        
        nr_elements := NumberElements( object );
        
        datum := [
            [ NTuple( 2, 1, nr_elements ) ],
            CapJitTypedExpression( [ ], { } ->
                CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) ) ) ];
                
        datum := datum[ BooleanToInteger( nr_elements = 0 ) + 1 ];
        
        return MorphismConstructor( PWP, object, datum, object );
        
    end );
    
    ##
    AddPreCompose( PWP,
      function( PWP, morphism_1, morphism_2 )
        
        
        
    end );
    
    ##
    AddTerminalObject( PWP,
      function( PWP )
        
        return ObjectConstructor( PWP, 0 );
        
    end );
    
    ##
    AddIsTerminal( PWP,
      function( PWP, object )
        
        return NumberElements( object ) = 0;
        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( PWP,
      function( PWP, object, t )
        
        return
            MorphismConstructor( PWP,
                object,
                CapJitTypedExpression( [ ],
                    { } -> CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) ) ),
                t );
                
    end );
    
    ##
    AddDirectProduct( PWP,
      function( PWP, object_list )
        local sum;
        
        sum := Sum( List( object_list, object -> NumberElements( object ) ) );
        
        return ObjectConstructor( PWP, sum );
        
    end );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( PWP,
      function( PWP, objects, projection_number, direct_product )
        local dim_pre, dim_post, dim_factor, datum;
        
        dim_pre := Sum( List( objects{ [ 1 .. projection_number - 1 ] }, c -> NumberElements( c ) ) );
        
        dim_post := Sum( List( objects{ [ projection_number + 1 .. Length( objects ) ] }, c -> NumberElements( c ) ) );
        
        dim_factor := NumberElements( objects[ projection_number ] );
        
        datum := [ [ NTuple( 2, dim_pre + 1, dim_pre + dim_factor ) ],
                   CapJitTypedExpression( [ ], { } ->
                    CapJitDataTypeOfListOf( CapJitDataTypeOfNTupleOf( 2, IsBigInt, IsBigInt ) ) ) ];
                    
        datum := datum[ BooleanToInteger( dim_factor = 0 ) + 1 ];
        
        return MorphismConstructor( PWP, direct_product, datum, objects[ projection_number ] );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( PWP,
      function( PWP, target_diagram, test_object, morphisms, product )
        local columns;
        
        columns := Concatenation( List( morphisms, mor -> ListOfColumns( mor ) ) );
        
        return MorphismConstructor( PWP, test_object, columns, product );
        
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( PWP,
      function( PWP, source, source_diagram, morphisms, target_diagram, target )
        local columns;
        
        columns :=
            Concatenation(List( [ 1 .. Length( morphisms ) ], function( i )
                local offset;
                
                offset := Sum( List( [ 1 .. i - 1 ], j -> NumberElements( source_diagram[j] ) ) );
                
                return List( ListOfColumns( morphisms[i] ), col -> col + offset );
                
            end ) );
            
        return MorphismConstructor( PWP, source, columns, target );
        
    end );
    
    AddTensorUnit( PWP,
      function( PWP )
        
        return ObjectConstructor( PWP, 1 );
        
    end );
    
    AddLeftUnitorWithGivenTensorProduct( PWP,
      function( PWP, object, tensor_product )
        
        return IdentityMorphism( PWP, object );
        
    end );
    
    AddRightUnitorWithGivenTensorProduct( PWP,
      function( PWP, object, tensor_product )
        
        return IdentityMorphism( PWP, object );
        
    end );
    
    ##
    AddTensorProductOnObjects( PWP,
      function( PWP, a, b )
        local product;
        
        product :=  NumberElements( a ) * NumberElements( b );
        
        return ObjectConstructor( PWP, product );
        
    end );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( PWP,
      function( PWP, source, alpha, beta, target )
        local alpha_cols, alpha_nr_cols, beta_cols, beta_nr_cols, beta_nr_rows, optimized_tensored_columns, tensored_columns;
        
        alpha_cols := ListOfColumns( alpha );
        alpha_nr_cols := Length( alpha_cols );
        
        beta_cols := ListOfColumns( beta );
        beta_nr_cols := Length( beta_cols );
        beta_nr_rows := NumberElements( Source( beta ) );
        
        # Example: alpha_cols = [[5,7]]
        #          beta_cols  = [[1,2]]
        #
        # So we return
        #
        # [ 9, 14 ] = [ 1 + (2*(5-1)), 2 + (2*(7-1)) ]
        #
        # instead of the following separate ranges:
        #
        # [1,2] + 2*4 = [ 9, 10 ]
        # [1,2] + 2*5 = [ 11, 12 ]
        # [1,2] + 2*6 = [ 13, 14 ]
        if Length( beta_cols ) = 1 and beta_cols[1][2] - beta_cols[1][1] + 1 = beta_nr_rows then
            
            optimized_tensored_columns :=
                List( [ 1 .. alpha_nr_cols ], i ->
                    NTuple( 2,
                        beta_cols[1][1] + ( beta_nr_rows * ( alpha_cols[i][1] - 1 ) ),
                        beta_cols[1][2] + ( beta_nr_rows * ( alpha_cols[i][2] - 1 ) ) ) );
                        
            return MorphismConstructor( PWP, source, optimized_tensored_columns, target );
            
        else
            
            tensored_columns :=
                Concatenation( List( [ 1 .. alpha_nr_cols ], i ->
                    Concatenation( List( [ alpha_cols[i][1] .. alpha_cols[i][2] ], j ->
                        beta_cols + ( beta_nr_rows * (j-1) ) ) ) ) );
                        
            return MorphismConstructor( PWP, source, tensored_columns, target );
            
        fi;
        
    end );
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        # ADD_FUNCTIONS_FOR_CategoryOfPermutationsWithProducts( PWP );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( PWP );
        
    fi;
    
    return PWP;
    
end ) );

####################################
##
## Functors
##
####################################

##
InstallMethod( FunctorPWPToCategoryOfRows,
               [ IsCapCategory, IsCapCategory ],
               
  function( PWP, Rows )
    local homalg_ring, functor;
    
    homalg_ring := UnderlyingRing( Rows );
    
    functor := CapFunctor( Concatenation( "Functor ", Name( PWP ), " to ", Name( Rows ) ), PWP, Rows );
    
    AddObjectFunction( functor,
      function( object )
        
        return ObjectConstructor( Rows, NumberElements( object ) );
        
    end );
    
    AddMorphismFunction( functor,
      function( source, morphism, target )
        local nr_rows, nr_cols, block_cols, matrix;
        
        nr_rows := RankOfObject( source );
        nr_cols := RankOfObject( target );
        
        block_cols := ListOfColumns( morphism );
        
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
                UnionOfRows( homalg_ring, cols, [
                     HomalgZeroMatrix( block[1] - 1, cols, homalg_ring ),
                     HomalgIdentityMatrix( cols, homalg_ring ),
                     HomalgZeroMatrix( nr_rows - block[2], cols, homalg_ring ) ] );
                     
        end );
        
        matrix := UnionOfColumns( homalg_ring, nr_rows, block_cols );
        
        return AsCategoryOfRowsMorphism( Rows, matrix );
        
    end );
    
    return functor;
    
end );

####################################
##
## View & Display
##
####################################

InstallMethod( DisplayString,
               [ IsObjectInCategoryOfPermuationsWithProducts ],
               
  object -> String( NumberElements( object ) )
  
);

