/**
 * A tool holder that's identical in function to this one:
 * https://www.thingiverse.com/thing:1994745
 * Which is a remix of this:
 * https://www.thingiverse.com/thing:872507
 *
 * This model can print much faster than the original, and the code below provides variables to make some easy changes.
 * Specifying more or fewer rows of "tall cylinders" (numTallRows) works as you would hope. My original use of this model was to
 *    make a version that had two rows of "tall" cylinders.
 * In theory, you can change the number of rows (numRows) and columns (numColumns) until you fill your printer's available volume.
 * In reality, I haven't made it adapt to more than 2 columns or 5 rows. Less than that is OK, so print "little versions" if you
 *    need fewer tools to be held. They're adorable and they print faster.
 *
 * To print this model at high speeds, you should increase the number of perimeters in your slicer until there is no infill except in the
 *   few thick spots that are in the floor, then increase the perimeter printing speed. Five or more perimeters should give you the desired
 *   effect. So crank up your perimeter print speeds and get to printing!
 *
 * I like the original tool holder a lot, and I've printed a bunch of them, but I was getting tired of waiting for my printer to spend all that
 *   extra time drawing the funky shapes that make up the floor while performing many (MANY) entirely superfluous non-printing moves.
 *   This model is made mostly of curves, and all sharp angles are acute, so there shouldn't be a lot of non-print moves. This means
 *   you can increase your printer's speed without loss of quality. The end-result will be that print defects due to the increased speed
 *   at sharp junctions will disappear inside of the perimeters. The defects will still exist, they'll just be in places that can't be seen.
 *
 * Although this model looks a lot like the one from which it was inspired, the code below that creates the model is an entirely original
 *   work of APPideas. The code and models are licensed under the GPLv3. New versions are released through github:
 *   https://github.com/appideasDOTcom/3dPrinterModels
**/

// Render quality settings. Set to higher values if you're tired of waiting for rendering and don't mind losing a little theoretical quality. (The reality is that your printer will probably print the exact same piece either way.)
// This model takes a VERY long time to render with my personal "highest quality" settings of $fa = 1 and $fs = 0.1
// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

// General parameters that you may want to change
// Number of columns
numColumns = 2; // This probably isn't going to work well as more than 2
// Number of rows
numRows = 2; // Will need to adjust some things to use numbers > 5. Less is OK.
// How many rows of tall cylinders?
numTallRows = 1;
// Height of the shorter cylinders
shortCylinderHeight = 35; // 55 for Cricut tools, 35 for "normal"
// Height of the taller cylinders
tallCylinderHeight = 80;
// Distance between cylinders on the X axis (column spacing)
cylinderXDistance = 50;
// Distance between cylinders on the Y axis (row spacing)
cylinderYDistance = 30;

// More specific parameters that are normally left alone
// The diameter of the tool holder holes
holderInnerDiameter = 24; // originally 20

// How thick to make the walls of the piece
wallThickness = 3.2;

// adjust to make the top ring fit the diamter
topRingDivisor = 1.89;

// How thick to make the floor
floorDepth = 4;
// How tall to make the outer (container) wall
wallHeight = 10;
// How round are the rounded corners?
cornerDiameter = 6;
// How much buffer to make bewtween the cylinders and the walls
extraFloorPerimeter = 8;


// Below here are calculated values. Probably don't change them manually.
// The outer diameter of a holder cylinder
holderOuterDiameter = holderInnerDiameter + wallThickness;
// How large the floor is on the X axis
floorXDimension = ((numColumns - 1) * cylinderXDistance) + holderOuterDiameter + (extraFloorPerimeter * 2);
// How large the floor is on the Y axis
floorYDimension = ((numRows - 1) * cylinderYDistance) + holderOuterDiameter + (extraFloorPerimeter * 2);



// Connect the modules to generate a fully rendered piece
difference()
{
	{
		union()
		{
			renderCylinders();
			rawFloor();
			outerWall();
			allSidewallSupports();
			// add a vape holder
			translate( [13.1, -2, 0] ) scale( [1.1, 1.1, 1] ) import( "../Vaporesso Case/vaporesso_case-short.stl" );
		}
	}
	{
		union()
		{
			cylinderCutouts();
			boundaryCutoffs();
		}
	}
}

