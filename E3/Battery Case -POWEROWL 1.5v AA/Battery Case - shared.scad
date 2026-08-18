/**
 * Shared dimensions and geometry for the POWEROWL 1.5v AA charger case.
 *
 * Included by the base, the lid and the fit-test coupon, so the press fit can
 * never drift between the two pieces.
 *
 * costmo: 2026-08-18
 */

// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

/* --- Base --- */
base_width = 127.0;
base_depth = 83.0;
base_thinckness = 1.2;

wall_thinckness = 1.6;
// Total height of the base from the build plate, floor included
wall_height = 18.2;

corner_radius = 3.5;

/* --- USB cable opening, centred in the front long wall --- */
cutout_width = 12.5;
// How far above the build plate the opening starts
cutout_bottom = 6.5;
// How far the lid reaches down over the top of the opening
cutout_lid_overlap = 3.0;
// Close the top of the base's slot, turning it into a window. Costs nothing in
// print time, makes the front wall continuous instead of two halves joined at
// a sill, and gives the lid's shoulder a full ring to sit on. The trade is
// that the cable has to be threaded through rather than dropped in from above.
cutout_bridged = true;

/* --- Lid --- */
// Headroom the lid adds above the base's top edge
lid_clearance_height = 2.5;
lid_top_thinckness = 1.2;
// Gap between the base's outer wall face and the collar's inner face
lid_clearance = 0.30;
// How far the collar drops down the outside of the base wall
collar_depth = 6.0;
collar_thinckness = 1.6;

/* --- Retention: snap fingers --- */
// A closed collar cannot flex. Passing a bead through one needs roughly
//   k = 3EI/L^3 = 3 x 3500 x 6.83 / 6^3 = 332 N/mm  ->  83 N per bead,
// so the detents this replaces were decoration. A finger hanging free below
// the collar is a real cantilever:
//   k = 3 x 3500 x 2.88 / 10^3 = 30 N/mm  ->  ~10 N to seat.
// One finger per short wall, sitting directly under the lift wing. That puts
// the release force on the latch itself rather than sending it through the lid
// to catches further in. Stiffness comes from the finger's own dimensions, not
// from where it sits on the collar, so a wide finger on the stiff short wall
// behaves exactly as the arithmetic says:
//   I = 36 x 1.2^3/12 = 5.18 mm^4,  k = 3 x 3500 x 5.18 / 10^3 = 54 N/mm.
// snap_engage is the whole adjustment: it is both the overlap that holds the
// lid down and the deflection needed to seat it. At 0.39 the pair pushes back
// with ~42 N, which the ramps turn into ~25 N to press closed and ~61 N to pull
// straight off. Force scales with it directly.
snap_engage = 0.39;
snap_finger_width = 36.0;
snap_finger_length = 10.0;
snap_finger_thickness = 1.2;
// Ramp angles from horizontal. Insertion ramps are gentle, so the lid presses
// on smoothly. Retention faces are as abrupt as printing without support
// allows, because release is by prying a wing, not by pulling straight up.
snap_insert_angle = 60.0;
snap_retain_angle = 35.0;
// Clearance between a seated hook and the ledge above it
snap_seat_gap = 0.10;
// How far the hook and ledge profiles reach back into their parent wall. The
// profiles are built from this point so both faces carry their stated angle;
// anchoring them at the far side of the wall would flatten the angles instead.
snap_embed = 0.5;

/* --- Lateral locators on the short walls --- */
// The fingers hold the lid down and, because their hooks ride against the base
// wall, locate it along the long axis. These ribs sit on the same short walls,
// above the fingers, and do the same across it. Location and retention stay
// separate adjustments.
locator_engage = 0.20;
locator_width  = 3.0;
// A small flat at the tip rather than a knife edge, so it wears in and stops
locator_flat   = 0.8;
locator_lead_in = 2.0;
locator_positions_y = [20.0, 63.0];

/* --- Lift tabs on the short ends --- */
lift_tab_width = 10.0;
lift_tab_proud = 2.0;

/* --- Derived --- */
outer_width  = base_width + (wall_thinckness * 2);
outer_depth  = base_depth + (wall_thinckness * 2);
outer_radius = corner_radius + wall_thinckness;

collar_offset       = wall_thinckness + lid_clearance + collar_thinckness;
collar_inner_width  = outer_width + (lid_clearance * 2);
collar_inner_depth  = outer_depth + (lid_clearance * 2);
collar_inner_radius = outer_radius + lid_clearance;
collar_outer_width  = collar_inner_width + (collar_thinckness * 2);
collar_outer_depth  = collar_inner_depth + (collar_thinckness * 2);
collar_outer_radius = collar_inner_radius + collar_thinckness;

// The seam: the top edge of the base wall, where the lid's shoulder lands
seam_z           = wall_height;
collar_bottom_z  = seam_z - collar_depth;
lid_ceiling_z    = seam_z + lid_clearance_height;
lid_height_total = lid_ceiling_z + lid_top_thinckness;

// Top of the cable aperture, set by how far the lid reaches down
cutout_top = seam_z - cutout_lid_overlap;

locator_proud = lid_clearance + locator_engage;

// All measured outward from the base wall's outer face:
//   shank clears the ledge, hook tip rides on the wall, ledge tip overlaps the
//   hook tip by exactly snap_engage.
snap_shank_clearance = snap_engage + 0.15;
snap_hook_proud      = snap_shank_clearance;
snap_ledge_proud     = snap_engage;

snap_finger_bottom_z = collar_bottom_z - snap_finger_length;
snap_profile_reach   = snap_hook_proud + snap_embed;
// The hook's lowest point is the finger's own bottom edge
snap_hook_tip_z      = snap_finger_bottom_z + (snap_profile_reach * tan( snap_insert_angle ));
snap_hook_back_top_z = snap_hook_tip_z + (snap_profile_reach * tan( snap_retain_angle ));

