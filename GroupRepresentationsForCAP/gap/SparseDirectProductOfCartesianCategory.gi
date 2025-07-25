# SPDX-License-Identifier: GPL-2.0-or-later
# AdditiveClosuresForCAP: Additive closures for pre-abelian categories
#
# Implementations
#

# Read precompiled categories
# ReadPackage( "AdditiveClosuresForCAP", "gap/precompiled_categories/SparseDirectProductOfCartesianCategory_Rows_Field.gi" );

####################################
##
## Constructors
##
####################################

##
InstallMethod( SparseDirectProductOfCartesianCategory,
               [ IsBigInt, IsCapCategory ],
               
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, nr_summands, C )
    local name, object_datum_type, morphism_datum_type, SP, compare_morphisms, object_datum, object_constructor, morphism_datum, morphism_constructor, SubscriptDigits, ToSubscript;
    
    Assert( 0, nr_summands > 0 );
    
    ##
    name := Concatenation( "𝚷( ", String( nr_summands ), ", ", Name( C ), " )" );
    
    ##
    object_datum_type :=
        CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( C ) ) );
    
    ##
    morphism_datum_type := CapJitDataTypeOfNTupleOf( 3,
            IsBigInt,
            CapJitDataTypeOfListOf( IsBigInt ),
            CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
    ##
    SP :=
        CreateCapCategoryWithDataTypes(
            name,
            IsSparseDirectProductOfCartesianCategory,
            IsObjectInSparseDirectProductOfCartesianCategory,
            IsMorphismInSparseDirectProductOfCartesianCategory,
            IsCapCategoryTwoCell,
            object_datum_type,
            morphism_datum_type,
            fail );
    
    SetUnderlyingCartesianCategory( SP, C );
    
    SetNrFactors( SP, nr_summands );
    
    SP!.compiler_hints :=
        rec( category_attribute_names :=
            [ "NrFactors",
              "UnderlyingCartesianCategory" ] );
    
    SetIsCartesianCategory( C, true );
    
    if HasIsSkeletalCategory( C )and IsSkeletalCategory( C ) then
        
        SetIsSkeletalCategory( SP, true );
        
    fi;
    
    INSTALL_FUNCTIONS_FOR_SPARSE_DIRECT_PRODUCT_OF_CARTESIAN_CATEGORY( SP );
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        if IsCategoryOfRows( C ) and
           HasIsFieldForHomalg( UnderlyingRing( C ) ) and
           IsFieldForHomalg( UnderlyingRing( C ) )
        then
            
            # ADD_FUNCTIONS_FOR_SparseDirectProductOfCartesianCategory_Rows_Field( SP );
            
        fi;
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( SP );
        
    fi;
    
    return SP;
    
end ) );

####################################
##
## Basic operations
##
####################################

InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SPARSE_DIRECT_PRODUCT_OF_CARTESIAN_CATEGORY,
  
  function( SP )
    local compare_morphisms, C;
    
    ##
    AddObjectDatum( SP,
      function( SP, object )
        
        return TripleOfNrSupportListOfSupportListOfObjects( object );
        
    end );
    
    ##
    AddObjectConstructor( SP,
      function( SP, triple )
        local C, nr_support, support, objects;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := triple[1];
        support := triple[2];
        objects := triple[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= nr_support and nr_support <= NrFactors( SP ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = nr_support );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( objects ) = nr_support );
        
        # The supporting integers must be between
        # 1 and NrFactors( SP ).
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support ], i ->
            1 <= support[i] and support[i] <= NrFactors( SP ) ) );
        
        # The supporting integers must be strictly increasing.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support - 1 ], i ->
            support[i] < support[i+1] ) );
        
        # Assert( 0, ForAll( objects, object -> not IsTerminal( C, object ) ) );
        
        return CreateCapCategoryObjectWithAttributes( SP,
                       TripleOfNrSupportListOfSupportListOfObjects, triple );
                       
    end );
    
    ##
    AddMorphismDatum( SP,
      function( SP, morphism )
        
        return TripleOfNrSupportListOfSupportListOfMorphisms( morphism );
        
    end );
    
    ##
    AddMorphismConstructor( SP,
      function( SP, S, triple, T )
        local C, nr_support, support, morphisms, source_nr_support, source_support, source_components, target_nr_support, target_support, target_components, i, current_support, rows_morphism, source, target, s, terminal_object, terminal_morphism, t;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := triple[1];
        support := triple[2];
        morphisms := triple[3];
        
        source_nr_support := NrSupport( S );
        source_support := Support( S );
        source_components := Components( S );
        
        target_nr_support := NrSupport( T );
        target_support := Support( T );
        target_components := Components( T );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= nr_support and nr_support <= NrFactors( SP ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( support ) = nr_support );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( morphisms ) = nr_support );
        
        # The supporting integers must be between
        # 1 and NrFactors( SP ).
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( [ 1 .. nr_support ], i ->
            1 <= support[i] and support[i] <= NrFactors( SP ) ) );
        
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
            
            Assert( 0, IsEqualForObjects( C, source, Component( S, current_support ) ) and
                       IsEqualForObjects( C, target, Component( T, current_support ) ) );
                       
        od;
        
        # For any object s in 'S' there must be a morphism m
        # at the same support with Source( m ) = s.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. source_nr_support ] do
            
            current_support := source_support[i];
            
            s := source_components[i];
            
            terminal_object := TerminalObject( C );
            terminal_morphism := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject(
                                        C,
                                        terminal_object,
                                        terminal_object );
            
            # Get the morphism at support i or a nx0 morphism.
            rows_morphism := [ [ terminal_morphism ], morphisms{ Positions( support, current_support ) } ][ BooleanToInteger( current_support in support ) + 1 ][1];
            
            source := Source( rows_morphism );
            
            Assert( 0, IsEqualForObjects( C, s, source ) );
            
        od;
        
        # For any object t in 'T' there must be a morphism m
        # at the same support with Target( m ) = t.
        #% CAP_JIT_DROP_NEXT_STATEMENT
        for i in [ 1.. target_nr_support ] do
            
            current_support := target_support[i];
            
            t := target_components[i];
            
            terminal_object := TerminalObject( C );
            terminal_morphism := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject(
                                        C,
                                        terminal_object,
                                        terminal_object );
            
            # Get the morphism at support i or a nx0 morphism.
            rows_morphism := [ [ terminal_morphism ], morphisms{ Positions( support, current_support ) } ][ BooleanToInteger( current_support in support ) + 1 ][1];
            
            target := Target( rows_morphism );
            
            Assert( 0, IsEqualForObjects( C, t, target ) );
            
        od;
        
        return CreateCapCategoryMorphismWithAttributes(
                    SP,
                    S,
                    T,
                    TripleOfNrSupportListOfSupportListOfMorphisms, triple );
                    
    end );
    
    ##
    AddIsWellDefinedForObjects( SP,
      function( SP, object )
        local C, nr_support, support, components;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := NrSupport( object );
        support := Support( object );
        components := Components( object );
        
        if nr_support <> Length( support ) or nr_support <> Length( components ) then
            
            return false;
            
        elif not ForAll( support, n ->
            1 <= n and n <= NrFactors( SP ) ) then
            
            return false;
            
        # All support must be strictly increasing.
        elif not ForAll( [ 1 .. nr_support - 1 ], n -> support[n] < support[n+1] ) then
            
            return false;
            
        elif not ForAll( [ 1 .. nr_support ], n -> IsWellDefinedForObjects( C, components[n] ) ) then
            
            return false;
            
        # The terminal object is not allowed in a sparse datastructure.
        elif ForAny( [ 1 .. nr_support ], n -> IsTerminal( C, components[n] ) ) then
            
            return false;
            
        else
            
            return true;
            
        fi;
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( SP,
      function( SP, morphism )
        local C, nr_support, support, components;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := NrSupport( morphism );
        support := Support( morphism );
        components := Components( morphism );
        
        if nr_support <> Length( support ) or nr_support <> Length( components ) then
            
            return false;
            
        elif not ForAll( support, n ->
            1 <= n and n <= NrFactors( SP ) ) then
            
            return false;
            
        # All support must be strictly increasing.
        elif not ForAll( [ 1 .. nr_support - 1 ], n -> support[n] < support[n+1] ) then
            
            return false;
            
        elif not ForAll( [ 1 .. nr_support ], n -> IsWellDefinedForMorphisms( C, components[n] ) ) then
            
            return false;
            
        # 0x0 components are not allowed in a sparse datastructure.
        elif ForAny( [ 1 .. nr_support ], n ->
            IsTerminal( C, Source( components[n] ) ) and
            IsTerminal( C, Target( components[n] ) ) ) then
            
            return false;
            
            
        # TODO: Check if source/target objects match the sources/targets
        #       of the components in the category of rows.
        #       See MorphismConstructor.
        
        else
            
            return true;
            
        fi;
        
    end );
    
    ##
    AddIsEqualForObjects( SP,
      function( SP, object_1, object_2 )
        local C, nr_support_1, nr_support_2, support_1, support_2, components_1, components_2;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support_1 := NrSupport( object_1 );
        support_1 := Support( object_1 );
        components_1 := Components( object_1 );
        
        nr_support_2 := NrSupport( object_2 );
        support_2 := Support( object_2 );
        components_2 := Components( object_2 );
        
        return nr_support_1 = nr_support_2 and support_1 = support_2 and
            ForAll( [ 1 .. nr_support_1 ], i ->
                IsEqualForObjects( C, components_1[i], components_2[i] ) );
                
    end );
    
    compare_morphisms :=
      function( SP, morphism_1, morphism_2, comparison_function )
        local C, nr_support_1, nr_support_2, support_1, support_2, components_1, components_2;
        #% CAP_JIT_RESOLVE_FUNCTION
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support_1 := NrSupport( morphism_1 );
        support_1 := Support( morphism_1 );
        components_1 := Components( morphism_1 );
        
        nr_support_2 := NrSupport( morphism_2 );
        support_2 := Support( morphism_2 );
        components_2 := Components( morphism_2 );
        
        return nr_support_1 = nr_support_2 and support_1 = support_2 and
            ForAll( [ 1 .. nr_support_1 ], i ->
                comparison_function( C, components_1[i], components_2[i] ) );
                
    end;
    
    ##
    AddIsEqualForMorphisms( SP,
      function( SP, morphism_1, morphism_2 )
        
        return compare_morphisms( SP, morphism_1, morphism_2, IsEqualForMorphisms );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( SP,
      function( SP, morphism_1, morphism_2 )
        
        return compare_morphisms( SP, morphism_1, morphism_2, IsCongruentForMorphisms );
        
    end );
    
    ##
    AddIdentityMorphism( SP,
      function( SP, object )
        local C, nr_support, support, components, identity_morphisms;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := NrSupport( object );
        support := Support( object );
        components := Components( object );
        
        identity_morphisms :=
            List( [ 1 .. nr_support ], n ->
               IdentityMorphism( C, components[n] ) );
        
        return MorphismConstructor( SP,
                    object,
                    NTuple( 3, nr_support, support, identity_morphisms ),
                    object );
                    
    end );
    
    ##
    AddPreCompose( SP,
      function( SP, morphism_1, morphism_2 )
        local C, support_1, support_2, support, nr_support, precomposed_morphisms;
        
        C := UnderlyingCartesianCategory( SP );
        
        support_1 := Support( morphism_1 );
        support_2 := Support( morphism_2 );
        
        support := Union2( support_1, support_2 );
        
        nr_support := Length( support );
        
        precomposed_morphisms :=
            List( [ 1 .. nr_support ], n ->
                PreCompose( C, Component( morphism_1, support[n] ), Component( morphism_2, support[n] ) ) );
        
        return MorphismConstructor( SP,
                    Source( morphism_1 ),
                    NTuple( 3, nr_support, support, precomposed_morphisms ),
                    Target( morphism_2 ) );
                    
    end );
    
    ##
    AddTerminalObject( SP,
      function( SP )
        
        return
            ObjectConstructor( SP,
                NTuple( 3,
                    0,
                    CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ),
                    CapJitTypedExpression( [ ], cat ->
                        CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCartesianCategory( cat ) ) ) ) ) );
                        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SP,
      function( SP, object, terminal_object )
        local C, nr_support, support, terminal_morphisms;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := NrSupport( object );
        support := Support( object );
        
        terminal_morphisms :=
            List( [ 1 .. nr_support ], i ->
                UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( C, Component( object, support[i] ), Component( terminal_object, support[i] ) ) );
                
        return MorphismConstructor( SP,
                    object,
                    NTuple( 3, Length( support ), support, terminal_morphisms ),
                    terminal_object );
                    
    end );
    
    ##
    AddIsTerminal( SP,
      function( SP, object )
        local C, nr_support, morphisms;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := NrSupport( object );
        object := Components( object );
        
        return ForAll( [ 1 .. nr_support ], n -> IsTerminal( C, object[n] ) );
        
    end );
    
    ##
    AddDirectProduct( SP,
      function( SP, diagram )
        local C, support, nr_support, sums;
        
        C := UnderlyingCartesianCategory( SP );
        
        support := Union( List( diagram, obj -> Support( obj ) ) );
        
        nr_support := Length( support );
        
        # Due to calling 'Component' below for all support, we might sum over many zeros.
        sums := List( [ 1 .. nr_support ], n ->
            DirectProduct( C, List( diagram, obj -> Component( obj, support[n] ) ) ) );
            
        return ObjectConstructor( SP, NTuple( 3, nr_support, support, sums ) );
        
    end );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( SP,
      function( SP, objects, projection_number, direct_sum_object )
        local C, nr_support, support, morphisms;
        
        C := UnderlyingCartesianCategory( SP );
        
        nr_support := NrSupport( direct_sum_object );
        support := Support( direct_sum_object );
        
        morphisms :=
            List( [ 1 .. nr_support ], function( i )
                local objects_list;
                
                objects_list := List( objects, obj -> Component( obj, support[i] ) );
                
                return ProjectionInFactorOfDirectProductWithGivenDirectProduct( C,
                            objects_list,
                            projection_number,
                            Component( direct_sum_object, support[i] ) );
                            
            end );
            
        return MorphismConstructor( SP,
                    direct_sum_object,
                    NTuple( 3,
                        NrSupport( direct_sum_object ),
                        support,
                        morphisms ),
                    objects[ projection_number ] );
                    
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SP,
      function( SP, target_diagram, test_object, morphisms, direct_product )
        local C, support_test_object, support_direct_product, support, nr_support, list_of_universal_mors;
        
        C := UnderlyingCartesianCategory( SP );
        
        support_test_object := Support( test_object );
        
        support_direct_product := Support( direct_product );
        
        support := Union2( support_test_object, support_direct_product );
        
        nr_support := Length( support );
        
        list_of_universal_mors :=
            List( [ 1 .. nr_support ], n ->
                UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                    List( target_diagram, s -> Component( s, support[n] ) ),
                    Component( test_object, support[n] ),
                    List( morphisms, morphism -> Component( morphism, support[n] ) ),
                    Component( direct_product, support[n] ) ) );
                    
        return MorphismConstructor( SP,
                    test_object,
                    NTuple( 3, nr_support, support, list_of_universal_mors ),
                    direct_product );
                    
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( SP,
      function( cat, direct_product_source, source_diagram, morphism_diagram, target_diagram, direct_product_target )
        local C, support, nr_support, products;
        
        C := UnderlyingCartesianCategory( SP );
        
        support := Union( List( morphism_diagram, mor -> Support( mor ) ) );
        
        nr_support := Length( support );
        
        # Due to calling 'Component' below for all supports, we might product over many zeros.
        products := List( [ 1 .. nr_support ], n ->
            DirectProductFunctorialWithGivenDirectProducts( C,
                Component( direct_product_source, support[n] ),
                List( source_diagram, source -> Component( source, support[n] ) ),
                List( morphism_diagram, morphism -> Component( morphism, support[n] ) ),
                List( target_diagram, target -> Component( target, support[n] ) ),
                Component( direct_product_target, support[n] ) ) );
                
        return MorphismConstructor( SP,
                    direct_product_source,
                    NTuple( 3, nr_support, support, products ),
                    direct_product_target );
                    
    end );
    