module sideWallSupport()
{
	difference()
	{
		{
			translate( [-12.5, 0, 0] ) scale( [1, 1, 1] ) cylinder( d = holderInnerDiameter, h = floorDepth );
		}
		{
			union()
			{
				translate( [-14, 15, -1] ) scale( [0.75, 1.3, 1] ) cylinder( d = (holderInnerDiameter + (20 - holderInnerDiameter)), h = floorDepth + 2 );
				translate( [-14, -15, -1] ) scale( [0.75, 1.3, 1] ) cylinder( d = (holderInnerDiameter + (20 - holderInnerDiameter)), h = floorDepth + 2 );
			}
		}
	}
}


module allSidewallSupports()
{
	for( i = [0:(numRows - 1)] )
	{
		translate( [0, (i * cylinderYDistance), 0] )
		{
			sideWallSupport();
			translate( [cylinderXDistance, 0, floorDepth] ) rotate( [180, 0, 180] ) sideWallSupport();
		}
	}
}

module rowOfSticks()
{
	for( i = [0:(numRows - 1)] )
	{
		translate( [0, (i * cylinderYDistance), 0] ) connectorStick();
	}
	translate( [0, -17.4, 0] ) connectorStick( height = wallHeight );
	translate( [0, (numRows * cylinderYDistance) - 12.4, 0] ) connectorStick( height = wallHeight );
}

module boundaryCutoffs()
{
	union()
	{
		translate( [-1 * (holderOuterDiameter/2) - extraFloorPerimeter - 1, -49.8 - (holderOuterDiameter/2) - extraFloorPerimeter, -1] ) cube( [floorXDimension + 2, 50, wallHeight + 2 ] );
		translate( [-1 * (holderOuterDiameter/2) - extraFloorPerimeter - 1, -5 - (holderOuterDiameter/2) + floorYDimension - 3.2, -1] ) cube( [floorXDimension + 2, 100, wallHeight + 2 ] );

		translate( [-49.4 - (holderOuterDiameter/2) - extraFloorPerimeter, -1 * (holderOuterDiameter/2) - extraFloorPerimeter - 1, -1] ) cube( [50, floorYDimension + 2, wallHeight + 2] );
		translate( [cylinderXDistance + (holderOuterDiameter/2) + extraFloorPerimeter, -1 * (holderOuterDiameter/2) - extraFloorPerimeter - 1, -1] ) cube( [50, floorYDimension + 2, wallHeight + 2] );
	}
}

module sideStick()
{
	hull()
	{
		{}
		{
			union()
			{
				translate( [-1 * (holderOuterDiameter/2) + (cornerDiameter/2) + 0.8, 6.25, 0] ) cylinder( d = wallThickness, h = wallHeight );
				translate( [(holderOuterDiameter/2) - (cornerDiameter/2) - 0.8, cylinderYDistance - 6.25, 0] ) cylinder( d = wallThickness, h = wallHeight );
			}
		}
	}
}

