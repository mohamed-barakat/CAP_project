# SPDX-License-Identifier: GPL-2.0-or-later
# AdditiveClosuresForCAP: Additive closures for pre-abelian categories
#
# Implementations
#

# Read precompiled categories
ReadPackage( "AdditiveClosuresForCAP", "gap/precompiled_categories/DirectSumOfAdditiveCategory_Rows_Field.gi" );

####################################
##
## Constructors
##
####################################

##
InstallMethod( DirectSumOfAdditiveCategory,
               [ IsBigInt, IsCapCategory ],
               
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", true ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, nr_summands, A )
    local name, object_datum_type, morphism_datum_type, DirectSum, compare_morphisms, object_datum, object_constructor, morphism_datum, morphism_constructor, SubscriptDigits, ToSubscript;
    
    Assert( 0, nr_summands > 0 );
    
    # Assert( 0, IsAdditiveCategory( A ) );
    
    name := Concatenation( "⨁( ", String( nr_summands ), ", ", Name( A ), " )" );
    
    ##
    object_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( A ) ) );
            
    ##
    morphism_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( A ) ) );
            
    DirectSum :=
        CreateCapCategoryWithDataTypes(
            name,
            IsDirectSumOfAdditiveCategory,
            IsObjectInDirectSumOfAdditiveCategory,
            IsMorphismInDirectSumOfAdditiveCategory,
            IsCapCategoryTwoCell,
            object_datum_type,
            morphism_datum_type,
            fail );
            
    SetUnderlyingAdditiveCategory( DirectSum, A );
    
    SetNrSummands( DirectSum, nr_summands );
    
    DirectSum!.compiler_hints :=
        rec( category_attribute_names :=
            [ "NrSummands",
              "UnderlyingAdditiveCategory" ] );
    
    if HasIsLinearCategoryOverCommutativeRing( A ) and
       IsLinearCategoryOverCommutativeRing( A )
    then
        
        SetIsLinearCategoryOverCommutativeRing( DirectSum, true );
        
        SetCommutativeRingOfLinearCategory( DirectSum, UnderlyingRing( A ) );
        
        Append( DirectSum!.compiler_hints.category_attribute_names,
                [ "CommutativeRingOfLinearCategory" ] );
        
    fi;
    
    if HasIsAbelianCategory( A ) and IsAbelianCategory( A ) then
        
        SetIsAbelianCategory( DirectSum, true );
        
    fi;
    
    if HasIsSkeletalCategory( A )and IsSkeletalCategory( A ) then
        
        SetIsSkeletalCategory( DirectSum, true );
        
    fi;
    
    INSTALL_FUNCTIONS_FOR_DIRECT_SUM_OF_ADDITIVE_CATEGORY( DirectSum );
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        if IsCategoryOfRows( A ) and
           HasIsFieldForHomalg( UnderlyingRing( A ) ) and
           IsFieldForHomalg( UnderlyingRing( A ) )
        then
            
            ADD_FUNCTIONS_FOR_DirectSumOfAdditiveCategory_Rows_Field( DirectSum );
            
        fi;
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( DirectSum );
        
    fi;
    
    return DirectSum;
    
end ) );

####################################
##
## Basic operations
##
####################################

InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_DIRECT_SUM_OF_ADDITIVE_CATEGORY,
  
  function( DirectSum )
    local compare_morphisms, A;
    
    ##
    AddObjectDatum( DirectSum,
      function( DirectSum, object )
        
        return TripleOfNrSupportListOfSupportListOfObjects( object );
        
    end );
    
    ##
    AddObjectConstructor( DirectSum,
      function( DirectSum, triple )
        local A, nr_support, support, objects;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := triple[1];
        support := triple[2];
        objects := triple[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= nr_support and nr_support <= NrSummands( DirectSum ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = nr_support );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( objects ) = nr_support );
        
        # The supporting integers must be between 1 and NrSummands( DirectSum ).
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support ], i ->
            1 <= support[i] and support[i] <= NrSummands( DirectSum ) ) );
        
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support - 1 ], i ->
            support[i] < support[i+1] ) );
        
        # Assert( 0, ForAll( objects, object -> not IsZeroForObjects( A, object ) ) );
        
        return CreateCapCategoryObjectWithAttributes( DirectSum,
                       TripleOfNrSupportListOfSupportListOfObjects, triple );
                       
    end );
    
    ##
    AddMorphismDatum( DirectSum,
      function( DirectSum, morphism )
        
        return TripleOfNrSupportListOfSupportListOfMorphisms( morphism );
        
    end );
    
    ##
    AddMorphismConstructor( DirectSum,
      function( DirectSum, S, triple, T )
        local A, nr_support, support, morphisms, nr_support_source, support_source, objects_source, nr_support_target, support_target, objects_target, i, current_support, rows_morphism, source, target, s, zero_object, zero_morphism, t;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := triple[1];
        support := triple[2];
        morphisms := triple[3];
        
        nr_support_source := TripleOfNrSupportListOfSupportListOfObjects( S )[1];
        support_source := TripleOfNrSupportListOfSupportListOfObjects( S )[2];
        objects_source := TripleOfNrSupportListOfSupportListOfObjects( S )[3];
        
        nr_support_target := TripleOfNrSupportListOfSupportListOfObjects( T )[1];
        support_target := TripleOfNrSupportListOfSupportListOfObjects( T )[2];
        objects_target := TripleOfNrSupportListOfSupportListOfObjects( T )[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= nr_support and nr_support <= NrSummands( DirectSum ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = nr_support );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( morphisms ) = nr_support );
        
        # The supporting integers must be between
        # 1 and NrSummands( DirectSum ).
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support ], i ->
            1 <= support[i] and support[i] <= NrSummands( DirectSum ) ) );
        
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support - 1 ], i ->
            support[i] < support[i+1] ) );
        
        # For all morphisms in 'morphisms',
        # the source and target at a support must be equal to the objects
        # in 'S' and 'T' at the same support.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. nr_support ] do
            
            current_support := support[i];
            
            rows_morphism := morphisms[i];
            
            source := Source( rows_morphism );
            target := Target( rows_morphism );
            
            Assert( 0,
                IsEqualForObjects( A, source, Component( S, current_support ) ) and
                IsEqualForObjects( A, target, Component( T, current_support ) ) );
                
        od;
        
        # For any object s in 'S' there must be a morphism m
        # at the same support with Source( m ) = s.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. nr_support_source ] do
            
            current_support := support_source[i];
            
            s := objects_source[i];
            
            zero_object := ZeroObject( A );
            zero_morphism := ZeroMorphism( A, zero_object, zero_object );
            
            # Get the morphism at support i or a 0x0 morphism.
            rows_morphism := [ [ zero_morphism ], morphisms{ Positions( support, current_support ) } ][ BooleanToInteger( current_support in support ) + 1 ][1];
            
            source := Source( rows_morphism );
            
            Assert( 0, IsEqualForObjects( A, s, source ) );
            
        od;
        
        # For any object t in 'T' there must be a morphism m
        # at the same support with Target( m ) = t.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. nr_support_target ] do
            
            current_support := support_target[i];
            
            t := objects_target[i];
            
            zero_object := ZeroObject( A );
            zero_morphism := ZeroMorphism( A, zero_object, zero_object );
            
            # Get the morphism at support i or a 0x0 morphism.
            rows_morphism := [ [ zero_morphism ], morphisms{ Positions( support, current_support ) } ][ BooleanToInteger( current_support in support ) + 1 ][1];
            
            target := Target( rows_morphism );
            
            Assert( 0, IsEqualForObjects( A, t, target ) );
            
        od;
        
        return CreateCapCategoryMorphismWithAttributes(
                    DirectSum,
                    S,
                    T,
                    TripleOfNrSupportListOfSupportListOfMorphisms, triple );
                    
    end );
    
    ##
    AddIsWellDefinedForObjects( DirectSum,
      function( DirectSum, object )
        local A, nr_support, support, components;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := NrSupport( object );
        support := Support( object );
        components := Components( object );
        
        if nr_support <> Length( support ) or nr_support <> Length( components ) then
            
            return false;
            
        elif not ForAll( support, n ->
            1 <= n and n <= NrSummands( DirectSum ) ) then
            
            return false;
            
        # All support must be strictly increasing.
        elif not ForAll( [ 1 .. nr_support - 1 ], n -> support[n] < support[n+1] ) then
            
            return false;
            
        elif not ForAll( [ 1 .. nr_support ], n -> IsWellDefinedForObjects( A, components[n] ) ) then
            
            return false;
            
        # Zero components are not allowed in a sparse datastructure.
        elif ForAny( [ 1 .. nr_support ], n -> IsZeroForObjects( A, components[n] ) ) then
            
            return false;
            
        else
            
            return true;
            
        fi;
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( DirectSum,
      function( DirectSum, morphism )
        local A, nr_support, support, components;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := NrSupport( morphism );
        support := Support( morphism );
        components := Components( morphism );
        
        if nr_support <> Length( support ) or nr_support <> Length( components ) then
            
            return false;
            
        elif not ForAll( support, n ->
            1 <= n and n <= NrSummands( DirectSum ) ) then
            
            return false;
            
        # All support must be strictly increasing.
        elif not ForAll( [ 1 .. nr_support - 1 ], n -> support[n] < support[n+1] ) then
            
            return false;
            
        elif not ForAll( [ 1 .. nr_support ], n -> IsWellDefinedForMorphisms( A, components[n] ) ) then
            
            return false;
            
        # 0x0 components are not allowed in a sparse datastructure.
        elif ForAny( [ 1 .. nr_support ], n ->
            IsZeroForObjects( A, Source( components[n] ) ) and
            IsZeroForObjects( A, Target( components[n] ) ) ) then
            
            return false;
            
            
        # TODO: Check if source/target objects match the sources/targets
        #       of the components in the category of rows.
        #       See MorphismConstructor.
        
        else
            
            return true;
            
        fi;
        
    end );
    
    ##
    AddIsEqualForObjects( DirectSum,
      function( DirectSum, object_1, object_2 )
        local A, nr_support_1, nr_support_2, support_1, support_2, components_1, components_2;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support_1 := NrSupport( object_1 );
        support_1 := Support( object_1 );
        components_1 := Components( object_1 );
        
        nr_support_2 := NrSupport( object_2 );
        support_2 := Support( object_2 );
        components_2 := Components( object_2 );
        
        return nr_support_1 = nr_support_2 and support_1 = support_2 and
            ForAll( [ 1 .. nr_support_1 ], i ->
                IsEqualForObjects( A, components_1[i], components_2[i] ) );
                
    end );
    
    compare_morphisms :=
      function( DirectSum, morphism_1, morphism_2, comparison_function )
        local A, nr_support_1, nr_support_2, support_1, support_2, components_1, components_2;
        #% CAP_JIT_RESOLVE_FUNCTION
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support_1 := NrSupport( morphism_1 );
        support_1 := Support( morphism_1 );
        components_1 := Components( morphism_1 );
        
        nr_support_2 := NrSupport( morphism_2 );
        support_2 := Support( morphism_2 );
        components_2 := Components( morphism_2 );
        
        return nr_support_1 = nr_support_2 and support_1 = support_2 and
            ForAll( [ 1 .. nr_support_1 ], i ->
                comparison_function( A, components_1[i], components_2[i] ) );
                
    end;
    
    ##
    AddIsEqualForMorphisms( DirectSum,
      function( DirectSum, morphism_1, morphism_2 )
        
        return compare_morphisms( DirectSum, morphism_1, morphism_2, IsEqualForMorphisms );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( DirectSum,
      function( DirectSum, morphism_1, morphism_2 )
        
        return compare_morphisms( DirectSum, morphism_1, morphism_2, IsCongruentForMorphisms );
        
    end );
    
    ##
    AddIdentityMorphism( DirectSum,
      function( DirectSum, object )
        local A, nr_support, support, components, identity_morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := NrSupport( object );
        support := Support( object );
        components := Components( object );
        
        identity_morphisms :=
            List( [ 1 .. nr_support ], n ->
               IdentityMorphism( A, components[n] ) );
        
        return MorphismConstructor( DirectSum,
                    object,
                    NTuple( 3, nr_support, support, identity_morphisms ),
                    object );
                    
    end );
    
    ##
    AddPreCompose( DirectSum,
      function( DirectSum, morphism_1, morphism_2 )
        local A, support_1, support_2, support, nr_support, precomposed_morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support_1 := Support( morphism_1 );
        support_2 := Support( morphism_2 );
        
        support := Union2( support_1, support_2 );
        
        nr_support := Length( support );
        
        precomposed_morphisms :=
            List( [ 1 .. nr_support ], n ->
                PreCompose( A, Component( morphism_1, support[n] ), Component( morphism_2, support[n] ) ) );
        
        return MorphismConstructor( DirectSum,
                    Source( morphism_1 ),
                    NTuple( 3, nr_support, support, precomposed_morphisms ),
                    Target( morphism_2 ) );
                    
    end );
    
    ##
    AddZeroObject( DirectSum,
      function( DirectSum )
        
        return
            ObjectConstructor( DirectSum,
                NTuple( 3,
                    0,
                    CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ),
                    CapJitTypedExpression( [ ], cat ->
                        CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingAdditiveCategory( cat ) ) ) ) ) );
                        
    end );
    
    ##
    AddZeroMorphism( DirectSum,
      function( DirectSum, source, target )
        local A, support_1, support_2, support, zero_morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support_1 := Support( source );
        support_2 := Support( target );
        
        support := Union2( support_1, support_2 );
        
        zero_morphisms :=
            List( support, i ->
                ZeroMorphism( A, Component( source, i ), Component( target, i ) ) );
        
        return MorphismConstructor( DirectSum,
                    source,
                    NTuple( 3, Length( support ), support, zero_morphisms ),
                    target );
                    
    end );
    
    ##
    AddIsZeroForMorphisms( DirectSum,
      function( DirectSum, morphism )
        local A, nr_support, morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := NrSupport( morphism );
        morphisms := Components( morphism );
        
        return ForAll( [ 1 .. nr_support ], n -> IsZeroForMorphisms( A, morphisms[n] ) );
        
    end );
    
    ##
    AddAdditionForMorphisms( DirectSum,
      function( DirectSum, morphism_1, morphism_2 )
        local A, support_1, support_2, support, nr_support, added_morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support_1 := Support( morphism_1 );
        support_2 := Support( morphism_2 );
        
        support := Union2( support_1, support_2 );
        
        nr_support := Length( support );
        
        added_morphisms :=
            List( [ 1 .. nr_support ], n ->
                AdditionForMorphisms( A, Component( morphism_1, support[n] ), Component( morphism_2, support[n] ) ) );
                
        return MorphismConstructor( DirectSum,
                    Source( morphism_1 ),
                    NTuple( 3, nr_support, support, added_morphisms ),
                    Target( morphism_1 ) );
                    
    end );
    
    ## TODO: Gives warnings when compiling SkeletalCategoryOfGroupRepresentations
    ##       about number of occurrences of `CreateCapCategoryMorphismWithAttributes`.
    ##
    # AddSumOfMorphisms( DirectSum,
    #   function( DirectSum, source, morphisms, target )
    #     local A, nr_morphisms, support, nr_support, morphism_matrix, summed_morphisms;
    #
    #     A := UnderlyingAdditiveCategory( DirectSum );
    #
    #     nr_morphisms := Length( morphisms );
    #
    #     support := Union( List( [ 1 .. nr_morphisms ], i ->
    #         Support( morphisms[i] ) ) );
    #
    #     nr_support := Length( support );
    #
    #     morphism_matrix := List( [ 1 .. nr_support ], i ->
    #         List( [ 1 .. nr_morphisms ], j -> Component( morphisms[j], support[i] ) ) );
    #
    #     summed_morphisms := List( [ 1 .. nr_support ], i ->
    #         SumOfMorphisms( A,
    #             Component( source, support[i] ),
    #             morphism_matrix[i],
    #             Component( target, support[i] ) ) );
    #
    #     return MorphismConstructor( DirectSum,
    #                 source,
    #                 NTuple( 3, nr_support, support, summed_morphisms ),
    #                 target );
    #
    # end );
    
    ##
    AddAdditiveInverseForMorphisms( DirectSum,
      function( DirectSum, morphism )
        local A, nr_support, support, morphisms, inverse_morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        nr_support := NrSupport( morphism );
        
        support := Support( morphism );
        
        morphisms := Components( morphism );
        
        inverse_morphisms :=
            List( [ 1 .. nr_support ], n ->
                AdditiveInverseForMorphisms( A, morphisms[n] ) );
        
        return MorphismConstructor( DirectSum,
                    Source( morphism ),
                    NTuple( 3, nr_support, support, inverse_morphisms ),
                    Target( morphism ) );
                    
    end );
    
    ##
    AddDirectSum( DirectSum,
      function( DirectSum, diagram )
        local A, support, nr_support, sums;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support := Union( List( diagram, obj -> Support( obj ) ) );
        
        nr_support := Length( support );
        
        # Due to calling 'Component' below for all support, we might sum over many zeros.
        sums := List( [ 1 .. nr_support ], n ->
            DirectSum( A, List( diagram, obj -> Component( obj, support[n] ) ) ) );
            
        return ObjectConstructor( DirectSum, NTuple( 3, nr_support, support, sums ) );
        
    end );
    
    ##
    AddProjectionInFactorOfDirectSumWithGivenDirectSum( DirectSum,
      function( DirectSum, objects, projection_number, direct_sum_object )
        local A, support, morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support := Support( direct_sum_object );
        
        morphisms :=
            List( support, function( i )
                local objects_list;
                
                objects_list := List( objects, obj -> Component( obj, i ) );
                
                return ProjectionInFactorOfDirectSumWithGivenDirectSum( A,
                            objects_list,
                            projection_number,
                            Component( direct_sum_object, i ) );
                            
            end );
            
        return MorphismConstructor( DirectSum,
                    direct_sum_object,
                    NTuple( 3,
                        NrSupport( direct_sum_object ),
                        support,
                        morphisms ),
                    objects[ projection_number ] );
                    
    end );
    
    ##
    AddInjectionOfCofactorOfDirectSumWithGivenDirectSum( DirectSum,
      function( DirectSum, objects, injection_number, direct_sum_object )
        local A, support, morphisms;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support := Support( direct_sum_object );
        
        morphisms :=
            List( support, function( i )
                local objects_list;
                
                objects_list := List( objects, obj -> Component( obj, i ) );
                
                return InjectionOfCofactorOfDirectSumWithGivenDirectSum( A,
                            objects_list,
                            injection_number,
                            Component( direct_sum_object, i ) );
                            
            end );
            
        return MorphismConstructor( DirectSum,
                    objects[ injection_number ],
                    NTuple( 3,
                        NrSupport( direct_sum_object ),
                        support,
                        morphisms ),
                    direct_sum_object );
                    
    end );
    
    ##
    AddUniversalMorphismIntoDirectSumWithGivenDirectSum( DirectSum,
      function( DirectSum, diagram, test_object, morphisms, direct_sum )
        local A, support_test_object, support_direct_sum, support, nr_support, list_of_universal_mors;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support_test_object := Support( test_object );
        
        support_direct_sum := Support( direct_sum );
        
        support := Union2( support_test_object, support_direct_sum );
        
        nr_support := Length( support );
        
        list_of_universal_mors :=
            List( [ 1 .. nr_support ], n ->
                UniversalMorphismIntoDirectSumWithGivenDirectSum( A,
                    List( diagram, s -> Component( s, support[n] ) ),
                    Component( test_object, support[n] ),
                    List( morphisms, morphism -> Component( morphism, support[n] ) ),
                    Component( direct_sum, support[n] ) ) );
                    
        return MorphismConstructor( DirectSum,
                    test_object,
                    NTuple( 3, nr_support, support, list_of_universal_mors ),
                    direct_sum );
                    
    end );
    
    ##
    AddUniversalMorphismFromDirectSumWithGivenDirectSum( DirectSum,
      function( DirectSum, diagram, test_object, morphisms, direct_sum )
        local A, support_test_object, support_direct_sum, support, nr_support, list_of_universal_mors;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support_test_object := Support( test_object );
        
        support_direct_sum := Support( direct_sum );
        
        support := Union2( support_test_object, support_direct_sum );
        
        nr_support := Length( support );
        
        list_of_universal_mors :=
            List( [ 1 .. nr_support ], n ->
                UniversalMorphismFromDirectSumWithGivenDirectSum( A,
                    List( diagram, s -> Component( s, support[n] ) ),
                    Component( test_object, support[n] ),
                    List( morphisms, morphism -> Component( morphism, support[n] ) ),
                    Component( direct_sum, support[n] ) ) );
                    
        return MorphismConstructor( DirectSum,
                    direct_sum,
                    NTuple( 3, nr_support, support, list_of_universal_mors ),
                    test_object );
                    
    end );
    
    ##
    AddDirectSumFunctorialWithGivenDirectSums( DirectSum,
      function( cat, direct_sum_source, source_diagram, morphism_diagram, target_diagram, direct_sum_target )
        local A, support, nr_support, sums;
        
        A := UnderlyingAdditiveCategory( DirectSum );
        
        support := Union( List( morphism_diagram, mor -> Support( mor ) ) );
        
        nr_support := Length( support );
        
        # Due to calling 'Component' below for all supports, we might sum over many zeros.
        sums := List( [ 1 .. nr_support ], n ->
            DirectSumFunctorialWithGivenDirectSums( A,
                Component( direct_sum_source, support[n] ),
                List( source_diagram, source -> Component( source, support[n] ) ),
                List( morphism_diagram, morphism -> Component( morphism, support[n] ) ),
                List( target_diagram, target -> Component( target, support[n] ) ),
                Component( direct_sum_target, support[n] ) ) );
                
        return MorphismConstructor( DirectSum,
                    direct_sum_source,
                    NTuple( 3, nr_support, support, sums ),
                    direct_sum_target );
                    
    end );
    
    A := UnderlyingAdditiveCategory( DirectSum );
    
    if HasIsLinearCategoryOverCommutativeRing( A ) and
       IsLinearCategoryOverCommutativeRing( A )
    then
      
      ##
      AddMultiplyWithElementOfCommutativeRingForMorphisms( DirectSum,
        function( DirectSum, r, alpha )
          local A, nr_support, support, morphisms, multiplied_morphisms;
          
          A := UnderlyingAdditiveCategory( DirectSum );
          
          nr_support := NrSupport( alpha );
          
          support := Support( alpha );
          
          morphisms := Components( alpha );
          
          multiplied_morphisms := List( [ 1 .. nr_support ], n ->
              MultiplyWithElementOfCommutativeRingForMorphisms( A, r, morphisms[n] ) );
              
          return MorphismConstructor( DirectSum,
                    Source( alpha ),
                    NTuple( 3, nr_support, support, multiplied_morphisms ),
                    Target( alpha ) );
                    
      end );
      
    fi;
    
    if IsAbelianCategory( A ) then
        
        ##
        AddKernelObject( DirectSum,
          function( DirectSum, morphism )
            local A, nr_support, support, morphisms, kernel_objects, positions, new_nr_support, new_support, non_zero_kernel_objects;
            
            A := UnderlyingAdditiveCategory( DirectSum );
            
            nr_support := NrSupport( morphism );
            
            support := Support( morphism );
            
            morphisms := Components( morphism );
            
            # Take the kernel object of all morphisms.
            kernel_objects := List( [ 1 .. nr_support ], i -> KernelObject( A, morphisms[i] ) );
            
            # Positions of non-zero kernel objects.
            positions := Filtered( [ 1 .. nr_support ], i -> not IsZeroForObjects( A, kernel_objects[i] ) );
            
            new_nr_support := Length( positions );
            
            new_support := support{ positions };
            
            non_zero_kernel_objects := kernel_objects{ positions };
            
            return ObjectConstructor( DirectSum,
                        NTuple( 3,
                            new_nr_support,
                            new_support,
                            non_zero_kernel_objects ) );
                            
        end );
        
        ##
        AddKernelEmbeddingWithGivenKernelObject( DirectSum,
          function( DirectSum, morphism, kernel_object )
            local A, nr_support, support, morphisms, kernel_embeddings, positions, new_nr_support, new_support, non_zero_kernel_embeddings;
            
            A := UnderlyingAdditiveCategory( DirectSum );
            
            nr_support := NrSupport( morphism );
            
            support := Support( morphism );
            
            morphisms := Components( morphism );
            
            # Take the kernel embedding of all morphisms.
            kernel_embeddings :=
                List( [ 1 .. nr_support ], i ->
                    KernelEmbeddingWithGivenKernelObject( A, morphisms[i], Component( kernel_object, support[i] ) ) );
                    
            # Positions of non 0x0 morphisms.
            positions :=
                Filtered( [ 1 .. nr_support ], i ->
                    not ( IsZeroForObjects( A, Source( kernel_embeddings[i] ) ) and
                          IsZeroForObjects( A, Target( kernel_embeddings[i] ) ) ) );
                          
            new_nr_support := Length( positions );
            
            new_support := support{ positions };
            
            non_zero_kernel_embeddings := kernel_embeddings{ positions };
            
            return MorphismConstructor( DirectSum,
                        kernel_object,
                        NTuple( 3,
                            new_nr_support,
                            new_support,
                            non_zero_kernel_embeddings ),
                        Source( morphism ) );
                        
        end );
        
        ##
        AddLift( DirectSum,
          function( DirectSum, alpha, beta )
            local A, source, target, support, nr_support, morphism_list;
            
            A := UnderlyingAdditiveCategory( DirectSum );
            
            source := Source( alpha );
            target := Source( beta );
            
            support := Union2( Support( source ), Support( target ) );
            
            nr_support := Length( support );
            
            morphism_list :=
                List( [ 1 .. nr_support ], i ->
                   Lift( A, Component( alpha, support[i] ), Component( beta, support[i] ) ) );
                   
            return MorphismConstructor( DirectSum,
                        source,
                        NTuple( 3,
                            nr_support,
                            support,
                            morphism_list ),
                        target );
                        
        end );
        
        ##
        AddCokernelObject( DirectSum,
          function( DirectSum, morphism )
            local A, nr_support, support, morphisms, cokernel_objects, positions, new_nr_support, new_support, non_zero_cokernel_objects;
            
            A := UnderlyingAdditiveCategory( DirectSum );
            
            nr_support := NrSupport( morphism );
            
            support := Support( morphism );
            
            morphisms := Components( morphism );
            
            # Take the cokernel object of all morphisms.
            cokernel_objects := List( [ 1 .. nr_support ], i -> CokernelObject( A, morphisms[i] ) );
            
            # Positions of non-zero cokernel objects.
            positions := Filtered( [ 1 .. nr_support ], i -> not IsZeroForObjects( A, cokernel_objects[i] ) );
            
            new_nr_support := Length( positions );
            
            new_support := support{ positions };
            
            non_zero_cokernel_objects := cokernel_objects{ positions };
            
            return ObjectConstructor( DirectSum,
                        NTuple( 3,
                            new_nr_support,
                            new_support,
                            non_zero_cokernel_objects ) );
                            
        end );
        
        ##
        AddCokernelProjectionWithGivenCokernelObject( DirectSum,
          function( DirectSum, morphism, cokernel_object )
            local A, nr_support, support, morphisms, cokernel_projections, positions, new_nr_support, new_support, non_zero_cokernel_embeddings;
            
            A := UnderlyingAdditiveCategory( DirectSum );
            
            nr_support := NrSupport( morphism );
            
            support := Support( morphism );
            
            morphisms := Components( morphism );
            
            # Take the cokernel projection of all morphisms.
            cokernel_projections :=
                List( [ 1 .. nr_support ], i ->
                    CokernelProjectionWithGivenCokernelObject( A, morphisms[i], Component( cokernel_object, support[i] ) ) );
                    
            # Positions of non 0x0 morphisms.
            positions :=
                Filtered( [ 1 .. nr_support ], i ->
                    not ( IsZeroForObjects( A, Source( cokernel_projections[i] ) ) and
                          IsZeroForObjects( A, Target( cokernel_projections[i] ) ) ) );
                          
            new_nr_support := Length( positions );
            
            new_support := support{ positions };
            
            non_zero_cokernel_embeddings := cokernel_projections{ positions };
            
            return MorphismConstructor( DirectSum,
                        Target( morphism ),
                        NTuple( 3,
                            new_nr_support,
                            new_support,
                            non_zero_cokernel_embeddings ),
                        cokernel_object );
                        
        end );
        
        ##
        AddColift( DirectSum,
          function( DirectSum, alpha, beta )
            local A, source, target, support, nr_support, morphism_list;
            
            A := UnderlyingAdditiveCategory( DirectSum );
            
            source := Target( alpha );
            target := Target( beta );
            
            support := Union2( Support( source ), Support( target ) );
            
            nr_support := Length( support );
            
            morphism_list :=
                List( [ 1 .. nr_support ], i ->
                   Colift( A, Component( alpha, support[i] ), Component( beta, support[i] ) ) );
                   
            return MorphismConstructor( DirectSum,
                        source,
                        NTuple( 3,
                            nr_support,
                            support,
                            morphism_list ),
                        target );
                        
        end );
        
    fi;
    
