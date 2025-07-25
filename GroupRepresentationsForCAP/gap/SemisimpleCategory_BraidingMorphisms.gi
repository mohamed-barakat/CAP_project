# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_1_Morphism,
  function( object_a, object_b )
    local object_a_list, object_a_expanded_list;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_a_expanded_list := CAP_INTERNAL_ExpandSemisimpleCategoryObjectList( object_a_list );
    
    return RightDistributivityExpanding( object_a_expanded_list, object_b );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_2_Morphism,
  function( object_a, object_b )
    local object_a_list, object_b_list, object_b_expanded_list, summand_list, elem, morphism;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    object_b_expanded_list := CAP_INTERNAL_ExpandSemisimpleCategoryObjectList( object_b_list );
    
    summand_list := [ ];
    
    for elem in object_a_list do
        
        morphism := LeftDistributivityExpanding( elem[2], object_b_expanded_list );
        
        Append( summand_list, List( [ 1 .. elem[1] ], i -> morphism ) );
        
    od;
    
    return DirectSumFunctorial( summand_list );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_3_Morphism,
  function( object_a, object_b )
    local object_a_list, object_b_list, outer_summand_list, inner_summand_list, elem_a, elem_b, morphism;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    outer_summand_list := [ ];
    
    for elem_a in object_a_list do
        
        inner_summand_list := [ ];
        
        for elem_b in object_b_list do
            
            morphism := CAP_INTERNAL_Braiding_On_Irreducibles( elem_a[2], elem_b[2] );
            
            Append( inner_summand_list, List( [ 1 .. elem_b[1] ], i -> morphism ) );
            
        od;
        
        morphism := DirectSumFunctorial( inner_summand_list );
        
        Append( outer_summand_list, List( [ 1 .. elem_a[1] ], i -> morphism ) );
        
    od;
    
    return DirectSumFunctorial( outer_summand_list );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_4_Morphism,
  function( object_a, object_b )
    local object_a_list, object_b_list, object_b_expanded_list, summand_list, elem, morphism;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    object_b_list := SemisimpleCategoryObjectListWithActualObjects( object_b );
    
    object_b_expanded_list := CAP_INTERNAL_ExpandSemisimpleCategoryObjectList( object_b_list );
    
    summand_list := [ ];
    
    for elem in object_a_list do
        
        morphism := RightDistributivityFactoring( object_b_expanded_list, elem[2] );
        
        Append( summand_list, List( [ 1 .. elem[1] ], i -> morphism ) );
        
    od;
    
    return DirectSumFunctorial( summand_list );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_5_Morphism,
  function( object_a, object_b )
    local object_a_list, object_a_expanded_list;
    
    object_a_list := SemisimpleCategoryObjectListWithActualObjects( object_a );
    
    object_a_expanded_list := CAP_INTERNAL_ExpandSemisimpleCategoryObjectList( object_a_list );
    
    return LeftDistributivityFactoring( object_b, object_a_expanded_list );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_12_Morphism,
  function( object_a, object_b )
    local morphism_1, morphism_2;
    
    morphism_1 := SEMISIMPLECATEGORY_Braiding_1_Morphism( object_a, object_b );
    
    morphism_2 := SEMISIMPLECATEGORY_Braiding_2_Morphism( object_a, object_b );
    
    return PreCompose( morphism_1, morphism_2 );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_Braiding_45_Morphism,
  function( object_a, object_b )
    local morphism_4, morphism_5;
    
    morphism_4 := SEMISIMPLECATEGORY_Braiding_4_Morphism( object_a, object_b );
    
    morphism_5 := SEMISIMPLECATEGORY_Braiding_5_Morphism( object_a, object_b );
    
    return PreCompose( morphism_4, morphism_5 );
    
end );

InstallGlobalFunction( SEMISIMPLECATEGORY_BraidingOnIrreducibles,
  function( object_1, object_2 )
    local category, underlying_category, irr_1, irr_2, object, exterior_power_list, exterior_power, object_list, morphism_list,
          elem, number_minus_1, number_1, diagonal, homalg_mat, vector_space;
    
    category := CapCategory( object_1 );
    
    underlying_category := UnderlyingCategoryForSemisimpleCategory( category );
    
    field := underlying_category!.field_for_matrix_category;
    
    irr_1 := SemisimpleCategoryObjectList( object_1 )[1][2];
    
    irr_2 := SemisimpleCategoryObjectList( object_2 )[1][2];
    
    object := TensorProductOnObjects( object_1, object_2 );
    
    if IsYieldingIdentities( irr_1 ) or IsYieldingIdentities( irr_2 ) then
        
        return IdentityMorphism( object );
        
    fi;
    
    exterior_power_list := ExteriorPower( irr_1, irr_2 );
    
    if IsEmpty( exterior_power_list ) then
        
        return IdentityMorphism( object );
        
    fi;
    
    exterior_power := SemisimpleCategoryObject( exterior_power_list, category );
    
    object_list := SemisimpleCategoryObjectList( object );
    
    morphism_list := [ ];
    
    for elem in object_list do
        
        number_minus_1 := Multiplicity( exterior_power, elem[2] );
        
        number_1 := elem[1] - number_minus_1;
        
        diagonal := Concatenation( List( [ 1 .. number_1 ], i -> 1 ), List( [ 1 .. number_minus_1 ], i -> -1 ) );
        
        homalg_mat := HomalgDiagonalMatrix( diagonal, field );
        
        vector_space := MatrixCategoryObject( underlying_category, elem[1] );
        
        Add( morphism_list, [ VectorSpaceMorphism( vector_space, homalg_mat, vector_space ), elem[2] ] );
        
    od;
    
    return SemisimpleCategoryMorphism( object, morphism_list, object );
    
end );

