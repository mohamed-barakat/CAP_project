SetPackageInfo( rec(

PackageName := "ModulePresentationsForCAP",
Subtitle := "Category R-pres for CAP",
Version := Maximum( [
           ##
           "2017.12-30", # Sebas version
           ##
           "2020.04-16", # Sepps version
           ##
           "2019.01-16", # Mohamed's version
           ##
           "2020.10-01", # Fabian's version
           ##
           ] ),

Date := Concatenation( "01/", ~.Version{[ 6, 7 ]}, "/", ~.Version{[ 1 .. 4 ]} ),
License := "GPL-2.0-or-later",


Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Sebastian",
    LastName := "Gutsche",
    WWWHome := "https://sebasguts.github.io/",
    Email := "gutsche@mathematik.uni-siegen.de",
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
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CAP_project",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/ModulePresentationsForCAP",
PackageInfoURL  := "https://homalg-project.github.io/CAP_project/ModulePresentationsForCAP/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CAP_project/ModulePresentationsForCAP/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CAP_project/releases/download/ModulePresentationsForCAP-", ~.Version, "/ModulePresentationsForCAP-", ~.Version ),
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
Status := "deposited",

AbstractHTML   :=  "<span class=\"pkgname\">ModulePresentationsForCAP</span> provides the category of finitely presented modules over a computable ring.",

PackageDoc := rec(
  BookName  := "ModulePresentationsForCAP",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Category R-pres for CAP",
),

Dependencies := rec(
  GAP := ">= 4.6",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ],
                           [ "MatricesForHomalg", ">=2019.02.01" ],
                           [ "CAP", ">= 2019.01.16" ],
                           [ "MonoidalCategories", ">= 2019.01.16" ],
                           [ "GeneralizedMorphismsForCAP", ">=0" ],
  ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,


#Keywords := [ "TODO" ],

));
