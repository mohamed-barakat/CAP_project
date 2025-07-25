# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "index" ],
        # variable_filters := [  ],
        src_template := "list[index][1]",
        dst_template := "List( list, x -> x[1] )[index]",
        new_funcs := [ [ "x" ] ],
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "index" ],
        # variable_filters := [  ],
        src_template := "list[index][2]",
        dst_template := "List( list, x -> x[2] )[index]",
        new_funcs := [ [ "x" ] ],
    )
);





# CapJitAddLogicTemplate(
#     rec(
#         variable_names := [ "row_object", "list_of_pairs", "index" ],
#         variable_filters := [ "IsCategoryOfRowsObject", "IsObject" ],
#         src_template :=
#             "List( list_of_pairs, function ( pair ) return NTuple( 2, row_object, index ); end )",
#         dst_template := "List( list_of_pairs, function ( pair ) return pair[1]; end )[6]",
#     )
# );
#