end );

####################################
##
## Attributes
##
####################################

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsObjectInSparseDirectProductOfCartesianCategory ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfObjects( object )[1];
    
end );

InstallMethodForCompilerForCAP( NrSupport,
                                [ IsMorphismInSparseDirectProductOfCartesianCategory ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMorphisms( morphism )[1];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsObjectInSparseDirectProductOfCartesianCategory ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfObjects( object )[2];
    
end );

InstallMethodForCompilerForCAP( Support,
                                [ IsMorphismInSparseDirectProductOfCartesianCategory ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMorphisms( morphism )[2];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsObjectInSparseDirectProductOfCartesianCategory ],
                                
  function( object )
    
    return TripleOfNrSupportListOfSupportListOfObjects( object )[3];
    
end );

InstallMethodForCompilerForCAP( Components,
                                [ IsMorphismInSparseDirectProductOfCartesianCategory ],
                                
  function( morphism )
    
    return TripleOfNrSupportListOfSupportListOfMorphisms( morphism )[3];
    
end );

####################################
##
## Operations
##
####################################

InstallMethodForCompilerForCAP( Component,
                                [ IsObjectInSparseDirectProductOfCartesianCategory, IsBigInt ],
                                
  function( object, i )
    local C, terminal_object, support, objects;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrFactors( CapCategory( object ) ) );
    
    C := UnderlyingCartesianCategory( CapCategory( object ) );
    
    terminal_object := TerminalObject( C );
    
    support := Support( object );
    
    objects := Components( object );
    
    return [ [ terminal_object ], objects{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

InstallMethodForCompilerForCAP( Component,
                                [ IsMorphismInSparseDirectProductOfCartesianCategory, IsBigInt ],
                                
  function( morphism, i )
    local C, terminal_object, terminal_morphism, support, morphisms;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, 1 <= i and i <= NrFactors( CapCategory( morphism ) ) );
    
    C := UnderlyingCartesianCategory( CapCategory( morphism ) );
    
    terminal_object := TerminalObject( C );
    
    terminal_morphism :=
        UniversalMorphismIntoTerminalObjectWithGivenTerminalObject(
            C,
            terminal_object,
            terminal_object );
            
    support := Support( morphism );
    
    morphisms := Components( morphism );
    
    return [ [ terminal_morphism ], morphisms{ Positions( support, i ) } ][ BooleanToInteger( i in support ) + 1 ][1];
    
end );

##
InstallMethodForCompilerForCAP( \[\],
                                [ IsObjectInSparseDirectProductOfCartesianCategory, IsInt ],
                                
  function( object, i )
    
    return Component( object, i );
    
end );

##
InstallMethodForCompilerForCAP( \[\],
                                [ IsMorphismInSparseDirectProductOfCartesianCategory, IsInt ],
                                
  function( morphism, i )
    
    return Component( morphism, i );
    
end );

####################################
##
## View & Display
##
####################################

InstallMethod( DisplayString,
               [ IsObjectInSparseDirectProductOfCartesianCategory ],
               
  object -> String( TripleOfNrSupportListOfSupportListOfObjects( object ) )
  
);

InstallMethod( DisplayString,
               [ IsMorphismInSparseDirectProductOfCartesianCategory ],
               
  morphism -> String( TripleOfNrSupportListOfSupportListOfMorphisms( morphism ) )
  
);

