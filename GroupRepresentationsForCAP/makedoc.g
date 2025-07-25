# SPDX-License-Identifier: GPL-2.0-or-later
# GroupRepresentationsForCAP: Skeletal category of group representations for CAP
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage( "AutoDoc", "2025.12.19" ) then
    
    Error( "AutoDoc version 2025.12.19 or newer is required." );
    
fi;

AutoDoc( rec(
    autodoc := rec(
        files := [ "doc/Doc.autodoc" ],
        scan_dirs := [ "doc", "gap", "examples", "examples/doc", "examples/S3", "examples/S4", "examples/S5", "examples/A4" ],
    ),
    extract_examples := rec(
        units := "Single",
    ),
    gapdoc := rec(
        LaTeXOptions := rec(
            LateExtraPreamble := """
                \DeclareUnicodeCharacter{03C7}{\ensuremath{\chi}}
                \DeclareUnicodeCharacter{2080}{\textsubscript{0}}
                \DeclareUnicodeCharacter{2081}{\textsubscript{1}}
                \DeclareUnicodeCharacter{2082}{\textsubscript{2}}
                \DeclareUnicodeCharacter{2083}{\textsubscript{3}}
                \DeclareUnicodeCharacter{2084}{\textsubscript{4}}
                \DeclareUnicodeCharacter{2085}{\textsubscript{5}}
                \DeclareUnicodeCharacter{2086}{\textsubscript{6}}
                \DeclareUnicodeCharacter{2087}{\textsubscript{7}}
                \DeclareUnicodeCharacter{2088}{\textsubscript{8}}
                \DeclareUnicodeCharacter{2089}{\textsubscript{9}}
                \DeclareUnicodeCharacter{2295}{\ensuremath{\oplus}}
                \usepackage{mathtools}
            """,
        ),
    ),
    scaffold := rec(
        entities := rec( homalg := "homalg", CAP := "CAP" ),
    ),
) );

QUIT;
