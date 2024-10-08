# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#
#! @Chapter Irreducible Objects

####################################
##
## GAP Category
##
####################################

DeclareRepresentation( "IsGZGradedIrreducibleObjectRep",
                       IsGZGradedIrreducibleObject and IsAttributeStoringRep,
                       [ ] );

BindGlobal( "TheFamilyOfGZGradedIrreducibleObjects",
        NewFamily( "TheFamilyOfGZGradedIrreducibleObjects" ) );

BindGlobal( "TheTypeOfGZGradedIrreducibleObjects",
        NewType( TheFamilyOfGZGradedIrreducibleObjects,
                IsGZGradedIrreducibleObjectRep ) );

####################################
##
## Constructors
##
####################################

##
InstallMethodWithCache( GZGradedIrreducibleObject,
                        [ IsInt, IsCharacter ],
               
  function( degree, character )
    local number, underlying_character_table, underlying_irreducible_characters;
    
    underlying_character_table := UnderlyingCharacterTable( character );
    
    underlying_irreducible_characters := Irr( underlying_character_table );
    
    number := PositionProperty( underlying_irreducible_characters, chi -> chi = character );
    
    return ObjectifyWithAttributes( rec( ), TheTypeOfGZGradedIrreducibleObjects,
                                    UnderlyingCharacter, character,
                                    UnderlyingCharacterNumber, number,
                                    UnderlyingGroup, UnderlyingGroup( character ),
                                    UnderlyingCharacterTable, underlying_character_table,
                                    UnderlyingIrreducibleCharacters, underlying_irreducible_characters,
                                    UnderlyingDegree, degree
    );
    
end );

####################################
##
## Attributes
##
####################################

##
InstallMethod( ExteriorPower,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject ],
               
  function( object, object_2 )
    local new_degree, character, ct, irr, exterior_power, chi, scalar_product, result_list;
    
    result_list := [ ];
    
    if not( object!.UnderlyingCharacterNumber = object_2!.UnderlyingCharacterNumber ) then
        
        return result_list;
        
    fi;
    
    ct := UnderlyingCharacterTable( object );
    
    irr := UnderlyingIrreducibleCharacters( object );
    
    character := UnderlyingCharacter( object );
    
    exterior_power :=
      AntiSymmetricParts( ct, [ character ], 2 );
    
    exterior_power := exterior_power[1];
    
    new_degree := object!.UnderlyingDegree + object_2!.UnderlyingDegree;
    
    for chi in irr do
        
        scalar_product := ScalarProduct( chi, exterior_power );
        
        if scalar_product > 0 then
            
            Add( result_list, [ scalar_product, GZGradedIrreducibleObject( new_degree, chi ) ] );
            
        fi;
        
    od;
    
    return result_list;
    
end );

##
InstallMethod( Dimension,
               [ IsGZGradedIrreducibleObject ],
               
  function( object )
    
    return Degree( UnderlyingCharacter( object ) );
    
end );

##
InstallMethod( Dual,
               [ IsGZGradedIrreducibleObject ],
               
  function( object )
    
    return GZGradedIrreducibleObject( (-1) * object!.UnderlyingDegree, ComplexConjugate( UnderlyingCharacter( object ) ) );
    
end );

####################################
##
## Operations
##
####################################

##
InstallMethod( \=,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject ],
               
  function( object_1, object_2 )
    
    return ( object_1!.UnderlyingCharacterNumber = object_2!.UnderlyingCharacterNumber )
           and ( object_1!.UnderlyingDegree = object_2!.UnderlyingDegree );
    
end );

##
InstallMethod( \<,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject ],
               
  function( object_1, object_2 )
    local degree_1, degree_2;
    
    degree_1 := object_1!.UnderlyingDegree;
    
    degree_2 := object_2!.UnderlyingDegree;
    
    if degree_1 < degree_2 then
        
        return true;
        
    elif degree_1 = degree_2 then
        
        return object_1!.UnderlyingCharacterNumber < object_2!.UnderlyingCharacterNumber;
        
    else
        
        return false;
        
    fi;
    
end );

##
InstallMethod( Multiplicity,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject ],
               
  function( object_1, object_2, object_3 )
    local tensor_product;
    
    if not ( object_1!.UnderlyingDegree = object_2!.UnderlyingDegree + object_3!.UnderlyingDegree ) then
        
        return 0;
        
    fi;
    
    ## warning: this line assumes that MultiplicityArray of group has been computed yet
    return UnderlyingGroup( object_1 )!.MultiplicityArray[ object_1!.UnderlyingCharacterNumber ][ object_2!.UnderlyingCharacterNumber ][ object_3!.UnderlyingCharacterNumber ];
    
end );

##
InstallMethod( Multiplicity,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject ],
               
  function( object_1, object_2, object_3, object_4 )
    local tensor_product;
    
    if not ( object_1!.UnderlyingDegree = object_2!.UnderlyingDegree + object_3!.UnderlyingDegree + object_4!.UnderlyingDegree ) then
        
        return 0;
        
    fi;
    
    ## warning: this line assumes that MultiplicityArray of group has been computed yet
    return UnderlyingGroup( object_1 )!.MultiplicityTripleArray[ object_1!.UnderlyingCharacterNumber ][ object_2!.UnderlyingCharacterNumber ][ object_3!.UnderlyingCharacterNumber ][ object_4!.UnderlyingCharacterNumber ];
    
