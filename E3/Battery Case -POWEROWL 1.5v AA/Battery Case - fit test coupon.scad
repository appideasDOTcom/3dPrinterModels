/**
 * Battery Case for the POWEROWL 1.5v AA smart charger — fit test coupon.
 *
 * A 40 mm section of the real joint, cut straight out of the production
 * geometry rather than redrawn, so what it teaches transfers exactly. Prints
 * in about ten minutes instead of the hours a full lid costs.
 *
 * Both halves are laid out in their production orientation: base upright,
 * lid inverted. Print, press together, and adjust detent_engage in
 * "Battery Case - shared.scad" until the snap feels right — nothing else
 * needs to move.
 *
 * costmo: 2026-08-17
 */

include <Battery Case - shared.scad>
use <Battery Case - POWEROWL 1.5v.scad>
use <Battery Case - lid.scad>

// Centred on the detent bead at detent_positions_x[0]
coupon_length = 40.0;
coupon_x0     = detent_positions_x[0] - (coupon_length / 2);
// Enough of the front wall to hold the joint, plus a strip of floor to stand on
coupon_y0     = -(collar_offset + 2);
coupon_depth  = 14.0;
// Gap between the two halves on the bed
coupon_gap    = 12.0;

module _coupon_base() {
	intersection() {
		_base();
		translate( [coupon_x0, coupon_y0, -1] )
			cube( [coupon_length, coupon_depth, wall_height + 2] );
	}
}

module _coupon_lid() {
	intersection() {
		_lid();
		translate( [coupon_x0, coupon_y0, collar_bottom_z - 1] )
			cube( [coupon_length, coupon_depth, (lid_height_total - collar_bottom_z) + 2] );
	}
}

/* --- Output --- */
_coupon_base();

translate( [0, coupon_y0 + coupon_depth + coupon_gap, lid_height_total] )
	rotate( [180, 0, 0] )
		_coupon_lid();
