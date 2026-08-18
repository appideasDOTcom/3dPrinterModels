/**
 * Battery Case for the POWEROWL 1.5v AA smart charger — lid.
 *
 * Top half of a two-piece case. The collar drops over the outside of the base
 * wall and the fingers below it hook under the base's ledges. The shoulder lands on
 * the base wall's top edge, so the added headroom is set by geometry rather
 * than by how hard the lid is pressed on.
 *
 * Print inverted: top plate on the bed, collar upward. No supports.
 *
 * costmo: 2026-08-17
 */

include <Battery Case - shared.scad>

/* --- Logo cutout --- */
// Width of the mark across the lid; its height follows the artwork's aspect.
logo_width = 60.0/ 2;
// true cuts an opening clean through the top plate. false engraves a recess
// logo_recess deep instead, leaving the lid closed.
logo_through = true;
logo_recess = 0.8;
// The SVG's viewBox starts at (0.4, 1.7), so import( center = true ) centres
// the document box rather than the artwork inside it. Shifting by that origin,
// scaled, puts the mark itself on the lid's centre.
logo_source_origin = [0.4, 1.7];
logo_source_width = 144.3;
logo_scale = logo_width / logo_source_width;
// The SVG's filled polygons are the octagonal FIELD of the mark; the strokes
// are negative space inside them. false cuts the field, leaving the strokes as
// bridges across an octagonal opening. true cuts only the strokes, leaving the
// lid solid apart from them.
logo_invert = false;

// Negative volume: the gap in the collar that leaves the base's USB notch
// clear, so the cable stays connected with the case closed. Slightly wider
// than the notch so the collar never encroaches on the cable.
module _lid_usb_relief() {
	relief_width = cutout_width + (lid_clearance * 2);
	reach = collar_offset + 1;

	translate( [(base_width - relief_width) / 2, -reach, collar_bottom_z - 1] )
		cube( [relief_width, reach, cutout_top - collar_bottom_z + 1] );
}

// Negative volume: the logo, centred on the lid. Overshoots the top face so the
// cut leaves no zero-thickness skin; when cutting through it overshoots the
// underside as well.
module _logo_2d() {
	translate( logo_source_origin * logo_scale )
		resize( [logo_width, 0], auto = [false, true] )
			import( "logo.svg", center = true );
}

// The strokes are what is left when the mark is taken out of its own outline,
// so the convex hull of the artwork gives the field to subtract from.
module _logo_shape() {
	if( logo_invert ) {
		difference() {
			hull() _logo_2d();
			_logo_2d();
		}
	} else {
		_logo_2d();
	}
}

module _logo_cut() {
	z_start = logo_through ? lid_ceiling_z - 1 : lid_height_total - logo_recess;
	cut_height = lid_height_total - z_start + 1;

	translate( [base_width / 2, base_depth / 2, z_start] )
		linear_extrude( height = cut_height ) _logo_shape();
}

module _lid() {
	difference() {
		// One flush outer surface from the bottom of the collar to the top
		translate( [0, 0, collar_bottom_z] )
			_plan_slab( collar_outer_width, collar_outer_depth,
			            lid_height_total - collar_bottom_z, collar_outer_radius );

		// The pocket the base wall drops into, ending exactly at the seam so
		// the remaining ring becomes the shoulder that carries the lid
		translate( [0, 0, collar_bottom_z - 1] )
			_plan_slab( collar_inner_width, collar_inner_depth,
			            (seam_z - collar_bottom_z) + 1, collar_inner_radius );

		// The added headroom, flush with the base's interior wall
		translate( [0, 0, seam_z] )
			_plan_slab( base_width, base_depth, lid_clearance_height, corner_radius );

		_lid_usb_relief();
		_logo_cut();
	}

	_lift_tabs();
	_locators();
	_snap_fingers();
}

_lid();