// Both retention faces are cut at snap_retain_angle, so they stay parallel and
// the seated gap is snap_seat_gap everywhere along them. Lifting the lid past
// that gap is what loads the hook.
snap_ledge_bottom_z      = snap_hook_tip_z + snap_seat_gap;
snap_ledge_tip_z         = snap_ledge_bottom_z + (snap_ledge_proud * tan( snap_retain_angle ));
snap_ledge_top_z         = snap_ledge_tip_z + (snap_ledge_proud * tan( snap_insert_angle ));
snap_ledge_back_bottom_z = snap_ledge_bottom_z - (snap_embed * tan( snap_retain_angle ));
snap_ledge_back_top_z    = snap_ledge_top_z + (snap_embed * tan( snap_insert_angle ));

/* --- Shared geometry --- */

// A rounded rectangular slab sitting with its lower-left corner on the origin
module _rounded_slab( width, depth, height, radius ) {
	hull() {
		translate( [radius, radius, 0] ) cylinder( r = radius, h = height );
		translate( [width - radius, radius, 0] ) cylinder( r = radius, h = height );
		translate( [radius, depth - radius, 0] ) cylinder( r = radius, h = height );
		translate( [width - radius, depth - radius, 0] ) cylinder( r = radius, h = height );
	}
}

// The same slab, held concentric with the base's footprint, so every ring of
// the case is built from one call and cannot drift off centre
module _plan_slab( width, depth, height, radius ) {
	translate( [(base_width - width) / 2, (base_depth - depth) / 2, 0] )
		_rounded_slab( width, depth, height, radius );
}

// The catch on the base: a ledge laid along +X, protruding +Y. Its underside is
// the retention face and its top is the ramp the hook rides down. Printed
// upright that puts the only overhang on the underside, at snap_retain_angle
// over snap_ledge_proud of reach.
module _snap_ledge( length = snap_finger_width + 1.0 ) {
	translate( [-length / 2, 0, 0] )
		rotate( [90, 0, 90] )
			linear_extrude( height = length )
				polygon( [
					[-snap_embed, snap_ledge_back_bottom_z],
					[snap_ledge_proud, snap_ledge_tip_z],
					[-snap_embed, snap_ledge_back_top_z]
				] );
}

// One per short wall, centred on the wall's length so it lands under the wing
module _snap_ledges() {
	translate( [-wall_thinckness, base_depth / 2, 0] )
		rotate( [0, 0, 90] ) _snap_ledge();
	translate( [base_width + wall_thinckness, base_depth / 2, 0] )
		rotate( [0, 0, -90] ) _snap_ledge();
}

// One snap finger, hanging below the collar. Laid along +X with its inner face
// on y = 0, shank material running out to -Y and the hook protruding +Y toward
// the base wall.
module _snap_finger() {
	translate( [-snap_finger_width / 2, -snap_finger_thickness, snap_finger_bottom_z] )
		cube( [snap_finger_width, snap_finger_thickness,
		       snap_finger_length + 0.01] );

	translate( [-snap_finger_width / 2, 0, 0] )
		rotate( [90, 0, 90] )
			linear_extrude( height = snap_finger_width )
				polygon( [
					[-snap_embed, snap_finger_bottom_z],
					[snap_hook_proud, snap_hook_tip_z],
					[-snap_embed, snap_hook_back_top_z]
				] );
}

module _snap_fingers() {
	translate( [-(wall_thinckness + snap_shank_clearance), base_depth / 2, 0] )
		rotate( [0, 0, -90] ) _snap_finger();
	translate( [base_width + wall_thinckness + snap_shank_clearance, base_depth / 2, 0] )
		rotate( [0, 0, 90] ) _snap_finger();
}

// One lateral locator: a vertical ridge on the collar's inner face, protruding
// +X. Its lower end tapers back flush over locator_lead_in, so a lid coming
// down off centre is walked into place rather than jamming on the rib. Printed
// inverted, that taper faces up and the ridge is a vertical wall feature, so
// none of it needs support.
module _locator_rib() {
	profile = [
		[-0.5, -locator_width / 2],
		[locator_proud, -locator_flat / 2],
		[locator_proud, locator_flat / 2],
		[-0.5, locator_width / 2]
	];

	hull() {
		translate( [0, 0, collar_bottom_z] )
			linear_extrude( height = 0.01 ) scale( [0.01, 1] ) polygon( profile );
		translate( [0, 0, collar_bottom_z + locator_lead_in] )
			linear_extrude( height = (seam_z - collar_bottom_z) - locator_lead_in )
				polygon( profile );
	}
}

module _locators() {
	for( y = locator_positions_y ) {
		translate( [-(wall_thinckness + lid_clearance), y, 0] )
			_locator_rib();
		translate( [base_width + wall_thinckness + lid_clearance, y, 0] )
			rotate( [0, 0, 180] ) _locator_rib();
	}
}

// One lift tab: laid along +Y, protruding +X, flat thumb face at z = 0. The
// sloped face is 45 deg, which is the overhang when the lid prints inverted.
module _lift_tab( width = lift_tab_width ) {
	run = lift_tab_proud + 0.5;

	translate( [0, width / 2, 0] )
		rotate( [90, 0, 0] )
			linear_extrude( height = width )
				polygon( [
					[-0.5, 0],
					[lift_tab_proud, 0],
					[-0.5, run]
				] );
}

module _lift_tabs() {
	translate( [base_width + collar_offset, base_depth / 2, collar_bottom_z] )
		_lift_tab();
	translate( [-collar_offset, base_depth / 2, collar_bottom_z] )
		rotate( [0, 0, 180] ) _lift_tab();
}