end );


##
InstallMethod( Multiplicity,
               [ IsRepresentationCategoryZGradedObject, IsGZGradedIrreducibleObject ],
               
  function( semisimple_category_object, irr )
    local z, deg, nr, array;
    
    z := irr!.UnderlyingDegree;
    
    if z > 0 then
        
        deg := 2*z;
        
    else
        
        deg := -2*z + 1;
        
    fi;
    
    nr := irr!.UnderlyingCharacterNumber;
    
    array := MultiplicityArray( semisimple_category_object );
    
    if IsBound( array[deg] ) and IsBound( array[deg][nr] ) then
        
        return array[deg][nr];
        
    else
        
        return 0;
        
    fi;
    
end );

##
InstallMethod( \*,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject ],
               
  function( object_1, object_2 )
    local new_degree, tensor_product, result_list, irr, chi, scalar_product;
    
    tensor_product := UnderlyingCharacter( object_1 ) * UnderlyingCharacter( object_2 );
    
    result_list := [ ];
    
    irr := UnderlyingIrreducibleCharacters( object_1 );
    
    new_degree := object_1!.UnderlyingDegree + object_2!.UnderlyingDegree;
    
    for chi in irr do
        
        scalar_product := ScalarProduct( chi, tensor_product );
        
        if scalar_product > 0 then
            
            Add( result_list, [ scalar_product, GZGradedIrreducibleObject( new_degree, chi ) ] );
            
        fi;
        
    od;
    
    return result_list;
    
end );

##
InstallMethod( TensorProductOfIrreduciblesOp,
               [ IsList, IsGZGradedIrreducibleObject ],
               
  function( list, method_selection_object )
    
    local new_degree, tensor_product, result_list, irr, chi, scalar_product;
    
    tensor_product := Product( List( list, UnderlyingCharacter ) );
    
    result_list := [ ];
    
    irr := UnderlyingIrreducibleCharacters( method_selection_object );
    
    new_degree := 
      Sum( List( list, UnderlyingDegree ) );
    
    for chi in irr do
        
        scalar_product := ScalarProduct( chi, tensor_product );
        
        if scalar_product > 0 then
            
            Add( result_list, [ scalar_product, GZGradedIrreducibleObject( new_degree, chi ) ] );
            
        fi;
        
    od;
    
    return result_list;
    
end );


##
InstallMethod( AssociatorFromData,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsList, IsMatrixCategory, IsList ],
               
  function( irr_1, irr_2, irr_3, associator_data, vec, tensor_decomposition_list )
    local data, morphism_list, elem, pos, string, homalg_matrix, vector_space;
    
    data :=
        associator_data[irr_1!.UnderlyingCharacterNumber][irr_2!.UnderlyingCharacterNumber][irr_3!.UnderlyingCharacterNumber];
    
    morphism_list := [ ];
    
    for elem in tensor_decomposition_list do
        
        pos := elem[2]!.UnderlyingCharacterNumber;
        
        string := Concatenation( "[", data[pos], "]" );
        
        homalg_matrix := HomalgMatrix( string, elem[1], elem[1], UnderlyingRing( vec ) );
        
        vector_space := MatrixCategoryObject( vec, elem[1] );
        
        Add( morphism_list, [ VectorSpaceMorphism( vector_space, homalg_matrix, vector_space ), elem[2] ] );
        
    od;
    
    return morphism_list;
    
end );

##
InstallMethod( AssociatorStringListFromData,
               [ IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsGZGradedIrreducibleObject, IsList ],
               
  function( irr_1, irr_2, irr_3, irr_4, associator_data )
    local data;
    
    if not ( irr_1!.UnderlyingDegree + irr_2!.UnderlyingDegree + irr_3!.UnderlyingDegree = irr_4!.UnderlyingDegree ) then
        
        return "";
        
    fi;
    
    data := associator_data[irr_1!.UnderlyingCharacterNumber][irr_2!.UnderlyingCharacterNumber][irr_3!.UnderlyingCharacterNumber];
    
    if IsBound( data[irr_4!.UnderlyingCharacterNumber] ) then
        
        return data[irr_4!.UnderlyingCharacterNumber];
        
    else
        
        return "";
        
    fi;
    
end );

####################################
##
## Properties
##
####################################

InstallMethod( IsYieldingIdentities,
               [ IsGZGradedIrreducibleObject ],
               
  function( object )
    
    ## is used for deciding when braiding or associator is trivial. Change name appropriately.
    return IsOne( UnderlyingCharacter( object ) );
    
end );

####################################
##
## View
##
####################################

##
InstallMethod( String,
              [ IsGZGradedIrreducibleObject ],
              
  function( object )
    
    return Concatenation( "x_[", String( object!.UnderlyingDegree ), ", ", String( object!.UnderlyingCharacterNumber ), "]" );
    
end );

##
InstallMethod( ViewString,
               [ IsGZGradedIrreducibleObject ],

  function( object )

    return Concatenation( "<", String( object ), ">" );

end );
