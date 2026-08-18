// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

board_X = 92.3;
board_Y = 75.3;

bolt_distanceX = 85.5;
bolt_distanceY = 68.5;
bolt_cutoutDiameter = 1.6;

delta_X = board_X - bolt_distanceX;
delta_Y = board_Y - bolt_distanceY;

board_offsetX = -1 * (delta_X/2);
board_offsetY = -1 * (delta_Y/2);

wall_Height = 7.8;
corner_Radius = 3.2;

support_Diameter = 10;
support_Height = 6;
floor_Height = 2;

flange_Height = 1.2;
flange_Diameter = 3.2;

lid_Offset = 0.4;
indent_Amount = 0.8;

lid_Height = wall_Height + floor_Height + 14;


// base();
lid();

module lid()
{
	difference()
	{
		{
			lidBody();
		}
		{
			union()
			{
				lidCutout();
				// Wall cutouts
				translate( [bolt_distanceX + 2, 0, 0] ) cube( [10, bolt_distanceY, 14] ); // Opening for 16 - 128
				translate( [0, -12, 0] ) cube( [63, 10, 14] ); // Opening for 1-8
				translate( [-10, bolt_distanceY - 22, 0] ) cube( [10, 22, 20] ); // USB opening

				// Number labels
				// #translate( [bolt_distanceX, 57, lid_Height + floor_Height - indent_Amount] ) cylinder( d = 2, h = 10 );
				translate( [9, 0, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 180] ) makeText( "1", 5 );
				translate( [24, 0, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 180] ) makeText( "2", 5 );
				translate( [39, 0, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 180] ) makeText( "4", 5 );
				translate( [54, 0, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 180] ) makeText( "8", 5 );

				translate( [bolt_distanceX, 16, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 270] ) makeText( "16", 5 );
				translate( [bolt_distanceX, 31, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 270] ) makeText( "32", 5 );
				translate( [bolt_distanceX, 46, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 270] ) makeText( "64", 5 );
				translate( [bolt_distanceX, 63, lid_Height + floor_Height - indent_Amount] ) rotate( [0, 0, 270] ) makeText( "128", 5 );
			}
		}
	}
}

module makeText( input, fontSize )
{
	// use <fonts/BigShoulderStencilText-ExtraBold.ttf>
	font = "Menlo:style=Bold";
	fontHeight = 5;


	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( input, font = font, size = (fontSize * 1) );
	}
}

module lidBody()
{
	translate( [board_offsetX, board_offsetY, flange_Height] )
	{
		linear_extrude( height = lid_Height + (floor_Height - flange_Height) ) offset( corner_Radius + flange_Diameter ) square( size = [board_X, board_Y] );
	}
}


module lidCutout()
{
	translate( [board_offsetX, board_offsetY, 0] )
	{
		linear_extrude( height = lid_Height ) offset( corner_Radius + lid_Offset ) square( size = [board_X, board_Y] );
	}
}


module base()
{
	union()
	{
		baseBody();
		posts();
	}
}

module baseBody()
{
	difference()
	{
		{
			union()
			{
				translate( [board_offsetX, board_offsetY, 0] )
				{
					linear_extrude( height = wall_Height + floor_Height ) offset( corner_Radius ) square( size = [board_X, board_Y] );
					linear_extrude( height = flange_Height ) offset( corner_Radius + flange_Diameter ) square( size = [board_X, board_Y] );
				}
			}
		}
		{
			union()
			{
				boardCutout();
			}
		}

	}
}

module boardCutout()
{
	translate( [board_offsetX, board_offsetY, floor_Height] ) cube( [board_X, board_Y, wall_Height + 1] );
}

module posts()
{
	translate( [0, 0, floor_Height] )
	{
		difference()
		{
			{
				union()
				{
					cylinder( d = support_Diameter, h = support_Height );
					translate( [ bolt_distanceX, 0, 0 ] ) cylinder( d = support_Diameter, h = support_Height );
					translate( [ 0, bolt_distanceY, 0 ] ) cylinder( d = support_Diameter, h = support_Height );
					translate( [ bolt_distanceX, bolt_distanceY, 0 ] ) cylinder( d = support_Diameter, h = support_Height );
				}

			}
			{
				union()
				{
					cylinder( d = bolt_cutoutDiameter, h = 15 );
					translate( [ bolt_distanceX, 0, 0 ] ) cylinder( d = bolt_cutoutDiameter, h = 15 );
					translate( [ 0, bolt_distanceY, 0 ] ) cylinder( d = bolt_cutoutDiameter, h = 15 );
					translate( [ bolt_distanceX, bolt_distanceY, 0 ] ) cylinder( d = bolt_cutoutDiameter, h = 15 );
				}
			}
		}
	}
}