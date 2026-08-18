//!OpenSCAD
include <font/OpenSans_bottom.scad>
include <font/OpenSans_top.scad>

$fa = 1; // minimum angle -- use for final rendering
$fs = 0.1; // minumum size -- use for final rendering

shelf_wallThickness = 0.6;
shelf_wallDepth = 50;
shelf_wallHeight = 35;
shelf_supportWidth = 5;

corner_diameter = 3;

shelf_wallOffset = 1.1;

difference()
{
	linear_extrude( height = shelf_wallThickness ) offset( r = corner_diameter/2 ) translate( [shelf_wallOffset, 0, 0] ) square( size=[shelf_wallDepth - shelf_wallOffset, shelf_wallHeight] );
	union()
	{
		translate( [-1, 10, -1] ) linear_extrude( height = shelf_wallThickness + 2 ) offset( r = corner_diameter/2 ) translate( [shelf_wallOffset, 0, 0] ) square( size=[((shelf_wallDepth - shelf_wallOffset)/2) + 1, shelf_wallHeight] );
		// translate( [-100 + 6, 0, -1] ) cube( [100, 100, 10] );
	}
}

letter_C();


// color("green")

module letter_A()
{
	translate([-5.05, 0.72 - (corner_diameter/2), 0])
	{
		scale( [0.4, 0.4, 1] )
		{
			import( "font/A.stl" );
		}
	}
}

module letter_B()
{
	translate([-0, 0.72 - (corner_diameter/2), 0])
	{
		scale( [0.4, 0.4, 1] )
		{
			import( "font/B.stl" );
		}
	}
}

module letter_C()
{
	translate([-5.05, 0.72 - (corner_diameter/2), 0])
	{
		scale( [0.4, 0.4, 1] )
		{
			import( "font/C.stl" );
		}
	}
}
