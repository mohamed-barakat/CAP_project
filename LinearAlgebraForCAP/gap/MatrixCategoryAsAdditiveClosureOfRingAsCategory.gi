# SPDX-License-Identifier: GPL-2.0-or-later
# LinearAlgebraForCAP: Category of Matrices over a Field for CAP
#
# Implementations
#

####################################
##
## Constructors
##
####################################

##
InstallMethod( MatrixCategoryAsAdditiveClosureOfRingAsCategory,
               [ IsFieldForHomalg ],
               
  function( homalg_ring )
    local ring_as_category, add, object_constructor, object_datum, morphism_constructor, morphism_datum, wrapper;
    
    ring_as_category := RingAsCategory( homalg_ring : FinalizeCategory := true );
    
    add := AdditiveClosure( ring_as_category : FinalizeCategory := true );
    
    object_constructor := function ( cat, object_datum )
        
        return MatrixCategoryObject( cat, Length( ObjectList( object_datum ) ) );
        
    end;
    
    object_datum := function ( cat, object )
      local add, ring_as_category, unique_object;
        
        add := UnderlyingCategory( cat );
        ring_as_category := UnderlyingCategory( add );
        
        unique_object := RingAsCategoryUniqueObject( ring_as_category );
        
        return AdditiveClosureObject( ListWithIdenticalEntries( Dimension( object ), unique_object ), add );
        
    end;
    
    morphism_constructor := function ( cat, source, morphism_datum, range )
      local matrix_entries, homalg_matrix;
        
        matrix_entries := List( MorphismMatrix( morphism_datum ),
            row -> List( row,
                c -> UnderlyingRingElement( c )
            )
        );
        
        homalg_matrix := HomalgMatrixListList( matrix_entries, Dimension( source ), Dimension( range ), UnderlyingRing( cat ) );
        
        return VectorSpaceMorphism( cat, source, homalg_matrix, range );
        
    end;
    
    morphism_datum := function ( cat, morphism )
      local add, ring_as_category, unique_object, nr_rows, nr_cols, source, range, matrix_entries, listlist;
        
        add := UnderlyingCategory( cat );
        ring_as_category := UnderlyingCategory( add );
        
        unique_object := RingAsCategoryUniqueObject( ring_as_category );
        
        nr_rows := NrRows( UnderlyingMatrix( morphism ) );
        nr_cols := NrCols( UnderlyingMatrix( morphism ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Dimension( Source( morphism ) ) = nr_rows );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Dimension( Range( morphism ) ) = nr_cols );
        
        source := AdditiveClosureObject( ListWithIdenticalEntries( nr_rows, unique_object ), add );
        range := AdditiveClosureObject( ListWithIdenticalEntries( nr_cols, unique_object ), add );
        
        matrix_entries := EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( morphism ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( matrix_entries ) = nr_rows );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( matrix_entries, row -> Length( row ) = nr_cols ) );
        
        listlist := List( matrix_entries,
            row -> List( row,
                c -> RingAsCategoryMorphism( ring_as_category, c )
            )
        );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( listlist ) = Length( ObjectList( source ) ) );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( listlist, row -> Length( row ) = Length( ObjectList( range ) ) ) );
        
        return AdditiveClosureMorphism( source, listlist, range );
        
    end;
    
    wrapper := WrapperCategory( add, rec(
        name := Concatenation( "Category of matrices over ", RingName( homalg_ring ) ),
        category_filter := IsMatrixCategory,
        category_object_filter := IsVectorSpaceObject and HasDimension and HasIsProjective and IsProjective,
        category_morphism_filter := IsVectorSpaceMorphism and HasUnderlyingMatrix,
        object_constructor := object_constructor,
        object_datum := object_datum,
        morphism_constructor := morphism_constructor,
        morphism_datum := morphism_datum,
        only_primitive_operations := true,
    ) : FinalizeCategory := false );
    
    SetUnderlyingRing( wrapper, homalg_ring );
    
    wrapper!.compiler_hints := rec(
        category_attribute_names := [
            "UnderlyingRing",
        ],
        source_and_range_attributes_from_morphism_attribute := rec(
            object_attribute_name := "Dimension",
            morphism_attribute_name := "UnderlyingMatrix",
            source_attribute_getter_name := "NrRows",
            range_attribute_getter_name := "NrColumns",
        ),
    );
    
    SetIsSkeletalCategory( wrapper, true );
    
    SetIsAbelianCategory( wrapper, true );
    
    # some manually precompiled functions
    
    ##
    AddZeroMorphism( wrapper,
      function( cat, source, range )
        
        return VectorSpaceMorphism( cat, source, HomalgMatrixListList( NullMatImmutable( Dimension( source ), Dimension( range ) ), Dimension( source ), Dimension( range ), homalg_ring ), range );
        
    end );
    
    ##
    AddDirectSum( wrapper,
      function( cat, object_list )
        local rank;
        
        rank := Sum( List( object_list, object -> Dimension( object ) ) );
        
        return MatrixCategoryObject( cat, rank );
        
    end );
    
    Finalize( wrapper );
    
    return wrapper;
    
end );