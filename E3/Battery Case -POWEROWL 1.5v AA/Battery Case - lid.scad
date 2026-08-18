/**
 * Battery Case for the POWEROWL 1.5v AA smart charger — lid.
 *
 * Top half of a two-piece case. The collar drops over the outside of the base
 * wall and its grooves capture the base's detent beads. The shoulder lands on
 * the base wall's top edge, so the added headroom is set by geometry rather
 * than by how hard the lid is pressed on.
 *
 * Print inverted: top plate on the bed, collar upward. No supports.
 *
 * costmo: 2026-08-17
 */

include <Battery Case - shared.scad>

// Negative volume: the gap in the collar that leaves the base's USB notch
// clear, so the cable stays connected with the case closed. Slightly wider
// than the notch so the collar never encroaches on the cable.
module _lid_usb_relief() {
	relief_width = cutout_width + (lid_clearance * 2);
	reach = collar_offset + 1;

	translate( [(base_width - relief_width) / 2, -reach, collar_bottom_z - 1] )
		cube( [relief_width, reach, (seam_z - collar_bottom_z) + 1] );
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

		_detent_grooves();
		_lid_usb_relief();
	}

	_lift_tabs();
}

_lid();
