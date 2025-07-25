# SPDX-License-Identifier: GPL-2.0-or-later
# GroupsAsCategoriesForCAP: Groups as categories on one object
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "GroupsAsCategoriesForCAP",
Subtitle := "Groups as categories on one object",
Version := "2025.07-02",
Date := (function ( ) if IsBound( GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE ) then return GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE; else return Concatenation( ~.Version{[ 1 .. 4 ]}, "-", ~.Version{[ 6, 7 ]}, "-01" ); fi; end)( ),
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Sebastian",
    LastName := "Posur",
    WWWHome := "https://sebastianpos.github.io",
    Email := "sebastian.posur@uni-siegen.de",
    PostalAddress := Concatenation(
               "Department Mathematik\n",
               "Universität Siegen\n",
               "Walter-Flex-Straße 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Fabian",
    LastName := "Zickgraf",
    WWWHome := "https://github.com/zickgraf/",
    Email := "fabian.zickgraf@uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CAP_project",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/GroupsAsCategoriesForCAP",
PackageInfoURL  := "https://homalg-project.github.io/CAP_project/GroupsAsCategoriesForCAP/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CAP_project/GroupsAsCategoriesForCAP/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CAP_project/releases/download/GroupsAsCategoriesForCAP-", ~.Version, "/GroupsAsCategoriesForCAP-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz .zip",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "GroupsAsCategoriesForCAP",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Groups as categories on one object",
),

Dependencies := rec(
  GAP := ">= 4.13.0",
  NeededOtherPackages := [ [ "CAP", ">= 2025.07-02" ],
                         ],
  SuggestedOtherPackages := [ [ "FinSetsForCAP", ">= 2023.07-03" ],
                            ],
  ExternalConditions := [ ],
),

Extensions := [
  rec(
    needed := [ [ "FinSetsForCAP", ">= 2023.07-03" ] ],
    filename := "gap/HomomorphismStructure.gi",
  ),
],

AvailabilityTest := function()
        return true;
    end,
#Keywords := [ "TODO" ],

TestFile := "tst/testall.g",

));
