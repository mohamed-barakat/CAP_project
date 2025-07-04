gap> START_TEST( "CapJitCompiledFunction" );

#
gap> LoadPackage( "CompilerForCAP", false );
true
gap> LoadPackage( "AdditiveClosuresForCAP", false );
true

#
gap> QQ := HomalgFieldOfRationals();;
gap> vec := CategoryOfRows( QQ );;

# test CapJitCompiledFunction with explicit type signature
gap> Display(
>     CapJitCompiledFunction(
>         cat -> ZeroObject( cat ),
>         [
>             [
>                 rec(
>                     filter := IsCapCategory,
>                     category := vec
>                 )
>             ],
>             fail,
>         ]
>     )
> );
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, RankOfObject, 0 );
end

# test "compiling" kernel functions
gap> IsIdenticalObj( CapJitCompiledFunction( IdFunc ), IdFunc );
true

#
gap> STOP_TEST( "CapJitCompiledFunction" );
