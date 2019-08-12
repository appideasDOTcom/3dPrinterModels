/**
Make 6 drawers that run the full drawer depth.
Assorted packs of resistors ordered from Amazon typically come in 30 denominations, so 5 drawers with 6 compartments is perfect for my needs

- costmo
- 2017-10-12
**/

// Default facet count settings (control model smoothness)
//$fn = 64; // Number of facets -- very inneficient way to control rendering smoothness. Probably should leave this commented
//
$fa = 4; // minimum angle -- use for final rendering
$fs = 0.5; // minumum size -- use for final rendering
//
//$fa = 5; // minimum angle --  use for previewing
//$fs = 1; // minumum size -- use for previewing

// Various measurements
numCompartments = 6; // change this to make more or fewer compartments
wallThickness = 1; // how thick to make the outer walls
cornerRadius = 2; // how round we want the corners to be
totalWidth = 120; // The total width of the drawer
usableWidth = (totalWidth - (wallThickness * 2)); // the usable (inner) width of the drawer
numInnerWalls = numCompartments - 1; // the number of walls there will be
innerSectionWidth = (totalWidth - ((wallThickness * 2) + (wallThickness * numInnerWalls))) / numCompartments; // The width of each section's cutout block
totalHeight = 18; // The total height of the drawer

// Rotate the whole thing 180 deg so that the STL file preview is oriented correctly on Thingiverse :-)
rotate( a = 180, v = [0, 0, 1] )
{
	union() // make the unit by pulling in the orginial drawer, fill the drawer, then cutout rounded rectangles
	{
		// pull in the original model and move it to somewhere on the platform that's easier to translate
		translate( [5, -133, 0] )
		{
			import( "Drawer_1_compartment.stl" );
		}
		difference()
		{
			// make a cube that fills the tray
			translate( [(-1 * (wallThickness + usableWidth)), wallThickness, wallThickness] )
			{
				cube( [usableWidth, usableWidth, (totalHeight - wallThickness)] );
			}
			for( i = [1 : 1: numCompartments] ) // remove the compartments
			{
				loopY = ((i * wallThickness) + ((i - 1) * innerSectionWidth));
				wallCutout( loopY );
			}
		}
	}
}

// create a block for cutout (difference) from a loop
module wallCutout( positionY )
{
	hull()
	{
		translate( [(-1 * (usableWidth)), (positionY + cornerRadius), (wallThickness + cornerRadius)] ) // main block
		{
			cube( [(usableWidth - cornerRadius - wallThickness), (innerSectionWidth - (cornerRadius * 2)), (totalHeight - wallThickness)] ); // main cube for the cutout
		}
		union() // spheres for corner hulls
		{
			innerCutoutCorners( positionY, (wallThickness + cornerRadius) ); // bottom corners
			innerCutoutCorners( positionY, (totalHeight) ); // top corners
		}
	}
}

// Add corners to the cutout to create a hull
module innerCutoutCorners( positionY, positionZ )
{
	translate( [(-1 * (cornerRadius + wallThickness)), (positionY + cornerRadius), positionZ] )
	{
		sphere( cornerRadius );
	}
	translate( [(-1 * usableWidth), (positionY + cornerRadius), positionZ] )
	{
		sphere( cornerRadius );
	}
	translate( [(-1 * (cornerRadius + wallThickness)), (positionY + innerSectionWidth - cornerRadius), positionZ] )
	{
		sphere( cornerRadius );
	}
	translate( [(-1 * usableWidth), (positionY + innerSectionWidth - cornerRadius), positionZ] )
	{
		sphere( cornerRadius );
	}
}

