####################################
##
#! @Chapter Monoidal Categories
##
#! @Section Symmetric Coclosed Monoidal Categories
##
####################################

#! A monoidal category $\mathbf{C}$
#! which is symmetric and coclosed
#! is called a <Emph>symmetric coclosed monoidal category</Emph>.

#! The corresponding GAP property is given by
#! <C>IsSymmetricCoclosedMonoidalCategory</C>.

AddCategoricalProperty( [ "IsSymmetricCoclosedMonoidalCategory" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsSymmetricCoclosedMonoidalCategory  := Concatenation( [
], CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsSymmetricMonoidalCategory,
   CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoclosedMonoidalCategory );

InstallTrueMethod( IsCoclosedMonoidalCategory, IsSymmetricCoclosedMonoidalCategory );

InstallTrueMethod( IsSymmetricMonoidalCategory, IsSymmetricCoclosedMonoidalCategory );
