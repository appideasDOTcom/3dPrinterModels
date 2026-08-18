
$fa = 1; // minimum angle -- use for final rendering
$fs = 0.1; // minumum size -- use for final rendering

difference()
{
	{
		import( "tavern-floor_no-doors.stl" );
	}
	{
		union()
		{
			translate( [0, 73, -6] ) cube( [10, 20, 20] );
			translate( [43, 8, 15] ) cylinder( d = 2, h = 20 );
			translate( [53, 8, 15] ) cylinder( d = 2, h = 20 );
		}
	}
}


