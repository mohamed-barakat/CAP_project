##
AddDerivationToCAP( InternalCoHomOnObjects,
                  
  function( object_1, object_2 )
    
    return Source( IsomorphismFromInternalCoHomToTensorProduct( object_1, object_2 ) );
    
end : CategoryFilter := IsRigidSymmetricCoclosedMonoidalCategory,
      Description := "InternalCoHomOnObjects as the source of IsomorphismFromInternalCoHomToTensorProduct" );

##
AddDerivationToCAP( InternalCoHomOnObjects,
                  
  function( object_1, object_2 )
    
    return Range( IsomorphismFromTensorProductToInternalCoHom( object_1, object_2 ) );
    
end : CategoryFilter := IsRigidSymmetricClosedMonoidalCategory,
      Description := "InternalCoHomOnObjects as the range of IsomorphismFromTensorProductToInternalCoHom" );
