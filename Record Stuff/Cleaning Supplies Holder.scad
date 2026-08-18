// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;


felt_openingWidth 	= 45;
felt_openingLength 	= 122;
felt_openingDepth 	= 19;

brush_openingWidth 	= 18;
brush_openingLength	= 113;
brush_openingDepth	= 19;

needleBrush_openingWidth	= 4;
needleBrush_openingLength	= 8;
needleBrush_openingDepth	= brush_openingDepth;

bottle_openingDiameter 	= 38;
bottle_openingDepth		= brush_openingDepth;

// 45 Spindle
// spindle_openingDiameter 	= 39;
// spindle_openingDepth		= 3;

// Stylus cleaning pod
spindle_openingDiameter 	= 52;
spindle_openingDepth		= 6;

shelf_openingWidth	= bottle_openingDiameter;
shelf_openingLength = 38;
shelf_openingDepth = brush_openingDepth;

// body_X = brush_openingWidth + 14 + felt_openingWidth + (bottle_openingDiameter/2) - 9 + shelf_openingWidth;
// body_Y = brush_openingLength + 8 + needleBrush_openingLength;

body_X = (bottle_openingDiameter*2) + 17;
body_Y = brush_openingLength + 8 + needleBrush_openingLength + spindle_openingDiameter - 3;

body_Z = brush_openingDepth;
floor_depth = 1.6;

extra_wall = 0;
corner_diameter = 3;


main_unit();

module main_unit()
{
	difference()
	{
		{
			translate( [0, 0, -1 * floor_depth] ) linear_extrude( height = body_Z + floor_depth ) offset( r = corner_diameter ) offset( delta = extra_wall ) square( size=[body_X, body_Y] );
		}
		{
			// main_cutouts();
			alternate_cutouts();
		}
	}
}

module alternate_cutouts()
{
	// Dust brush
	cube( [brush_openingWidth, brush_openingLength, brush_openingDepth + 1] );

	// translate( [brush_openingWidth - 8, brush_openingLength - 10, 0] )
	// {
	// 	#cube( [8, 40, 25] );
	// 	#translate( [-3, 0, 0] ) rotate( [0, 0, -4] ) cube( [8, 40, 25] );
	// }

	// End Escap
	// hull()
	// {
	// 	{

	// 	}
	// 	{
	// 		union()
	// 		{
	// 			translate( [brush_openingWidth + 1, -1 * corner_diameter - 1, 0] )
	// 			{
	// 				cylinder( d = 2, h = 25 );
	// 				translate( [-7.5, 0, 0] ) cylinder( d = 2, h = 25 );

	// 				translate( [-2, 4, 0] ) {
	// 					cylinder( d = 2, h = 25 );
	// 					translate( [-4, 0, 0] ) cylinder( d = 2, h = 25 );
	// 				}
	// 			}
	// 		}
	// 	}
	// }

	rca_pinDiameter = 3.5;
	rca_pinHeight = 10;
	rca_shieldDiameter = 9.8;
	rca_shieldHeight = 5.3;
	rca_topDiameter = 13;

	// Felt brush
	translate( [(brush_openingWidth + 16.5), 0, (brush_openingDepth - felt_openingDepth)] ) cube( [felt_openingWidth, felt_openingLength, felt_openingDepth + 1] );
	// Needle brush
	translate( [0, (brush_openingLength + 8), 0] ) cube( [needleBrush_openingWidth, needleBrush_openingLength, needleBrush_openingDepth + 1] );
	//translate( [bottle_openingDiameter + 9.5, (brush_openingLength + 8 + needleBrush_openingLength) + (bottle_openingDiameter/2) -2, 0] ) cube( [needleBrush_openingWidth, needleBrush_openingLength, needleBrush_openingDepth + 1] );
	// Cleaning solution bottle
	translate( [
					(bottle_openingDiameter/2),
					(brush_openingLength + 8 + needleBrush_openingLength) + (bottle_openingDiameter/2) + 4,
					0
				] ) {
					cylinder( d = bottle_openingDiameter, h = bottle_openingDepth + 1 );

					// 45 RPM spindle insert -or- needle cleaning pod
					//translate( [bottle_openingDiameter + 4, 0, brush_openingDepth - spindle_openingDepth] ) cylinder( d = spindle_openingDiameter, h = spindle_openingDepth + 1 );
					translate( [bottle_openingDiameter + 10, 0, brush_openingDepth - spindle_openingDepth] ) cylinder( d = spindle_openingDiameter, h = spindle_openingDepth + 1 );

					// RCA-ended cue light
					// translate( [bottle_openingDiameter + 11, 0, 0] )
					// {
					// 	cylinder( d = rca_pinDiameter, h = rca_pinHeight );
					// 	translate( [0, 0, rca_pinHeight] ) cylinder( d = rca_shieldDiameter, h = rca_shieldHeight );
					// 	translate( [0, 0, rca_pinHeight + rca_shieldHeight] ) cylinder( d = rca_topDiameter, h = 10 );

					// }
				}
}


module main_cutouts()
{
	// Dust brush
	cube( [brush_openingWidth, brush_openingLength, brush_openingDepth] );
	// Felt brush
	translate( [(brush_openingWidth + 14), ((body_Y - felt_openingLength)/2), (brush_openingDepth - felt_openingDepth)] ) cube( [felt_openingWidth, felt_openingLength, felt_openingDepth] );
	// Needle brush
	translate( [0, (brush_openingLength + 8), 0] ) cube( [needleBrush_openingWidth, needleBrush_openingLength, needleBrush_openingDepth] );
	// Cleaning solution bottle
	translate( [
					brush_openingWidth + felt_openingWidth + 14 + (bottle_openingDiameter/2) + 10,
					(brush_openingLength + 8 + needleBrush_openingLength) - (bottle_openingDiameter/2),
					0
				] ) {
					cylinder( d = bottle_openingDiameter, h = bottle_openingDepth );
					// 45 RPM spindle insert
					translate( [0, -1 * (bottle_openingDiameter) - 4, brush_openingDepth - spindle_openingDepth] ) cylinder( d = spindle_openingDiameter, h = spindle_openingDepth );
				}
	// Misc shelf space
	translate( [brush_openingWidth + felt_openingWidth + 14 + (bottle_openingDiameter/2) - 9, 0, 0] ) cube( [shelf_openingWidth, shelf_openingLength, shelf_openingDepth] );
}
