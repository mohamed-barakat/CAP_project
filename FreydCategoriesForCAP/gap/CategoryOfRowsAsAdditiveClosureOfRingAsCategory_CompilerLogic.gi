# SPDX-License-Identifier: GPL-2.0-or-later
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# Implementations
#

CapJitAddLogicFunction( function( tree, jit_args )
  local pre_func, additional_arguments_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for HomalgMatrix." );
    
    pre_func := function( tree, func_stack )
      local args, list, func_id, ring_element, condition_func, right;
        
        # find HomalgMatrix( ... )
        if CapJitIsCallToGlobalFunction( tree, "HomalgMatrix" ) then
            
            args := tree.args;

            # check if ... = [ [ ... ], ... ]
            if args.1.type = "EXPR_LIST" then
                
                list := args.1.list;
                
                func_id := Last( func_stack).id;
                
                # check if all elements of the matrix are multiplied by the same ring element from the left
                if list.length > 0 and ForAll( list, l -> l.type = "EXPR_PROD" and l.left = list.1.left ) then
                    
                    ring_element := list.1.left;
                    
                    # check if ring_element is independent of local variables
                    condition_func := function( tree, path )
                        
                        if PositionSublist( tree.type, "FVAR" ) <> fail and tree.func_id = func_id then
                            
                            return true;
                            
                        fi;
                        
                        return false;
                        
                    end;
                    
                    if CapJitFindNodeDeep( ring_element, condition_func ) = fail then
                        
                        tree := rec(
                            type := "EXPR_PROD",
                            left := ring_element,
                            right := StructuralCopy( tree ),
                        );
                        
                        tree.right.args.1.list := List( list, l -> l.right );

                        return tree;
                        
                    fi;
                    
                fi;
                
                # check if all elements of the matrix are multiplied by the same ring element from the right
                if list.length > 0 and ForAll( list, l -> l.type = "EXPR_PROD" and l.right = list.1.right ) then
                    
                    ring_element := list.1.right;
                    
                    # check if ring_element is independent of local variables
                    condition_func := function( tree, path )
                        
                        if PositionSublist( tree.type, "FVAR" ) <> fail and tree.func_id = func_id then
                            
                            return true;
                            
                        fi;
                        
                        return false;
                        
                    end;
                    
                    if CapJitFindNodeDeep( ring_element, condition_func ) = fail then
                        
                        tree := rec(
                            type := "EXPR_PROD",
                            left := StructuralCopy( tree ),
                            right := ring_element,
                        );
                        
                        tree.left.args.1.list := List( list, l -> l.left );

                        return tree;
                        
                    fi;
                    
                fi;
                
            fi;

        fi;
            
        return tree;
        
    end;
    
    additional_arguments_func := function( tree, key, func_stack )
        
        if tree.type = "EXPR_DECLARATIVE_FUNC" then
            
            Assert( 0, IsBound( tree.id ) );
            
            return Concatenation( func_stack, [ tree ] );
            
        else
            
            return func_stack;
            
        fi;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, additional_arguments_func, [] );
    
end );

# Length( ListWithIdenticalEntries( number, obj ) ) => number
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "obj" ],
        src_template := "Length( ListWithIdenticalEntries( number, obj ) )",
        dst_template := "number",
        returns_value := true,
    )
);

# List( ListWithIdenticalEntries( number, obj ), func ) => ListWithIdenticalEntries( number, func( obj ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "obj", "func" ],
        src_template := "List( ListWithIdenticalEntries( number, obj ), func )",
        dst_template := "ListWithIdenticalEntries( number, func( obj ) )",
        returns_value := true,
    )
);

# List( L, x -> x ) => L
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "List( list, x -> x )",
        dst_template := "list",
        returns_value := true,
    )
);

# EntriesOfHomalgMatrixAsListList( matrix )[row][col] => matrix[row][col]
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "matrix", "row", "col" ],
        src_template := "EntriesOfHomalgMatrixAsListList( matrix )[row][col]",
        dst_template := "matrix[row, col]",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( CoercedMatrix( R, S, M ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring2", "nr_cols", "list", "ring1", "matrix" ],
        src_template := "UnionOfRows( ring2, nr_cols, List( list, l -> CoercedMatrix( ring1, ring2, matrix ) ) )",
        dst_template := "CoercedMatrix( ring1, ring2, UnionOfRows( ring1, nr_cols, List( list, l -> matrix ) ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( CoercedMatrix( R, S, M ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring2", "nr_rows", "list", "ring1", "matrix" ],
        src_template := "UnionOfColumns( ring2, nr_rows, List( list, l -> CoercedMatrix( ring1, ring2, matrix ) ) )",
        dst_template := "CoercedMatrix( ring1, ring2, UnionOfColumns( ring1, nr_rows, List( list, l -> matrix ) ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( CoefficientsWithGivenMonomials )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "list", "matrix", "monomials" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := "UnionOfRows( ring, nr_cols, List( list, l -> CoefficientsWithGivenMonomials( matrix, monomials ) ) )",
        dst_template := "CoefficientsWithGivenMonomials( UnionOfRows( ring, NrCols( monomials ), List( list, l -> matrix ) ), monomials )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( CoefficientsWithGivenMonomials )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_rows", "list", "matrix", "monomials" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := "UnionOfColumns( ring, nr_rows, List( list, l -> CoefficientsWithGivenMonomials( matrix, monomials ) ) )",
        dst_template := "CoefficientsWithGivenMonomials( UnionOfColumns( ring, nr_rows, List( list, l -> matrix ) ), DiagMat( ring, List( list, x -> monomials ) ) )",
        new_funcs := [ [ "x" ] ],
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( a * B ) => a * UnionOfRows( B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_cols", "list", "ring_element", "matrix" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgRingElement", "IsHomalgMatrix" ],
        src_template := "UnionOfRows( homalg_ring, nr_cols, List( list, l -> ring_element * matrix ) )",
        dst_template := "ring_element * UnionOfRows( homalg_ring, nr_cols, List( list, l -> matrix ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( A * b ) => UnionOfRows( A ) * b
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_cols", "list", "matrix", "ring_element" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgRingElement" ],
        src_template := "UnionOfRows( homalg_ring, nr_cols, List( list, l -> matrix * ring_element ) )",
        dst_template := "UnionOfRows( homalg_ring, nr_cols, List( list, l -> matrix ) ) * ring_element",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( a * B ) => a * UnionOfColumns( B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_rows", "list", "ring_element", "matrix" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgRingElement", "IsHomalgMatrix" ],
        src_template := "UnionOfColumns( homalg_ring, nr_rows, List( list, l -> ring_element * matrix ) )",
        dst_template := "ring_element * UnionOfColumns( homalg_ring, nr_rows, List( list, l -> matrix ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( A * b ) => UnionOfColumns( A ) * b
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_rows", "list", "matrix", "ring_element" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgRingElement" ],
        src_template := "UnionOfColumns( homalg_ring, nr_rows, List( list, l -> matrix * ring_element ) )",
        dst_template := "UnionOfColumns( homalg_ring, nr_rows, List( list, l -> matrix ) ) * ring_element",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# DualKroneckerMat( A, B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "nr_rows", "matrix1", "matrix2" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := """
            UnionOfRows( ring, nr_cols, List( [ 1 .. NrRows( matrix2 ) ], i ->
                UnionOfColumns( ring, nr_rows, List( [ 1 .. NrColumns( matrix2 ) ], j ->
                    matrix1 * matrix2[i,j]
                ) )
            ) )
        """,
        dst_template := "DualKroneckerMat( matrix1, matrix2 )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.06.27" ] ],
    )
);

# KroneckerMat( TransposedMatrix( A ), B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "nr_rows", "matrix1", "matrix2" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := """
            UnionOfRows( ring, nr_cols, List( [ 1 .. NrColumns( matrix1 ) ], j ->
                UnionOfColumns( ring, nr_rows, List( [ 1 .. NrRows( matrix1 ) ], i ->
                    matrix1[i,j] * matrix2
                ) )
            ) )
        """,
        dst_template := "KroneckerMat( TransposedMatrix( matrix1 ), matrix2 )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# ConvertMatrixToRow( M )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "matrix" ],
        variable_filters := [ "IsHomalgRing", "IsHomalgMatrix" ],
        src_template := """
            UnionOfColumns( ring, 1, List( [ 1 .. NrRows( matrix ) ], i ->
                UnionOfColumns( ring, 1, List( [ 1 .. NrColumns( matrix ) ], j ->
                    HomalgMatrix( [ matrix[i, j] ], 1, 1, ring )
                ) )
            ) )
        """,
        dst_template := "ConvertMatrixToRow( matrix )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.06.27" ] ],
    )
);