end );

####################################
##
## Attributes
##
####################################

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsObjectInDirectSumOfAdditiveCategory ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfObjects( object )[1];
    
end );

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsMorphismInDirectSumOfAdditiveCategory ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMorphisms( morphism )[1];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsObjectInDirectSumOfAdditiveCategory ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfObjects( object )[2];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsMorphismInDirectSumOfAdditiveCategory ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMorphisms( morphism )[2];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsObjectInDirectSumOfAdditiveCategory ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfObjects( object )[3];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsMorphismInDirectSumOfAdditiveCategory ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMorphisms( morphism )[3];
    
end );

####################################
##
## Operations
##
####################################

InstallMethodForCompilerForCAP( Component,
                                [ IsObjectInDirectSumOfAdditiveCategory, IsBigInt ],
                                
  function( object, i )
    local A, zero_object, support, objects;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrSummands( CapCategory( object ) ) );
    
    A := UnderlyingAdditiveCategory( CapCategory( object ) );
    
    zero_object := ZeroObject( A );
    
    support := Support( object );
    
    objects := Components( object );
    
    return [ [ zero_object ], objects{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

InstallMethodForCompilerForCAP( Component,
                                [ IsMorphismInDirectSumOfAdditiveCategory, IsBigInt ],
                                
  function( morphism, i )
    local A, zero_object, zero_morphism, support, morphisms;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrSummands( CapCategory( morphism ) ) );
    
    A := UnderlyingAdditiveCategory( CapCategory( morphism ) );
    
    zero_object := ZeroObject( A );
    
    zero_morphism := ZeroMorphism( A, zero_object, zero_object );
    
    support := Support( morphism );
    
    morphisms := Components( morphism );
    
    return [ [ zero_morphism ], morphisms{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

##
InstallMethodForCompilerForCAP( \[\],
                                [ IsObjectInDirectSumOfAdditiveCategory, IsInt ],
                                
  function( object, i )
    
    return Component( object, i );
    
end );

##
InstallMethodForCompilerForCAP( \[\],
                                [ IsMorphismInDirectSumOfAdditiveCategory, IsInt ],
                                
  function( morphism, i )
    
    return Component( morphism, i );
    
end );

InstallOtherMethod( \/,
                   [ IsList, IsDirectSumOfAdditiveCategory ],
                  
  function( list, DirectSum )
    local A, support, source_list, target_list, support_source, support_target, source, target, support_matrices;
    
    A := UnderlyingAdditiveCategory( DirectSum );
    
    # List of integers?
    if ForAll( list, i -> IsBigInt( i ) ) and Length( list ) = NrSummands( DirectSum ) then
        
        support := Filtered( [ 1 .. Length( list ) ], i -> list[i] <> 0 );
        
        return ObjectConstructor( DirectSum, [ Length( support ), support, List( list{support}, i -> ObjectConstructor( A, i ) ) ] );
        
    # List of matrices?
    elif ForAll( list, m -> IsHomalgMatrix( m ) ) and Length( list ) = NrSummands( DirectSum ) then
        
        source_list := List( list, matrix -> NrRows( matrix ) );
        target_list := List( list, matrix -> NrCols( matrix ) );
        
        support_source := Filtered( [ 1 .. Length( source_list ) ], i -> source_list[i] <> 0 );
        support_target := Filtered( [ 1 .. Length( target_list ) ], i -> target_list[i] <> 0 );
        
        source := ObjectConstructor( DirectSum,
                                     [ Length( support_source ),
                                       support_source,
                                       List( source_list{support_source}, s -> ObjectConstructor( A, s ) ) ] );
                                       
        target := ObjectConstructor( DirectSum,
                                     [ Length( support_target ),
                                       support_target,
                                       List( target_list{support_target}, t -> ObjectConstructor( A, t ) ) ] );
                                       
        support_matrices :=
            Filtered( [ 1 .. Length( list ) ], i ->
                not ( IsZero( NrRows( list[i] ) ) and IsZero( NrCols( list[i] ) ) ) );
                
        return MorphismConstructor( DirectSum,
                    source,
                    [ Length( support_matrices ),
                      support_matrices,
                      List( list{support_matrices}, matrix -> AsCategoryOfRowsMorphism( A, matrix ) ) ],
                    target );
                    
    elif Length( list ) = 3 and
         IsBigInt( list[1] ) and
         IsList( list[2] ) and
         IsList( list[3] ) and
         ForAll( list[2], element -> IsBigInt( element ) ) and
         ForAll( list[3], element -> IsBigInt( element ) ) then
         
         return ObjectConstructor( DirectSum, [ list[1], list[2], List( list[3], i -> ObjectConstructor( A, i ) ) ] );
         
    elif Length( list ) = 3 and
         IsBigInt( list[1] ) and
         IsList( list[2] ) and
         IsList( list[3] ) and
         ForAll( list[2], element -> IsBigInt( element ) ) and
         ForAll( list[3], element -> IsHomalgMatrix( element ) ) then
         
        source_list := List( list[3], matrix -> Source( matrix ) );
        target_list := List( list[3], matrix -> Target( matrix ) );
        
        support_source := Filtered( [ 1 .. Length( source_list ) ], i -> source_list[i] <> 0 );
        support_target := Filtered( [ 1 .. Length( target_list ) ], i -> target_list[i] <> 0 );
        
        source := ObjectConstructor( DirectSum, [ Length( support_source ), support_source, List( list{support_source}, i -> ObjectConstructor( A, i ) ) ] );
        target := ObjectConstructor( DirectSum, [ Length( support_target ), support_target, List( list{support_target}, i -> ObjectConstructor( A, i ) ) ] );
        
        return MorphismConstructor( DirectSum,
                    source,
                    [ list[1], list[2], List( list[3], matrix -> AsCategoryOfRowsMorphism( A, matrix ) ) ],
                    target );
                    
    else
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "wrong format for <list>\n" );
        
    fi;
    
end );

####################################
##
## View & Display
##
####################################

InstallMethod( DisplayString,
               [ IsObjectInDirectSumOfAdditiveCategory ],
               
  object -> String( TripleOfNrSupportListOfSupportListOfObjects( object ) )
  
);

InstallMethod( DisplayString,
               [ IsMorphismInDirectSumOfAdditiveCategory ],
               
  function( morphism )
    local string, nr_support, support, morphisms, i, rows_morphism, target, nr_rows, nr_cols, j, k;
    
    string := "";
    
    nr_support := NrSupport( morphism );
    support := Support( morphism );
    morphisms := Components( morphism );
    
    for i in [ 1 .. nr_support ]  do
        
        rows_morphism := morphisms[i];
        
        nr_rows := RankOfObject( Source( rows_morphism ) );
        
        # 0xn morphism in category of rows?
        if nr_rows = 0 then
            
            nr_cols := RankOfObject( Target( rows_morphism ) );
            
            string := Concatenation( string,
                                     "Component ", String( support[i] ),
                                     ": a ", String( 0 ), " x ", String( nr_cols ),
                                     " morphism in ",
                                     Name( UnderlyingAdditiveCategory( CapCategory( morphism ) ) ), "\n\n" );
                                     
            continue;
            
        fi;
        
        nr_cols := RankOfObject( Target( rows_morphism ) );
        
        # nx0 morphism in category of rows?
        if nr_cols = 0 then
            
            string := Concatenation( string,
                                     "Component ", String( support[i] ),
                                     ": a ", String( nr_rows ), " x ", String( 0 ),
                                     " morphism in ",
                                     Name( UnderlyingAdditiveCategory( CapCategory( morphism ) ) ), "\n\n" );
                                     
            continue;
            
        fi;
        
        string := Concatenation( string,
                                 "Component ", String( support[i] ),
                                 ": a ", String( nr_rows ), " x ", String( nr_cols ),
                                 " morphism in ",
                                 Name( UnderlyingAdditiveCategory( CapCategory( morphism ) ) ), "\n" );
                                 
        # Not a zero morphism so we can display its values.
        for j in [ 1 .. nr_rows ] do
            
            for k in [ 1 .. nr_cols ] do
                
                string := Concatenation( string, Concatenation( "\n[", String(j), ",", String(k), "]: " ) );
                
                string := Concatenation( string, ViewString( UnderlyingMatrix( rows_morphism )[j,k] ) );
                
            od;
            
        od;
        
        string := Concatenation( string, "\n\n" );
        
    od;
    
    return string;
    
end );

