$fa = 1;
$fs = 0.1;

handle_thickness = 8.5;
// handle_thickness = 7.5;

m3_Diameter = 3.6;
m3_HeadDiameter = 5.8;
m3_HeadHeight = 4;
m3_NutDiameter = 6.7;
m3_NutHeight = 2.5;

m5_Diameter = 5.6;
m5_HeadDiameter = 8.8;
m5_HeadHeight = 6;
m5_NutDiameter = 9.7;
m5_NutHeight = 4.1;

hole_1_x = 18.35;
hole_1_y = 14.66;

hole_2_x = 15.51;
hole_2_y = 84.14;

hole_3_x = 19.32;
hole_3_y = 151.94;

scale_factor = 0.74805;


// %handle_shape();
// #top_cutouts();
// #bottom_cutouts();

// top_side();
bottom_side();
// translate( [0, 0, -1 * handle_thickness - 1] ) bottom_side();

module bottom_side() {
	difference()
	{
		handle_shape();
		bottom_cutouts();
	}
}

module top_side() {
	difference()
	{
		handle_shape();
		top_cutouts();
	}
}

module handle_shape() {

	linear_extrude( height = handle_thickness ) scale( [scale_factor, scale_factor, scale_factor] ) import( "Knife_Handle-02.svg" );
	translate( [hole_1_x, hole_1_y, 0] ) cylinder( d = 4.7, h = handle_thickness );
	translate( [hole_2_x, hole_2_y, 0] ) cylinder( d = 5.5, h = handle_thickness );
	translate( [hole_3_x, hole_3_y, 0] ) cylinder( d = 4.7, h = handle_thickness );

	// scale( [0.74805, 0.74805, 0.74805] ) -- 171.0mm
	// scale( [0.7441, 0.7441, 0.7441] ) -- 170.10mm length
	// scale( [0.7437, 0.7437, 0.7437] ) -- 170.0mm length
}

module bottom_cutouts() {

	translate( [hole_1_x, hole_1_y, -1] ) cylinder( d = m3_Diameter, h = 20 );
	translate( [hole_1_x, hole_1_y, -0.1] ) cylinder( d = m3_HeadDiameter, h = m3_HeadHeight + 1.6 );

	translate( [hole_2_x, hole_2_y, -1] ) cylinder( d = m5_Diameter, h = 20 );
	translate( [hole_2_x, hole_2_y, -0.1] ) cylinder( d = m5_HeadDiameter, h = m5_HeadHeight + 0.8 );

	translate( [hole_3_x, hole_3_y, -1] ) cylinder( d = m3_Diameter, h = 20 );
	translate( [hole_3_x, hole_3_y, -0.1] ) cylinder( d = m3_HeadDiameter, h = m3_HeadHeight + 1.6 );

}

module top_cutouts() {

	translate( [hole_1_x, hole_1_y, -1] ) cylinder( d = m3_Diameter, h = handle_thickness );
	translate( [hole_1_x, hole_1_y, 1.6] ) cylinder( d = m3_NutDiameter, h = m3_NutHeight, $fn = 6 );

	translate( [hole_2_x, hole_2_y, -1] ) cylinder( d = m5_Diameter, h = handle_thickness );
	translate( [hole_2_x, hole_2_y, 1.6] ) cylinder( d = m5_NutDiameter, h = m5_NutHeight, $fn = 6 );

	translate( [hole_3_x, hole_3_y, -1] ) cylinder( d = m3_Diameter, h = handle_thickness );
	translate( [hole_3_x, hole_3_y, 1.6] ) cylinder( d = m3_NutDiameter, h = m3_NutHeight, $fn = 6 );

}