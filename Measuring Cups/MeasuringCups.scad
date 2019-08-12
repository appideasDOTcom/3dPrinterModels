/**
Custom measuring cup sizes for my specific needs. Maybe-probably won't be useful for anyone else.
I need 2.5T, 4T, 5T, 6T, 10T and 15T, so we will create half-spheres for those volumes as cutouts
(yes, I know that 4T is the same as 1/4 cup, but I wanted a matching set)

This code was specifically designed to make variations based on tablespoons easy to create. If you need something
other than tablespoons, convert the units you need into US tablespoons and use that number as the value for
numberOfTablespoons. For example, to make a 100ml measuring cup, use 6.7628 as the value.

I haven't needed to use geometry like this in real life, ever. Mr Dowel told me in 1982 that I would, but I didn't believe him.

To make a cup of your own size, change the numberOfTablespoons and handleLabel variable values. There are other
variables to alter the output. Read the comments for details.

- costmo
- 2019-10-11
**/

numberOfTablespoons = 5; // Set this to the number of tablespoons the cup is to measure
handleLabel = "5T"; // Set this to the label you want to appear on the handle. 2 - 4 characters

// Default facet count settings (control model smoothness)
//$fn = 30; // Number of facets -- very inneficient way to control rendering smoothness. Probably should leave this commented
//
$fa = 3; // minimum angle -- use for final rendering
$fs = 0.2; // minumum size -- use for final rendering
//
// $fa = 5; // minimum angle --  use for previewing
// $fs = 1; // minumum size -- use for previewing

cornerDiameter = 2; // how round to make the corners
lipRadius = 10; // the radius of the pouring lip
bottomClearance = 2; // the thickness of the floor and shell at its minimum

letterHeight = 1.4; // label letter height. Too tall is brittle. Too short can't bee seen.
fontSize = 6; // label font size. 6 is as large as will fit on the handle.
font = "monaco"; // label font - You maybe want something like "courier" for Windows. I dunno. This was done on a Mac, and that's probably the only place "monaco" will work. Sorry.

multiplicationFactor = 1.05; // Scale the input radius for the given volume by this much to account for printing inaccuaracies (1.0 = 100%). Default: 105%

textOffsetDivisor = 3.1; // Set the distance of the label from the cup. 2.5 will roughly center a two character label on the handle.

// get to work!
// To make different cups, replace the first input the number of tablespoons to make
//   and change the second input to a string (2-4 characters) to print on the handle
makeCup( numberOfTablespoons, handleLabel );

// wrapper to make a cup and put things in place
module makeCup( tablespoons, label )
{
	// Calculate the volume of sphere we need to create. V = (4/3) * pi * r^3
	mm3PerTablespoon = 14786.8; // volume of one tablespoon in mm^3
	tablespoons = tablespoons * 2; // Double the volume (make a sphere with twice as much as the desired volume, thenm cut it in half to make the cup)
	mm3 = tablespoons * mm3PerTablespoon; // total volume of the full sphere in mm^3
	fourThirdsPi = 4.1888; // A constant needed for the formula - (4/3) * pi
	r3 = mm3 / fourThirdsPi; // Solve for r-cubed
	radius = pow( r3, (1/3) ); // We've got radius! Now get to it...

	topCutoutOffsetZ = (radius + bottomClearance);
	lipcutoutOffsetY = (radius - 7.8);

