# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Implementations
#

##
AddDerivationToCAP( LeftDistributivityExpandingWithGivenObjects,
                   "LeftDistributivityExpandingWithGivenObjects using the universal property of the direct sum",
                   [ [ IdentityMorphism, 1 ],
                     [ ProjectionInFactorOfDirectSum, 2 ],
                     [ TensorProductOnMorphismsWithGivenTensorProducts, 2 ],
                     [ TensorProductOnObjects, 2 ],
                     [ UniversalMorphismIntoDirectSumWithGivenDirectSum, 1 ] ],
                    
  function( cat, factored_object, object, summands, expanded_object )
    local nr_summands, projection_list, projection_list_tensored, id, diagram;
    
    nr_summands := Length( summands );
    
    id := IdentityMorphism( cat, object );
    
    diagram := List( summands, summand -> TensorProductOnObjects( cat, object, summand ) );
    
    projection_list := List( [ 1 .. nr_summands ], i -> ProjectionInFactorOfDirectSum( cat, summands, i ) );
    
    projection_list_tensored := List( [1 .. nr_summands ],
                                      i -> TensorProductOnMorphismsWithGivenTensorProducts( cat,
                                                    factored_object,
                                                    id,
                                                    projection_list[i],
                                                    diagram[i] ) );
    
    return UniversalMorphismIntoDirectSumWithGivenDirectSum( cat, diagram, factored_object, projection_list_tensored, expanded_object );
    
end : CategoryFilter := cat -> HasIsMonoidalCategory( cat ) and IsMonoidalCategory( cat ) and HasIsAdditiveCategory( cat ) and IsAdditiveCategory( cat ) );

##
AddDerivationToCAP( LeftDistributivityFactoringWithGivenObjects,
                    "LeftDistributivityFactoringWithGivenObjects using the universal property of the direct sum",
                    [ [ IdentityMorphism, 1 ],
                      [ InjectionOfCofactorOfDirectSum, 2 ],
                      [ TensorProductOnMorphismsWithGivenTensorProducts, 2 ],
                      [ TensorProductOnObjects, 2 ],
                      [ UniversalMorphismFromDirectSumWithGivenDirectSum, 1 ] ],
                    
  function( cat, expanded_object, object, summands, factored_object )
    local nr_summands, injection_list, injection_list_tensored, id, diagram;
    
    nr_summands := Length( summands );
    
    id := IdentityMorphism( cat, object );
    
    diagram := List( summands, summand -> TensorProductOnObjects( cat, object, summand ) );
    
    injection_list := List( [ 1 .. nr_summands ], i -> InjectionOfCofactorOfDirectSum( cat, summands, i ) );
    
    injection_list_tensored := List( [1 .. nr_summands ],
                                     i -> TensorProductOnMorphismsWithGivenTensorProducts( cat,
                                                    diagram[i],
                                                    id,
                                                    injection_list[i],
                                                    factored_object ) );
    
    return UniversalMorphismFromDirectSumWithGivenDirectSum( cat, diagram, factored_object, injection_list_tensored, expanded_object );
    
end : CategoryFilter := cat -> HasIsMonoidalCategory( cat ) and IsMonoidalCategory( cat ) and HasIsAdditiveCategory( cat ) and IsAdditiveCategory( cat ) );

##
AddDerivationToCAP( RightDistributivityExpandingWithGivenObjects,
                    "RightDistributivityExpandingWithGivenObjects using the universal property of the direct sum",
                    [ [ IdentityMorphism, 1 ],
                      [ ProjectionInFactorOfDirectSum, 2 ],
                      [ TensorProductOnMorphismsWithGivenTensorProducts, 2 ],
                      [ TensorProductOnObjects, 2 ],
                      [ UniversalMorphismIntoDirectSumWithGivenDirectSum, 1 ] ],
                    
  function( cat, factored_object, summands, object, expanded_object )
    local nr_summands, projection_list, projection_list_tensored, id, diagram;
    
    nr_summands := Length( summands );
    
    id := IdentityMorphism( cat, object );
    
    diagram := List( summands, summand -> TensorProductOnObjects( cat, summand, object ) );
    
    projection_list := List( [ 1 .. nr_summands ], i -> ProjectionInFactorOfDirectSum( cat, summands, i ) );
    
    projection_list_tensored := List( [1 .. nr_summands ],
                                      i -> TensorProductOnMorphismsWithGivenTensorProducts( cat,
                                                    factored_object,
                                                    projection_list[i],
                                                    id,
                                                    diagram[i] ) );
    
    return UniversalMorphismIntoDirectSumWithGivenDirectSum( cat, diagram, factored_object, projection_list_tensored, expanded_object );
    
end : CategoryFilter := cat -> HasIsMonoidalCategory( cat ) and IsMonoidalCategory( cat ) and HasIsAdditiveCategory( cat ) and IsAdditiveCategory( cat ) );

##
AddDerivationToCAP( RightDistributivityFactoringWithGivenObjects,
                    "RightDistributivityFactoringWithGivenObjects using the universal property of the direct sum",
                    [ [ IdentityMorphism, 1 ],
                      [ InjectionOfCofactorOfDirectSum, 2 ],
                      [ TensorProductOnMorphismsWithGivenTensorProducts, 2 ],
                      [ TensorProductOnObjects, 2 ],
                      [ UniversalMorphismFromDirectSumWithGivenDirectSum, 1 ] ],
                    
  function( cat, expanded_object, summands, object, factored_object )
    local nr_summands, injection_list, injection_list_tensored, id, diagram;
    
    nr_summands := Length( summands );
    
    id := IdentityMorphism( cat, object );
    
    diagram := List( summands, summand -> TensorProductOnObjects( cat, summand, object ) );
    
    injection_list := List( [ 1 .. nr_summands ], i -> InjectionOfCofactorOfDirectSum( cat, summands, i ) );
    
    injection_list_tensored := List( [1 .. nr_summands ],
                                     i -> TensorProductOnMorphismsWithGivenTensorProducts( cat,
                                                    diagram[i],
                                                    injection_list[i],
                                                    id,
                                                    factored_object ) );
    
    return UniversalMorphismFromDirectSumWithGivenDirectSum( cat, diagram, factored_object, injection_list_tensored, expanded_object );
    
end : CategoryFilter := cat -> HasIsMonoidalCategory( cat ) and IsMonoidalCategory( cat ) and HasIsAdditiveCategory( cat ) and IsAdditiveCategory( cat ) );
