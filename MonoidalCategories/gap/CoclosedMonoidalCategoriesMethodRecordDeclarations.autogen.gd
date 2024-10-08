# SPDX-License-Identifier: GPL-2.0-or-later
# MonoidalCategories: Monoidal and monoidal (co)closed categories
#
# Declarations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecordTools.gi

#! @Chapter Monoidal Categories

#! @Section Add-methods

#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoDualOnMorphisms`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( alpha ) \mapsto \mathtt{CoDualOnMorphisms}(alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoDualOnMorphisms",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoDualOnMorphisms",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoDualOnMorphismsWithGivenCoDuals`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, alpha, r ) \mapsto \mathtt{CoDualOnMorphismsWithGivenCoDuals}(s, alpha, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoDualOnMorphismsWithGivenCoDuals",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoDualOnMorphismsWithGivenCoDuals",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoDualOnObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{CoDualOnObjects}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoDualOnObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoDualOnObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoDualityTensorProductCompatibilityMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CoDualityTensorProductCompatibilityMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoDualityTensorProductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoDualityTensorProductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoDualityTensorProductCompatibilityMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, r ) \mapsto \mathtt{CoDualityTensorProductCompatibilityMorphismWithGivenObjects}(s, a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoDualityTensorProductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoDualityTensorProductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoLambdaElimination`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, alpha ) \mapsto \mathtt{CoLambdaElimination}(a, b, alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoLambdaElimination",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoLambdaElimination",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoLambdaIntroduction`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( alpha ) \mapsto \mathtt{CoLambdaIntroduction}(alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoLambdaIntroduction",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoLambdaIntroduction",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedEvaluationForCoDual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{CoclosedEvaluationForCoDual}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedEvaluationForCoDual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedEvaluationForCoDual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedEvaluationForCoDualWithGivenTensorProduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, r ) \mapsto \mathtt{CoclosedEvaluationForCoDualWithGivenTensorProduct}(s, a, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedEvaluationForCoDualWithGivenTensorProduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedEvaluationForCoDualWithGivenTensorProduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalLeftCoevaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CoclosedMonoidalLeftCoevaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalLeftCoevaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalLeftCoevaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalLeftCoevaluationMorphismWithGivenSource`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, s ) \mapsto \mathtt{CoclosedMonoidalLeftCoevaluationMorphismWithGivenSource}(a, b, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalLeftCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalLeftCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalLeftEvaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CoclosedMonoidalLeftEvaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalLeftEvaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalLeftEvaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalLeftEvaluationMorphismWithGivenRange`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, r ) \mapsto \mathtt{CoclosedMonoidalLeftEvaluationMorphismWithGivenRange}(a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalLeftEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalLeftEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalRightCoevaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CoclosedMonoidalRightCoevaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalRightCoevaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalRightCoevaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalRightCoevaluationMorphismWithGivenSource`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, s ) \mapsto \mathtt{CoclosedMonoidalRightCoevaluationMorphismWithGivenSource}(a, b, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalRightCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalRightCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalRightEvaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CoclosedMonoidalRightEvaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalRightEvaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalRightEvaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoclosedMonoidalRightEvaluationMorphismWithGivenRange`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, r ) \mapsto \mathtt{CoclosedMonoidalRightEvaluationMorphismWithGivenRange}(a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoclosedMonoidalRightEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoclosedMonoidalRightEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomOnMorphisms`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( alpha, beta ) \mapsto \mathtt{InternalCoHomOnMorphisms}(alpha, beta)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomOnMorphisms",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomOnMorphisms",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomOnMorphismsWithGivenInternalCoHoms`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, alpha, beta, r ) \mapsto \mathtt{InternalCoHomOnMorphismsWithGivenInternalCoHoms}(s, alpha, beta, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomOnMorphismsWithGivenInternalCoHoms",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomOnMorphismsWithGivenInternalCoHoms",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomOnObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{InternalCoHomOnObjects}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomOnObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomOnObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomTensorProductCompatibilityMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( list ) \mapsto \mathtt{InternalCoHomTensorProductCompatibilityMorphism}(list)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomTensorProductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomTensorProductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomTensorProductCompatibilityMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( source, list, range ) \mapsto \mathtt{InternalCoHomTensorProductCompatibilityMorphismWithGivenObjects}(source, list, range)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomTensorProductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomTensorProductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomToTensorProductLeftAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, c, f ) \mapsto \mathtt{InternalCoHomToTensorProductLeftAdjunctMorphism}(a, c, f)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomToTensorProductLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomToTensorProductLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomToTensorProductLeftAdjunctMorphismWithGivenTensorProduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, c, f, t ) \mapsto \mathtt{InternalCoHomToTensorProductLeftAdjunctMorphismWithGivenTensorProduct}(a, c, f, t)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomToTensorProductLeftAdjunctMorphismWithGivenTensorProduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomToTensorProductLeftAdjunctMorphismWithGivenTensorProduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomToTensorProductRightAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, f ) \mapsto \mathtt{InternalCoHomToTensorProductRightAdjunctMorphism}(a, b, f)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomToTensorProductRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomToTensorProductRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `InternalCoHomToTensorProductRightAdjunctMorphismWithGivenTensorProduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, f, t ) \mapsto \mathtt{InternalCoHomToTensorProductRightAdjunctMorphismWithGivenTensorProduct}(a, b, f, t)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddInternalCoHomToTensorProductRightAdjunctMorphismWithGivenTensorProduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddInternalCoHomToTensorProductRightAdjunctMorphismWithGivenTensorProduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromInternalCoHomFromTensorUnitToCoDualObject",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromInternalCoHomFromTensorUnitToCoDualObject",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromInternalCoHomToObject`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromInternalCoHomToObject}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromInternalCoHomToObject",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromInternalCoHomToObject",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromInternalCoHomToObjectWithGivenInternalCoHom`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, s ) \mapsto \mathtt{IsomorphismFromInternalCoHomToObjectWithGivenInternalCoHom}(a, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromInternalCoHomToObjectWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromInternalCoHomToObjectWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromObjectToInternalCoHom`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromObjectToInternalCoHom}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromObjectToInternalCoHom",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromObjectToInternalCoHom",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromObjectToInternalCoHomWithGivenInternalCoHom`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, r ) \mapsto \mathtt{IsomorphismFromObjectToInternalCoHomWithGivenInternalCoHom}(a, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromObjectToInternalCoHomWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromObjectToInternalCoHomWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MonoidalPostCoComposeMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, c ) \mapsto \mathtt{MonoidalPostCoComposeMorphism}(a, b, c)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMonoidalPostCoComposeMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMonoidalPostCoComposeMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MonoidalPostCoComposeMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, c, r ) \mapsto \mathtt{MonoidalPostCoComposeMorphismWithGivenObjects}(s, a, b, c, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMonoidalPostCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMonoidalPostCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MonoidalPreCoComposeMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, c ) \mapsto \mathtt{MonoidalPreCoComposeMorphism}(a, b, c)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMonoidalPreCoComposeMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMonoidalPreCoComposeMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MonoidalPreCoComposeMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, c, r ) \mapsto \mathtt{MonoidalPreCoComposeMorphismWithGivenObjects}(s, a, b, c, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMonoidalPreCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMonoidalPreCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromCoBidual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{MorphismFromCoBidual}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromCoBidual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromCoBidual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromCoBidualWithGivenCoBidual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, s ) \mapsto \mathtt{MorphismFromCoBidualWithGivenCoBidual}(a, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromCoBidualWithGivenCoBidual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromCoBidualWithGivenCoBidual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromInternalCoHomToTensorProduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{MorphismFromInternalCoHomToTensorProduct}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromInternalCoHomToTensorProduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromInternalCoHomToTensorProduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromInternalCoHomToTensorProductWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, r ) \mapsto \mathtt{MorphismFromInternalCoHomToTensorProductWithGivenObjects}(s, a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromInternalCoHomToTensorProductWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromInternalCoHomToTensorProductWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TensorProductToInternalCoHomLeftAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g ) \mapsto \mathtt{TensorProductToInternalCoHomLeftAdjunctMorphism}(b, c, g)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTensorProductToInternalCoHomLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddTensorProductToInternalCoHomLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g, i ) \mapsto \mathtt{TensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom}(b, c, g, i)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddTensorProductToInternalCoHomLeftAdjunctMorphismWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TensorProductToInternalCoHomRightAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g ) \mapsto \mathtt{TensorProductToInternalCoHomRightAdjunctMorphism}(b, c, g)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTensorProductToInternalCoHomRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddTensorProductToInternalCoHomRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TensorProductToInternalCoHomRightAdjunctMorphismWithGivenInternalCoHom`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g, i ) \mapsto \mathtt{TensorProductToInternalCoHomRightAdjunctMorphismWithGivenInternalCoHom}(b, c, g, i)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTensorProductToInternalCoHomRightAdjunctMorphismWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddTensorProductToInternalCoHomRightAdjunctMorphismWithGivenInternalCoHom",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `UniversalPropertyOfCoDual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( t, a, alpha ) \mapsto \mathtt{UniversalPropertyOfCoDual}(t, a, alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddUniversalPropertyOfCoDual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddUniversalPropertyOfCoDual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup

