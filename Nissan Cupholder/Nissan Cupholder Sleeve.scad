/**
 * The cupholders in my old Nissan King Cab are uselessly small. This piece will
 *   press-fit into the cupholder and flutes out slightly so that cups with a
 *   bigger butt will fit and not tip over
 */

// Minimum angle - use for final rendering
$fa = 1;
// Minumum size - use for final rendering
$fs = 0.1;

// How thick are the walls?
wallThickness = 2.6;

// Fit the lower part of the cupholder
lowerRingDiameter = 70;
lowerRingHeight = 34;

// Fit the upper part of the cupholder
upperRingDiameter = 87;
upperRingHeight = 26;

// Above the cupholder - a widening sleeve so that bigger cups can fit
topRingEndingDiameter = 95;
topRingHeight = 95;

// Dimensions for a handle cutout
handleHeight = 75;
handleWidth = 25;

// Make a 45deg angle to join the top and bottom without needing supports for printing
joinerHeight = upperRingDiameter - lowerRingDiameter;

orientForPrinting = true;

// lowerRing();
// upperRing();
// topRing();
// joiner();
// handleCutout();
// construction();

if( orientForPrinting )
{
	rotate( [0, 0, 90] ) rotate( [180, 0, 0] ) construction();
} 
else 
{
	construction();
}

module construction()
{
	difference()
	{
		{
			union()
			{
				lowerRing();
				translate( [0, 0, lowerRingHeight] ) upperRing();
				translate( [0, 0, lowerRingHeight + upperRingHeight] ) topRing();
				translate( [0, 0, lowerRingHeight - 1] ) joiner();
			}
		}
		{
			translate( [topRingEndingDiameter/2 - 10, 0, lowerRingHeight + upperRingHeight + topRingHeight - handleHeight] ) 
			{
				handleCutout();
			}
		}
	}
}

module handleCutout()
{
	cutoutWidth = 10;

	rotate( [0, 90, 0] )
	{
		cylinder( d = handleWidth, h = cutoutWidth );
		translate( [-1 * handleHeight - 0.1, -1 * (handleWidth/2), 0] ) cube( [handleHeight + 0.1, handleWidth, cutoutWidth] );
	}
}

module joiner()
{
	difference()
	{
		{
			union()
			{
				{
					hull()
					{
						cylinder( d= lowerRingDiameter, h = 1 );
						translate( [0, 0, joinerHeight] ) cylinder( d= upperRingDiameter, h = 1 );
					}
				}
				{
					translate( [0, 0, 0] ) cylinder( d= upperRingDiameter, h = joinerHeight );
				}
			}
		}
		{
			hull()
			{
				translate( [0, 0, -0.1] ) cylinder( d= lowerRingDiameter - (wallThickness * 2.45), h = 1.1 );
				translate( [0, 0, joinerHeight] ) cylinder( d= upperRingDiameter - (wallThickness * 2), h = 1.1 );
			}
		}
	}
}

module topRing()
{

	difference()
	{
		{
			cylinder( d1 = upperRingDiameter, d2 = topRingEndingDiameter, h = topRingHeight );
		}
		{
			translate( [0, 0, -0.1] ) cylinder( d1 = upperRingDiameter - (wallThickness * 2), d2 = topRingEndingDiameter - (wallThickness * 2), h = topRingHeight + 0.2 );
		}
	}

}

module lowerRing()
{
	difference()
	{
		{
			cylinder( d = lowerRingDiameter, h = lowerRingHeight );
		}
		{
			translate( [0, 0, -0.1] ) cylinder( d = lowerRingDiameter - (wallThickness * 2), h = lowerRingHeight + 0.2 );
		}
	}
}

module upperRing()
{
	difference()
	{
		{
			cylinder( d = upperRingDiameter, h = upperRingHeight );
		}
		{
			translate( [0, 0, -0.1] ) cylinder( d = upperRingDiameter - (wallThickness * 2), h = upperRingHeight + 0.2 );
		}
	}
}

