/**
 * Battery Case for the POWEROWL 1.5v AA smart charger — base.
 *
 * Bottom half of a two-piece case. The lid's collar wraps the outside of this
 * wall and its fingers hook under the snap ledges low on it. All dimensions
 * live in "Battery Case - shared.scad".
 *
 * costmo: 2026-08-17
 */

include <Battery Case - shared.scad>

/* --- Logo cutout --- */
// The mark lives in the floor rather than the lid. The lid gets deliberately
// flexed to open the case, and thin webs across a flexing panel are the one
// place they will not survive; the floor is never loaded that way.
// Width of the mark; its height follows the artwork's aspect.
logo_width = 60.0 / 2;
// true cuts an opening clean through the floor. false engraves a recess
// logo_recess deep into the underside instead, leaving the case closed.
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
// Where the mark sits on the floor
logo_position = [base_width / 2, base_depth / 2];

// Negative volume: the logo in the floor. Overshoots both faces so the cut
// leaves no zero-thickness skin. Mirrored, so the mark reads the right way
// round when the case is turned over and looked at from below.
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
	z_start = logo_through ? -1 : -0.01;
	z_end   = logo_through ? base_thinckness + 1 : logo_recess;

	translate( [logo_position[0], logo_position[1], z_start] )
		mirror( [1, 0, 0] )
			linear_extrude( height = z_end - z_start ) _logo_shape();
}

module _floor() {
	_plan_slab( base_width, base_depth, base_thinckness, corner_radius );
}

// The cable opening in the front long wall, centred on the wall's length.
// Overshoots the wall in Y so the cut leaves no zero-thickness skin. When
// cutout_bridged is set it closes at cutout_top, which the wall bridges over;
// otherwise it runs out through the top of the wall as before.
// Move it to the back wall by using base_depth - 1 for the Y translate.
module _wall_cutout() {
	top = cutout_bridged ? cutout_top : wall_height + 1;

	translate( [(base_width - cutout_width) / 2, -(wall_thinckness + 1), cutout_bottom] )
		cube( [cutout_width, wall_thinckness + 2, top - cutout_bottom] );
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
	difference() {
		_floor();
		_logo_cut();
	}
	_wall();
	// Added last, so nothing can cut into the mating features
	_snap_ledges();
}

_base();
