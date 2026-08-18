/**
 * Battery Case for the POWEROWL 1.5v AA smart charger — base.
 *
 * Bottom half of a two-piece case. The lid's collar wraps the outside of this
 * wall and snaps over the detent beads on it. All dimensions live in
 * "Battery Case - shared.scad".
 *
 * costmo: 2026-08-17
 */

include <Battery Case - shared.scad>

module _floor() {
	_plan_slab( base_width, base_depth, base_thinckness, corner_radius );
}

// The notch in the front long wall, centred on the wall's length. Overshoots
// the wall in Y and runs past the top in Z, so the cut leaves no zero-thickness
// skin and exits open at maximum Z.
// Move it to the back wall by using base_depth - 1 for the Y translate.
module _wall_cutout() {
	translate( [(base_width - cutout_width) / 2, -(wall_thinckness + 1), cutout_bottom] )
		cube( [cutout_width, wall_thinckness + 2, (wall_height - cutout_bottom) + 1] );
}

// The wall wraps the outside of the floor, leaving the floor footprint untouched.
// The outer corner radius grows with the wall so its thickness stays constant
// through the corners instead of pinching.
module _wall() {
	difference() {
		_plan_slab( outer_width, outer_depth, wall_height, outer_radius );

		// Negative volume: exactly the floor's footprint, overshot in Z so the
		// subtraction leaves no zero-thickness skin at either end
		translate( [0, 0, -1] )
			_plan_slab( base_width, base_depth, wall_height + 2, corner_radius );

		_wall_cutout();
	}
}

module _base() {
	_floor();
	_wall();
	// Added last, so nothing can cut into the mating features
	_detents();
}

_base();