module connectorStick( height = floorDepth )
{
	difference()
	{
		{
			union()
			{
				hull()
				{
					{}
					{
						union()
						{
							translate( [0, -1 * (holderOuterDiameter/2) + (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h = height );
							translate( [cylinderXDistance, (holderOuterDiameter/2) - (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h = height );
						}
					}
				}

				hull()
				{
					{

					}
					{
						union()
						{
							translate( [cylinderXDistance, -1 * (holderOuterDiameter/2) + (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h = height );
							translate( [0, (holderOuterDiameter/2) - (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h = height );
						}
					}
				}
			}
		}
		{
			union()
			{
				translate([ cylinderXDistance/2, (cylinderYDistance/2), -1] ) scale( [1.67, 0.95, 1] ) cylinder( d = 25, h = height + 2 );
				translate([ cylinderXDistance/2, -1 * (cylinderYDistance/2), -1] ) scale( [1.67, 0.95, 1] ) cylinder( d = 25, h = height + 2 );

				translate([ (holderOuterDiameter/2) - 1, (cylinderYDistance/2) -15, -1] ) scale( [1.3, 0.4, 1] ) cylinder( d = 8, h = height + 2 );
				translate([ cylinderXDistance - (holderOuterDiameter/2) + 1, (cylinderYDistance/2) -15, -1] ) scale( [1.3, 0.4, 1] ) cylinder( d = 8, h = height + 2 );
			}

		}
	}

}

module rowOfSidesticks()
{
	union()
	{
		sideStick();
		translate( [0, (cylinderYDistance * 2), 0] ) sideStick();
		translate( [cylinderXDistance, cylinderYDistance, 0] ) sideStick();
		translate( [cylinderXDistance, (cylinderYDistance *3), 0] ) sideStick();
	}
}



module rawFloor()
{
	difference()
	{
		{
			union()
			{
				rowOfSticks();
				rowOfSidesticks();

				translate( [cylinderXDistance, 0, wallHeight] ) rotate( [180, 0, 180] ) rowOfSidesticks();

			}


		}
		{

		}
	}
}



module outerWall()
{
	translate( [(-1 * (holderOuterDiameter/2)) - extraFloorPerimeter + (cornerDiameter/2), (-1 * (holderOuterDiameter/2)) - extraFloorPerimeter + (cornerDiameter/2), 0] )

	difference()
	{
		{
			hull()
			{
				{

				}
				{
					union()
					{
						cylinder( d = cornerDiameter, h = wallHeight );
						translate( [floorXDimension - cornerDiameter, 0, 0] ) cylinder( d = cornerDiameter, h = wallHeight );
						translate( [floorXDimension - cornerDiameter, floorYDimension - cornerDiameter, 0] ) cylinder( d = cornerDiameter, h = wallHeight );
						translate( [0, floorYDimension - cornerDiameter, 0] ) cylinder( d = cornerDiameter, h = wallHeight );
					}
				}
			}
		}
		{
			translate( [0, 0, -1] )
			{
				hull()
				{
					{

					}
					{
						union()
						{
							translate( [wallThickness, wallThickness, 0] )cylinder( d = cornerDiameter, h = wallHeight + 2 );
							translate( [floorXDimension - cornerDiameter - wallThickness, wallThickness, 0] ) cylinder( d = cornerDiameter, h = wallHeight + 2 );
							translate( [floorXDimension - cornerDiameter - wallThickness, floorYDimension - cornerDiameter - wallThickness, 0] ) cylinder( d = cornerDiameter, h = wallHeight + 2 );
							translate( [wallThickness, floorYDimension - cornerDiameter - wallThickness, 0] ) cylinder( d = cornerDiameter, h = wallHeight + 2 );
						}
					}
				}
			}
		}
	}

}


module cylinderTop()
{
	rotate_extrude( convexity = 10 ) translate([(holderInnerDiameter/topRingDivisor), 0, 0]) circle( d = (wallThickness/2) + 0.2, $fn = 100 );
}


module renderCylinders()
{
	for( row = [0 : (numRows - 1)] )
	{
		for( column = [0 : (numColumns - 1)] )
		{
			translate( [(column * cylinderXDistance), (row * cylinderYDistance), 0] )
			{
				if( row < numTallRows )
				{
					makeCylinder( height = tallCylinderHeight );
				}
				else
				{
					makeCylinder( height = shortCylinderHeight );
				}
			}

		}
	}
}

module cylinderCutouts()
{
	for( row = [0 : (numRows - 1)] )
	{
		for( column = [0 : (numColumns - 1)] )
		{
			translate( [(column * cylinderXDistance), (row * cylinderYDistance), 0] )
			{
				translate( [0, 0, floorDepth] ) cylinder( d = holderInnerDiameter, h = tallCylinderHeight );
			}

		}
	}
}

module makeCylinder( height = shortCylinderHeight )
{
	translate( [0, 0, height] ) cylinderTop();

	difference()
	{
		{
			cylinder( d = holderOuterDiameter, h = height );
		}
		{
			translate( [0, 0, floorDepth] ) cylinder( d = holderInnerDiameter, h = height );
		}
	}
}