	union()
	{
		difference() // create the outer sphere and coutout the top and bottom
		{
			hull() // change to union() to make a more spherical cup
			{
				{
					translate( [ 0, 0, radius ] ) // outer sphere - the shell of the measuring cup
					{
						sphere( radius + (bottomClearance * 1.5) );
					}
				}
				{
					sphere( (radius * 0.7) ); // make a bottom partial sphere for a more solid base and cleaner printing
				}
			}
			union() // cutout out the top and bottom of the shell
			{
				bottomCutoutOffsetXY = (-1 * radius);
				topCutoutOffsetXY = (-1 * (radius*2));
				translate( [bottomCutoutOffsetXY, bottomCutoutOffsetXY, (-1 * radius)] ) // bottom shell cutout
				{
					cube( [radius*4, radius*4, radius] );
				}
				translate( [topCutoutOffsetXY, topCutoutOffsetXY, topCutoutOffsetZ] ) // top shell cutout
				{
					cube( [(radius*4), (radius*4), (radius*2)] );
				}
			}
			translate( [ 0, 0, (radius + bottomClearance) ] ) // shell out the inner cup
			{
				sphere( radius );
			}
			union() // pouring lip cutouts
			{
				translate( [0, lipcutoutOffsetY, topCutoutOffsetZ] ) // make a lip on one edge of the container for pouring - opposite the handle
				{
					sphere( lipRadius );
				}
				translate( [lipcutoutOffsetY, 0, topCutoutOffsetZ] ) // make a lip on one edge of the container for pouring - counter-clockwise to the handle
				{
					sphere( lipRadius );
				}
				translate( [(-1 * lipcutoutOffsetY), 0, topCutoutOffsetZ] ) // make a lip on one edge of the container for pouring - clockwise to the handle
				{
					sphere( lipRadius );
				}
			}
		} // difference between outer sphere & handle and various cutouts
		difference() // add the handle
		{
			makeHandle( radius, label ); // make the handle
			translate( [ 0, 0, (radius + bottomClearance) ] ) // shell out the inner cup (again) to clear out places where the handle pokes through into the cup
			{
				sphere( radius );
			}
		}
	}
	
	
} // makeCup

module makeHandle( radius, label )
{
	handleWidth = (10 - (cornerDiameter * 2));
	handleLength = (50 - (cornerDiameter * 2));
	handleHeight = ((radius + bottomClearance) - (cornerDiameter * 2));
	thumbHoleCutoutDiameter = 10;
	thumbHoleCutoutOffsetX = (thumbHoleCutoutDiameter + (thumbHoleCutoutDiameter/10));
	thumbHoleCutoutOffsetY = (thumbHoleCutoutDiameter/1.2);
	thumbHoleCutoutOffsetZ = (handleHeight - (thumbHoleCutoutDiameter / 1.6));

	handleLengthConstant = 34.608; // An offset for handle length based on cup size. I came up with this number after some experiments. Adjust to personal preference.
	extraOffset = ((radius - handleLengthConstant) / 2) + 3; // if you want the handle to be further away or closer, set this to something else

	union()
	{
		translate( [0, ((-1.8 * radius) + extraOffset), 0] ) // handle
		{
			difference()
			{
				hull() // main handle
				{
					translate( [(-1 * (handleWidth/2)), 0, cornerDiameter] ) // Main cube for handle
					{
						cube( [handleWidth, handleLength, handleHeight] );
					}
					union() // rounded handle corners
					{
						translate( [(-1 * (handleWidth/2)), 0, cornerDiameter] )
						{
							sphere( cornerDiameter );
						}
						translate( [(-1 * (handleWidth/2)), handleLength, cornerDiameter] )
						{
							sphere( cornerDiameter );
						}
						translate( [(handleWidth/2), 0, cornerDiameter] )
						{
							sphere( cornerDiameter );
						}
						translate( [(handleWidth/2), handleLength, cornerDiameter] )
						{
							sphere( cornerDiameter );
						}
						translate( [(-1 * (handleWidth/2)), 0, (handleHeight + cornerDiameter)] )
						{
							sphere( cornerDiameter );
						}
						translate( [(-1 * (handleWidth/2)), handleLength, (handleHeight + cornerDiameter)] )
						{
							sphere( cornerDiameter );
						}
						translate( [(handleWidth/2), 0, (handleHeight + cornerDiameter)] )
						{
							sphere( cornerDiameter );
						}
						translate( [(handleWidth/2), handleLength, (handleHeight + cornerDiameter)] )
						{
							sphere( cornerDiameter );
						}
					}
				}
				union()
				{
					translate( [thumbHoleCutoutOffsetX, thumbHoleCutoutOffsetY, thumbHoleCutoutOffsetZ] )
					{
						sphere( thumbHoleCutoutDiameter );
					}
					translate( [(-1 * thumbHoleCutoutOffsetX), thumbHoleCutoutOffsetY, thumbHoleCutoutOffsetZ] )
					{
						sphere( thumbHoleCutoutDiameter );
					}
				}
			}
		}
		translate( [0, (((-1 * radius*2) + (handleLength/textOffsetDivisor)) + extraOffset), ((handleHeight  + (cornerDiameter * 2)) - 0.1)] ) // draw the label on the handle
		{
			rotate( a = 270, v = [0, 0, 1.0] )
			{
				linear_extrude( height = letterHeight )
				{
					text( label, size = fontSize, font = font, halign = "center", valign = "center" );
				}
			}
		}

	}

}
