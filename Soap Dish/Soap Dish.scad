$fa = 1; // minimum angle -- use for final rendering
$fs = 0.1; // minumum size -- use for final rendering

tray_Dimension_x = 75;
tray_Dimension_y = 115;
tray_height = 2.8;

border_Diameter = 2;
vent_Diameter = 18;

nub_Diameter = 4;

dish_Height = 15;
tolerance = 0.4;
lip_Depth = 1.5;
// wall_Thickness = 2.8;
wall_Thickness = 5.0;

tray();
// dish();
// articulated();


module articulated()
{
	dish();
	translate( [border_Diameter - (tolerance*2), border_Diameter - (tolerance*2), dish_Height] ) tray();
}

module dish()
{
	difference()
	{
		{
			translate( [0, 0, 0] ) linear_extrude( height = dish_Height + tray_height ) offset( r = border_Diameter ) square( size = [tray_Dimension_x + wall_Thickness, tray_Dimension_y + wall_Thickness] );
		}
		{
			union()
			{
				translate( [(wall_Thickness/2) + (lip_Depth/2), (wall_Thickness/2) + (lip_Depth/2), -1] ) linear_extrude( height = dish_Height + 2 ) offset( r = border_Diameter ) square( size = [tray_Dimension_x - lip_Depth, tray_Dimension_y - lip_Depth] );
				translate( [(wall_Thickness/2) + (tolerance/2), (wall_Thickness/2) + (tolerance/2), dish_Height] ) linear_extrude( height = tray_height + 1 ) offset( r = border_Diameter ) square( size = [tray_Dimension_x + tolerance, tray_Dimension_y + tolerance] );
				bottom_Drain_Holes();
			}
		}
	}
}

module bottom_Drain_Holes()
{
	bdh_Diamter = 12;

	translate( [tray_Dimension_x/4, wall_Thickness, -3] )
		scale( [1, 1, 1.33] )
		rotate( [90, 0, 0] )
		cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
	translate( [tray_Dimension_x - (tray_Dimension_x/4) + (bdh_Diamter/2), wall_Thickness, -3] )
		scale( [1, 1, 1.33] )
		rotate( [90, 0, 0] )
		cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );

	translate( [0, tray_Dimension_y + wall_Thickness, 0] )
	{
		translate( [tray_Dimension_x/4, wall_Thickness, -3] )
			scale( [1, 1, 1.33] )
			rotate( [90, 0, 0] )
			cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
		translate( [tray_Dimension_x - (tray_Dimension_x/4) + (bdh_Diamter/2), wall_Thickness, -3] )
			scale( [1, 1, 1.33] )
			rotate( [90, 0, 0] )
			cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
	}


	translate( [-1 * wall_Thickness, tray_Dimension_y/5, -3] )
		scale( [1, 1, 1.33] )
		rotate( [0, 90, 0] )
		cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
	translate( [-1 * wall_Thickness, (tray_Dimension_y + (bdh_Diamter/2)) - (tray_Dimension_y/5), -3] )
		scale( [1, 1, 1.33] )
		rotate( [0, 90, 0] )
		cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
	translate( [-1 * wall_Thickness, (tray_Dimension_y + (bdh_Diamter/5)) - (tray_Dimension_y/2), -3] )
		scale( [1, 1, 1.33] )
		rotate( [0, 90, 0] )
		cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );

	translate( [tray_Dimension_x + wall_Thickness, 0, 0] )
	{
		translate( [-1 * wall_Thickness, tray_Dimension_y/5, -3] )
			scale( [1, 1, 1.33] )
			rotate( [0, 90, 0] )
			cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
		translate( [-1 * wall_Thickness, (tray_Dimension_y + (bdh_Diamter/2)) - (tray_Dimension_y/5), -3] )
			scale( [1, 1, 1.33] )
			rotate( [0, 90, 0] )
			cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
		translate( [-1 * wall_Thickness, (tray_Dimension_y + (bdh_Diamter/5)) - (tray_Dimension_y/2), -3] )
			scale( [1, 1, 1.33] )
			rotate( [0, 90, 0] )
			cylinder( d = bdh_Diamter, h = (wall_Thickness + border_Diameter + 2) );
	}
}

