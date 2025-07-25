#! @Chapter Examples
LoadPackage( "GroupRepresentationsForCAP" );

#! @Example
RepG := RepresentationCategoryZGraded( AlternatingGroup( 4 ) );;
Qmat := UnderlyingCategoryForSemisimpleCategory( RepG );;
QQ := UnderlyingRing( Qmat );;
G := UnderlyingGroupForRepresentationCategory( RepG );;

irr := Irr( G );;

x1 := RepresentationCategoryZGradedObject( irr[1], RepG );;
x2 := RepresentationCategoryZGradedObject( irr[2], RepG );;
x3 := RepresentationCategoryZGradedObject( irr[3], RepG );;
x4 := RepresentationCategoryZGradedObject( irr[4], RepG );;

#########################
# EvaluationForDual
#########################

x3_x4 := DirectSum( x3, x4 );;
x3x3x3 := DirectSum( [ x3, x3, x3 ] );;
x3x3x3_x4x4 := DirectSum( [ x3, x3, x3, x4, x4 ] );;
x1_x2_x1_x3x3_x4_x1 := DirectSum( [ x1, x2, x1, x3, x3, x4, x1 ] );;

# Display( EvaluationForDual( x3 ) );

# Display( EvaluationForDual( x3x3x3 ) );

# Display( EvaluationForDual( x3_x4 ) );

# Display( EvaluationForDual( x3x3x3_x4x4 ) );

# Display( EvaluationForDual( x1_x2_x1_x3x3_x4_x1 ) );

#! @EndExample
