/**
* Clarinet tuning spacers
*/

use <font/OpenSans-Bold.ttf>

// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

// These dimensions are correct, but sometimes require a little sanding
// outer_diameter = 23.4;
// inner_diameter = 14.9;

outer_diameter = 23.4;
inner_diameter = 15.0;
outer_diameter_outer_ring = 23.7; // The outer ring needs to clear the cork, ideally without scraping it

external_outer_diameter = 29.0;

unit_height = 3.2;
unit_text = "3.2";
text_inset = 0.6;

// xy_scale = 1.027; // 3.2
// xy_scale = 1.022; // 2.8
// xy_scale = 1.017; // 2.4
// xy_scale = 1.0123; // 2.0
xy_scale = 1.027;
z_scale = 1.0;

font = "OpenSans:style=Bold";

// innerRing();
outerRing();

module innerRing() {
    difference() {
        {
            translate( [0, 0, (-1 * (unit_height/2))] ) cylinder( d = outer_diameter, h = unit_height );
        }
        {
            union() {
                translate( [0, 0, (-1 * (unit_height/2))] ) {
                    translate( [0, 0, -1] ) cylinder( d = inner_diameter, h = unit_height + 2 );
                }
                scale( [xy_scale, xy_scale, z_scale] )sphere( d = (inner_diameter) );
                // translate( [3, 8, (unit_height/2) - text_inset] ) rotate( [0, 0, -38] ) makeText( text = unit_text, fontSize = 2.6 );
            }
        }
    }
}

module outerRing() {
        difference() {
        {
            translate( [0, 0, (-1 * (unit_height/2))] ) cylinder( d = external_outer_diameter, h = unit_height );
        }
        {
            union() {
                translate( [0, 0, (-1 * (unit_height/2))] ) {
                    translate( [0, 0, -1] ) cylinder( d = outer_diameter_outer_ring, h = unit_height + 2 );
                }
                // translate( [6, 10.5, (unit_height/2) - text_inset] ) rotate( [0, 0, -38] ) makeText( text = unit_text, fontSize = 2.0 );
            }
        }
    }
}



module makeText( text = "hello", fontSize = 12, fontHeight = 3 )
{
	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( text, font = font, size = (fontSize * 1) );
	}
}


