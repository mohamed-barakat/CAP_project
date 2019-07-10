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

##
AddDerivationToCAP( InternalCoHomOnMorphismsWithGivenInternalCoHoms,
                  
  function( internal_cohom_source, morphism_1, morphism_2, internal_cohom_range )
    local codual_morphism;
    
    codual_morphism := CoDualOnMorphisms( morphism_2 );
    
    return PreCompose( [
             IsomorphismFromInternalCoHomToTensorProduct( Source( morphism_1 ), Range( morphism_2 ) ),
             TensorProductOnMorphisms( morphism_1, codual_morphism ),
             IsomorphismFromTensorProductToInternalCoHom( Range( morphism_1 ), Source( morphism_2 ) ) 
           ] );
    
end : CategoryFilter := IsRigidSymmetricCoclosedMonoidalCategory,
      Description := "InternalCoHomOnMorphismsWithGivenInternalCoHoms using functoriality of CoDual and TensorProduct" );

##
AddDerivationToCAP( MorphismToCoBidualWithGivenCoBidual,
                  
  function( object, cobidual )
    
    return Inverse( MorphismFromCoBidualWithGivenCoBidual( object, cobidual ) );
    
end : CategoryFilter := IsRigidSymmetricCoclosedMonoidalCategory,
      Description := "MorphismToCoBidualWithGivenCoBidual as the inverse of MorphismFromCoBidualWithGivenCoBidual" );

##
AddDerivationToCAP( MorphismFromCoBidualWithGivenCoBidual,
                  
  function( object, cobidual )
    
    return Inverse( MorphismToCoBidualWithGivenCoBidual( object, cobidual ) );
    
end : CategoryFilter := IsRigidSymmetricCoclosedMonoidalCategory,
      Description := "MorphismFromCoBidualWithGivenCoBidual as the inverse of MorphismToCoBidualWithGivenCoBidual" );

##
AddDerivationToCAP( CoEvaluationMorphismWithGivenRange,
                  
  function( object_1, object_2, object_2_tensored_internal_cohom )
    local morphism;
    
    morphism := PreCompose( [
                  LeftUnitorInverse( object_1 ),
                  
                  TensorProductOnMorphisms(
                    CoEvaluationForCoDual( object_2 ),
                    IdentityMorphism( object_1 ) ),
                  
                  AssociatorLeftToRight( object_2, CoDualOnObjects( object_2 ), object_1 ),
                  
                  TensorProductOnMorphisms(
                    IdentityMorphism( object_2 ),
                    Braiding( CoDualOnObjects( object_2 ), object_1 ) ),
                  
                  TensorProductOnMorphisms( 
                    IdentityMorphism( object_2 ),
                    IsomorphismFromTensorProductToInternalCoHom( object_1, object_2 ) ) 
                ] );
                    
    return morphism;
    
end : CategoryFilter := IsRigidSymmetricCoclosedMonoidalCategory,
      Description := "CoEvaluationMorphismWithGivenRange using the rigidity of the monoidal category" );

##
AddDerivationToCAP( CoEvaluationMorphismWithGivenRange,
                    
  function( object_1, object_2, object_2_tensored_internal_cohom )
    local morphism;
    
    morphism := PreCompose( [
                  TensorProductOnMorphisms(
                    CoEvaluationForCoDual( object_2 ),
                    IdentityMorphism( object_1 ) ),
                  
                  TensorProductOnMorphisms(
                    IdentityMorphism( object_2 ),
                    Braiding( CoDualOnObjects( object_2 ), object_1 ) ),
                  
                  TensorProductOnMorphisms( 
                    IdentityMorphism( object_2 ),
                    IsomorphismFromTensorProductToInternalCoHom( object_1, object_2 ) ) 
                ] );
                    
    return morphism;
      
end : CategoryFilter := IsRigidSymmetricCoclosedMonoidalCategory and IsStrictMonoidalCategory,
      Description := "CoEvaluationMorphismWithGivenRange using the rigidity and strictness of the monoidal category" );
