// Minimum render angle
$fa = 5;
// Minimum render size
$fs = 1;

body_width = 43.2;
body_length = 66;
body_height = 6;

inside_width = 33;
inside_length = body_length;
inside_height = 14;
inside_offset = (body_width - inside_width)/2;

color( "green" ) mainUnitShape();

module mainUnitShape()
{
	cube( [body_width, body_length, body_height] );
	translate( [inside_offset, 0, 0] ) cube( [inside_width, inside_length, inside_height + 1] );
}
