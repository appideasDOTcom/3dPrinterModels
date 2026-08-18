/**
* A wall-mounted cable holder/organizer
*/

// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

piece_diameter = 40;
piece_length = 87;

cable_diameter= 6.4;
cable_shelf = 5;
cable_inset = 12;

construction();

module construction() {
	difference() {
		{
			main_unit();
		}
		{
			union() {
				{
					translate( [12, -1 * (piece_diameter/2), 0] ) cutout_magsafe2();
				}
				{
					translate( [31.25, -1 * (piece_diameter/2), 0] ) cutout_lighnting();
					translate( [45.5, -1 * (piece_diameter/2), 0] ) cutout_lighnting();

					translate( [61, -1 * (piece_diameter/2), 0] ) cutout_usbc();
					translate( [78, -1 * (piece_diameter/2), 0] ) cutout_usbc();
				}
			}
		}
	}
}

module main_unit() {

	x_scale = 0.5;

	difference()
	{
		{
			hull() {
				{
					scale( [x_scale, 1, 1] ) sphere( d = piece_diameter );
				}
				{
					translate( [piece_length, 0, 0] ) scale( [x_scale, 1, 1] ) sphere( d = piece_diameter );
				}
			}
		}
		{
			union() {
				{
					translate( [(-1 * (piece_diameter/2)) - 1, 0, (-1 * (piece_diameter/2)) - 1] ) cube( [(piece_length + (piece_diameter)) + 2, piece_diameter, piece_diameter + 2] );
				}
				{
					translate( [(-1 * (piece_diameter/2)) - 1, (-1 * piece_diameter) - 1, (-1 * piece_diameter)] ) cube( [(piece_length + (piece_diameter)) + 2, piece_diameter + 2, piece_diameter + 1] );
				}
			}

		}
	}
}

module cutout_magsafe2() {

	cutout_base( blade_width = 20, blade_depth = 6, blade_offset = 0.6 );

}

module cutout_usbc() {
	cutout_base( blade_width = 13, blade_depth = 7, blade_offset = 1.1 );
}

module cutout_lighnting() {
	cutout_base( blade_width = 10, blade_depth = 7, blade_offset = 1.1 );
}

module cutout_base( blade_width, blade_depth, blade_offset ) {

	cable_height = 10;
	cable_osffset = cable_height - cable_shelf;
	corner_radius = 0.8;

	hull()
	{
		{
			translate( [0, 0, (-1 * cable_osffset)] ) cylinder( d = cable_diameter , h = cable_height + (piece_diameter/2) );
		}
		{
			translate( [0, cable_inset, (-1 * cable_osffset)] ) cylinder( d = cable_diameter , h = cable_height + (piece_diameter/2) );
		}
	}

	translate( [-1 * (blade_width/2), cable_inset - (blade_depth/2) - (blade_offset), cable_osffset] ) {
		linear_extrude( height = (piece_diameter/2) ) {
			offset( r = corner_radius) square( size = [blade_width, blade_depth] );
		}
	}




}