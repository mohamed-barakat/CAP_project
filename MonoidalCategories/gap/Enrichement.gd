####################################
##
#! @Chapter Monoidal Categories
##
#! @Section Enrichment
##
####################################

DeclareGlobalVariable( "CAP_INTERNAL_MONOIDAL_CATEGORIES_ENRICHING_OPERATIONS" );

DeclareGlobalVariable( "ENRICHING_MONOIDAL_CATEGORIES_METHOD_NAME_RECORD" );

#! @Description
#! The arguments are three objects $a,b,c$ in $C$.
#! The output is a morphism $c_{a,b,c}:H(a,b) \otimes H(b,c) \to H(a,c)$ representing the pre-composition in the following sense:
#! For two composable morphisms $\alpha: a \to b$ and $\beta: b \to c$ the following equality holds:
#! $$c_{a,b,c} \circ (\nu(\alpha) \otimes \nu(\beta)) \circ \lambda_I = \nu( <C>PreCompose</C>(\alpha, \beta) ).$$
#! @Returns a morphism in $\mathrm{Hom}_{D}(H(a,b) \otimes H(b,c), H(a,c))$
#! @Arguments a,b,c
DeclareOperation( "PreCompositionOfHomomorphismStructure",
                  [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The arguments are an object $s = H(a,b) \otimes H(b,c)$ in $D$,
#! three objects $a,b,c$ in $C$,
#! and an object $r = H(a,c)$ in $D$.
#! The output is a morphism from $s$ to $r$.
#! @Returns a morphism in $\mathrm{Hom}_{D}(s,r)$
#! @Arguments s, a, b, c, r
DeclareOperation( "PreCompositionOfHomomorphismStructureWithGivenObjects",
                  [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>PreCompositionOfHomomorphismStructureWithGivenObjects</C>.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddPreCompositionOfHomomorphismStructureWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddPreCompositionOfHomomorphismStructureWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddPreCompositionOfHomomorphismStructureWithGivenObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddPreCompositionOfHomomorphismStructureWithGivenObjects",
                  [ IsCapCategory, IsList ] );
