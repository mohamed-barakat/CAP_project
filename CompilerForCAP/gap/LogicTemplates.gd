# SPDX-License-Identifier: GPL-2.0-or-later
# CompilerForCAP: Speed up and verify categorical algorithms
#
# Declarations
#
#! @Chapter Improving and extending the compiler

#! @Section Logic

DeclareGlobalFunction( "CAP_JIT_INTERNAL_ENHANCE_LOGIC_TEMPLATE" );

DeclareGlobalFunction( "CAP_JIT_INTERNAL_TREE_MATCHES_TEMPLATE_TREE" );

#! @Description
#!   Adds the logic template <A>template</A> to the list of logic templates.
#!   For a list of pre-installed logic templates, which can be used as guiding examples, see `CompilerForCAP/gap/LogicTemplates.gi`.
#!   Logic templates are records with the following entries:
#!     * `src_template` and `dst_template` (required): strings containing valid GAP code defining expressions
#!     * `variable_names` (required): a list of strings (which must not be keywords in GAP)
#!     * `variable_filters` (optional): a list of filters or data types (see <Ref Func="CapJitInferredDataTypes" />)
#!        with the same length as `variable_names`, defaults to a list of `IsObject`
#!     * `new_funcs` (optional): a list of lists of strings, defaults to the empty list
#!     * `number_of_applications` (optional): a positive integer or infinity, defaults to infinity
#!     * `apply_in_proof_assistant_mode` (optional): one of the strings `"yes"`, `"no"`, or `"only"`, defaults to `"yes"`
#!     * `debug` (optional): a boolean
#!     * `debug_path` (optional): a path
#!
#!   Semantics: `src_template` is a piece of code which should be replaced by `dst_template`:
#!     * The function <Ref Func="CapJitAppliedLogicTemplates" /> tries to find occurences of `src_template` in a tree and
#!       potentially replaces them by `dst_template`.
#!     * When trying to find an occurence of `src_template` in a tree, all strings occuring in the list `variable_names`
#!       are considered as variables, i.e., they match any value in the tree. If a variable occurs
#!       multiple times, the corresponding parts of the tree must be equal.
#!       The template is only applied if all values match the corresponding filters or data types in `variable_filters`.
#!     * For each function in `dst_template`, <Ref Func="CapJitAppliedLogicTemplates" /> tries to find a corresponding function in
#!       `src_template`. The functions are matched by comparing the lists of names of function arguments. If for a function in
#!       `dst_template` no corresponding function in `src_template` exists, you have to add the list of names of function arguments
#!       of this function to `new_funcs`.
#!     * If `number_of_applications` is a positive integer $n$, the logic template will be applied at most $n$ times and ignored afterwards.
#!     * `apply_in_proof_assistant_mode` determines if the logic template is applied in proof assistant mode, is not applied in proof assistant mode,
#!       or is **only** applied in proof assistant mode but not in normal mode.
#!     * `debug` can be set to `true` to print more information while <Ref Func="CapJitAppliedLogicTemplates" /> tries to apply the template.
#!       (Note: this causes informational break loops which are not actual errors).
#!     * `debug_path` can be set to a specific path to get exact information why the subtree at this path does or does not match
#!       `src_template`.
#!
#!  Notes:
#!     * `src_template` is only replaced by `dst_template` if the result is well-defined, i.e., if all function variables
#!       reference only functions in their function stack. This can be used to move "static" variables (i.e. variables not depending
#!       on local variables) outside of functions. Example: consider a template with `src_template` given by
#!       `Sum( List( L, x -> x^2 * value ) )` and `dst_template` given by `Sum( List( L, x -> x^2 ) ) * value` (assuming distributivity).
#!       This replacement is only valid if `value` is independent of `x`. However, we do not need to make this explicit at any point,
#!       because if `value` depends on `x`, the result `Sum( List( L, x -> x^2 ) ) * value` is not well-defined,
#!       so the template is not applied anyway.
#!     * If `src_template` cannot be expressed as valid GAP code, the component `src_template_tree` can be set.
#!       In that case, `src_template` is not parsed and `src_template_tree` is used when trying to find a match.
#!       Variables in the sense of `variable_names` have to be given as syntax trees of type `SYNTAX_TREE_VARIABLE` with a unique `id`.
#!       Setting `src_template` and `variable_names` is still required to have a readable representation of the template.
#!       If `dst_template` cannot be expressed as valid GAP code, it can be handled in an analogous manner.
#! @Arguments template
DeclareGlobalFunction( "CapJitAddLogicTemplate" );

#! @Section Compilation steps

#! @Description
#!   Applies all logic templates (see <Ref Func="CapJitAddLogicTemplate" />) to <A>tree</A>.
#! @Returns a record
#! @Arguments tree
DeclareGlobalFunction( "CapJitAppliedLogicTemplates" );

DeclareGlobalFunction( "CAP_JIT_INTERNAL_APPLIED_LOGIC_TEMPLATES" );
