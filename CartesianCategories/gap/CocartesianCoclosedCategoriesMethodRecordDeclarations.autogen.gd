# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Declarations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecordTools.gi

#! @Chapter Cocartesian Categories

#! @Section Add-methods

#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianDualOnMorphisms`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( alpha ) \mapsto \mathtt{CocartesianDualOnMorphisms}(alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianDualOnMorphisms",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianDualOnMorphisms",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianDualOnMorphismsWithGivenCocartesianDuals`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, alpha, r ) \mapsto \mathtt{CocartesianDualOnMorphismsWithGivenCocartesianDuals}(s, alpha, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianDualOnMorphismsWithGivenCocartesianDuals",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianDualOnMorphismsWithGivenCocartesianDuals",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianDualOnObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{CocartesianDualOnObjects}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianDualOnObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianDualOnObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianDualityCoproductCompatibilityMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CocartesianDualityCoproductCompatibilityMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianDualityCoproductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianDualityCoproductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianDualityCoproductCompatibilityMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, r ) \mapsto \mathtt{CocartesianDualityCoproductCompatibilityMorphismWithGivenObjects}(s, a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianDualityCoproductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianDualityCoproductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianEvaluationForCocartesianDual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{CocartesianEvaluationForCocartesianDual}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianEvaluationForCocartesianDual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianEvaluationForCocartesianDual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianEvaluationForCocartesianDualWithGivenCoproduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, r ) \mapsto \mathtt{CocartesianEvaluationForCocartesianDualWithGivenCoproduct}(s, a, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianEvaluationForCocartesianDualWithGivenCoproduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianEvaluationForCocartesianDualWithGivenCoproduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianLambdaElimination`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, alpha ) \mapsto \mathtt{CocartesianLambdaElimination}(a, b, alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianLambdaElimination",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianLambdaElimination",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianLambdaIntroduction`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( alpha ) \mapsto \mathtt{CocartesianLambdaIntroduction}(alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianLambdaIntroduction",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianLambdaIntroduction",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianLeftCoevaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CocartesianLeftCoevaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianLeftCoevaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianLeftCoevaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianLeftCoevaluationMorphismWithGivenSource`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, s ) \mapsto \mathtt{CocartesianLeftCoevaluationMorphismWithGivenSource}(a, b, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianLeftCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianLeftCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianLeftEvaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CocartesianLeftEvaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianLeftEvaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianLeftEvaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianLeftEvaluationMorphismWithGivenRange`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, r ) \mapsto \mathtt{CocartesianLeftEvaluationMorphismWithGivenRange}(a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianLeftEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianLeftEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianPostCoComposeMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, c ) \mapsto \mathtt{CocartesianPostCoComposeMorphism}(a, b, c)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianPostCoComposeMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianPostCoComposeMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianPostCoComposeMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, c, r ) \mapsto \mathtt{CocartesianPostCoComposeMorphismWithGivenObjects}(s, a, b, c, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianPostCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianPostCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianPreCoComposeMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, c ) \mapsto \mathtt{CocartesianPreCoComposeMorphism}(a, b, c)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianPreCoComposeMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianPreCoComposeMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianPreCoComposeMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, c, r ) \mapsto \mathtt{CocartesianPreCoComposeMorphismWithGivenObjects}(s, a, b, c, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianPreCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianPreCoComposeMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianRightCoevaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CocartesianRightCoevaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianRightCoevaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianRightCoevaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianRightCoevaluationMorphismWithGivenSource`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, s ) \mapsto \mathtt{CocartesianRightCoevaluationMorphismWithGivenSource}(a, b, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianRightCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianRightCoevaluationMorphismWithGivenSource",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianRightEvaluationMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CocartesianRightEvaluationMorphism}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianRightEvaluationMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianRightEvaluationMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CocartesianRightEvaluationMorphismWithGivenRange`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, r ) \mapsto \mathtt{CocartesianRightEvaluationMorphismWithGivenRange}(a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCocartesianRightEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCocartesianRightEvaluationMorphismWithGivenRange",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialCoproductCompatibilityMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( list ) \mapsto \mathtt{CoexponentialCoproductCompatibilityMorphism}(list)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialCoproductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialCoproductCompatibilityMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialCoproductCompatibilityMorphismWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( source, list, range ) \mapsto \mathtt{CoexponentialCoproductCompatibilityMorphismWithGivenObjects}(source, list, range)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialCoproductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialCoproductCompatibilityMorphismWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialOnMorphisms`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( alpha, beta ) \mapsto \mathtt{CoexponentialOnMorphisms}(alpha, beta)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialOnMorphisms",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialOnMorphisms",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialOnMorphismsWithGivenCoexponentials`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, alpha, beta, r ) \mapsto \mathtt{CoexponentialOnMorphismsWithGivenCoexponentials}(s, alpha, beta, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialOnMorphismsWithGivenCoexponentials",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialOnMorphismsWithGivenCoexponentials",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialOnObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{CoexponentialOnObjects}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialOnObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialOnObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialToCoproductLeftAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, c, f ) \mapsto \mathtt{CoexponentialToCoproductLeftAdjunctMorphism}(a, c, f)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialToCoproductLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialToCoproductLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, c, f, t ) \mapsto \mathtt{CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct}(a, c, f, t)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialToCoproductRightAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, f ) \mapsto \mathtt{CoexponentialToCoproductRightAdjunctMorphism}(a, b, f)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialToCoproductRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialToCoproductRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoexponentialToCoproductRightAdjunctMorphismWithGivenCoproduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b, f, t ) \mapsto \mathtt{CoexponentialToCoproductRightAdjunctMorphismWithGivenCoproduct}(a, b, f, t)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoexponentialToCoproductRightAdjunctMorphismWithGivenCoproduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoexponentialToCoproductRightAdjunctMorphismWithGivenCoproduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoproductToCoexponentialLeftAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g ) \mapsto \mathtt{CoproductToCoexponentialLeftAdjunctMorphism}(b, c, g)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoproductToCoexponentialLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoproductToCoexponentialLeftAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g, i ) \mapsto \mathtt{CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential}(b, c, g, i)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoproductToCoexponentialRightAdjunctMorphism`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g ) \mapsto \mathtt{CoproductToCoexponentialRightAdjunctMorphism}(b, c, g)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoproductToCoexponentialRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoproductToCoexponentialRightAdjunctMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CoproductToCoexponentialRightAdjunctMorphismWithGivenCoexponential`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( b, c, g, i ) \mapsto \mathtt{CoproductToCoexponentialRightAdjunctMorphismWithGivenCoexponential}(b, c, g, i)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCoproductToCoexponentialRightAdjunctMorphismWithGivenCoexponential",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddCoproductToCoexponentialRightAdjunctMorphismWithGivenCoexponential",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromCocartesianDualObjectToCoexponentialFromInitialObject`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromCocartesianDualObjectToCoexponentialFromInitialObject}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromCocartesianDualObjectToCoexponentialFromInitialObject",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromCocartesianDualObjectToCoexponentialFromInitialObject",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromCoexponentialFromInitialObjectToCocartesianDualObject`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromCoexponentialFromInitialObjectToCocartesianDualObject}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromCoexponentialFromInitialObjectToCocartesianDualObject",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromCoexponentialFromInitialObjectToCocartesianDualObject",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromCoexponentialToObject`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromCoexponentialToObject}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromCoexponentialToObject",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromCoexponentialToObject",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromCoexponentialToObjectWithGivenCoexponential`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, s ) \mapsto \mathtt{IsomorphismFromCoexponentialToObjectWithGivenCoexponential}(a, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromCoexponentialToObjectWithGivenCoexponential",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromCoexponentialToObjectWithGivenCoexponential",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromObjectToCoexponential`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{IsomorphismFromObjectToCoexponential}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromObjectToCoexponential",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromObjectToCoexponential",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `IsomorphismFromObjectToCoexponentialWithGivenCoexponential`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, r ) \mapsto \mathtt{IsomorphismFromObjectToCoexponentialWithGivenCoexponential}(a, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsomorphismFromObjectToCoexponentialWithGivenCoexponential",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddIsomorphismFromObjectToCoexponentialWithGivenCoexponential",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromCocartesianBidual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a ) \mapsto \mathtt{MorphismFromCocartesianBidual}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromCocartesianBidual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromCocartesianBidual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromCocartesianBidualWithGivenCocartesianBidual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, s ) \mapsto \mathtt{MorphismFromCocartesianBidualWithGivenCocartesianBidual}(a, s)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromCocartesianBidualWithGivenCocartesianBidual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromCocartesianBidualWithGivenCocartesianBidual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromCoexponentialToCoproduct`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( a, b ) \mapsto \mathtt{MorphismFromCoexponentialToCoproduct}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromCoexponentialToCoproduct",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromCoexponentialToCoproduct",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `MorphismFromCoexponentialToCoproductWithGivenObjects`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( s, a, b, r ) \mapsto \mathtt{MorphismFromCoexponentialToCoproductWithGivenObjects}(s, a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromCoexponentialToCoproductWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddMorphismFromCoexponentialToCoproductWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup


#! @BeginGroup
#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `UniversalPropertyOfCocartesianDual`.
#! Optionally, a weight (default: 100) can be specified which should roughly correspond
#! to the computational complexity of the function (lower weight = less complex = faster execution).
#! $F: ( t, a, alpha ) \mapsto \mathtt{UniversalPropertyOfCocartesianDual}(t, a, alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddUniversalPropertyOfCocartesianDual",
                  [ IsCapCategory, IsFunction ] );

#! @Arguments C, F, weight
DeclareOperation( "AddUniversalPropertyOfCocartesianDual",
                  [ IsCapCategory, IsFunction, IsInt ] );
#! @EndGroup

