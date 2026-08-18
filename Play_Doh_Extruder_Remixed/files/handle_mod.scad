// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

// #translate( [-6.5, 191, 0] ) rotate( [0, 0, 180] ) import( "crank.stl" );
difference()
{
	{
		translate( [-6.5, 191, 0] ) rotate( [0, 0, 180] ) import( "crank.thicker.stl" );
	}
	{
		rotate( [0, 0, 90] ) import( "axleJO.stl" );
	}
}