module tray()
{
	difference()
	{
		{
			union()
			{
				linear_extrude( height = tray_height ) offset( r = border_Diameter ) square( size = [tray_Dimension_x, tray_Dimension_y] );
				translate( [0, 0, tray_height] ) nubs();
			}
		}
		{
			union()
			{
				drain_Holes();
				translate( [-10, -10, -10] ) cube( [150, 150, 10] );
			}
		}
	}
}

module nubs()
{
	buffer_x = 2.5;
	buffer_y = 6;
	distance = 17.5;

	#translate( [buffer_x, buffer_y, 0] )
	{
		nub();
		translate( [distance, 0, 0] ) nub();
		translate( [distance*2, 0, 0] ) nub();
		translate( [distance*3, 0, 0] ) nub();
		translate( [distance*4, 0, 0] ) nub();
	}
	#translate( [buffer_x, tray_Dimension_y - buffer_y, 0] )
	{
		nub();
		translate( [distance, 0, 0] ) nub();
		translate( [distance*2, 0, 0] ) nub();
		translate( [distance*3, 0, 0] ) nub();
		translate( [distance*4, 0, 0] ) nub();
	}

	translate( [buffer_x, (tray_Dimension_y/3), 0] )
	{
		nub();
		translate( [distance, 0, 0] ) nub();
		translate( [distance*3, 0, 0] ) nub();
		translate( [distance*4, 0, 0] ) nub();
	}
	translate( [buffer_x, tray_Dimension_y - ((tray_Dimension_y/3) + (border_Diameter * 2)), 0] )
	{
		nub();
		translate( [distance, 0, 0] ) nub();
		translate( [distance*3, 0, 0] ) nub();
		translate( [distance*4, 0, 0] ) nub();
	}

	translate( [buffer_x, (tray_Dimension_y/5) - border_Diameter, 0] )
	{
		translate( [distance*2, 0, 0] ) nub();
	}
	translate( [buffer_x, tray_Dimension_y - ((tray_Dimension_y/5) + 0), 0] )
	{
		translate( [distance*2, 0, 0] ) nub();
	}
	translate( [buffer_x, (tray_Dimension_y/2) - border_Diameter, 0] )
	{
		translate( [distance*2, 0, 0] ) nub();
	}

}

module nub()
{
	sphere( d = nub_Diameter );
}

module drain_Holes()
{
	union()
	{
		translate( [((tray_Dimension_x/5) - (border_Diameter)), (tray_Dimension_y/5) - border_Diameter, -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );
		translate( [((tray_Dimension_x/5) - (border_Diameter)), (tray_Dimension_y/2) - border_Diameter, -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );
		translate( [((tray_Dimension_x/5) - (border_Diameter)), tray_Dimension_y - ((tray_Dimension_y/5) + border_Diameter), -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );

		translate( [(tray_Dimension_x + border_Diameter) - ((tray_Dimension_x/5) - (border_Diameter)), (tray_Dimension_y/5) - border_Diameter, -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );
		translate( [(tray_Dimension_x + border_Diameter) - ((tray_Dimension_x/5) - (border_Diameter)), (tray_Dimension_y/2) - border_Diameter, -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );
		translate( [(tray_Dimension_x + border_Diameter) - ((tray_Dimension_x/5) - (border_Diameter)), tray_Dimension_y - ((tray_Dimension_y/5) + border_Diameter), -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );

		// translate( [((tray_Dimension_x/2) + (border_Diameter/2)), (tray_Dimension_y/10) - border_Diameter, -1] )
		// 	cylinder( d = vent_Diameter, h = tray_height + 2 );
		// translate( [((tray_Dimension_x/2) + (border_Diameter/2)), tray_Dimension_y - ((tray_Dimension_y/10) - border_Diameter), -1] )
		// 	cylinder( d = vent_Diameter, h = tray_height + 2 );

		translate( [((tray_Dimension_x/2) + (border_Diameter/2)), (tray_Dimension_y/3) + 0, -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );
		translate( [((tray_Dimension_x/2) + (border_Diameter/2)), tray_Dimension_y - ((tray_Dimension_y/3) + (border_Diameter * 2)), -1] )
			cylinder( d = vent_Diameter, h = tray_height + 2 );
	}
}



