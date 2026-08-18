/**
 * Shared dimensions and geometry for the POWEROWL 1.5v AA charger case.
 *
 * Included by the base, the lid and the fit-test coupon, so the press fit can
 * never drift between the two pieces.
 *
 * costmo: 2026-08-17
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

/* --- USB cable notch, centred in the front long wall --- */
cutout_width = 15.0;
// How far above the build plate the notch starts
cutout_bottom = 4.5;

/* --- Lid --- */
// Headroom the lid adds above the base's top edge
lid_clearance_height = 2.5;
lid_top_thinckness = 1.2;
// Gap between the base's outer wall face and the collar's inner face
lid_clearance = 0.30;
// How far the collar drops down the outside of the base wall
collar_depth = 6.0;
collar_thinckness = 1.6;

/* --- Detents --- */
// How far the collar has to flex to pass a bead. This is the press fit itself;
// tune this one number, not the geometry around it.
detent_engage = 0.25;
detent_length = 20.0;
// Height of the bead's apex above the build plate
detent_z = 14.5;
// The lower face of the bead is a downward overhang when the base prints
// upright, so 45 deg is the shallowest angle that stays self-supporting. It is
// also the face that sets pull-off force. The upper face carries no printing
// constraint and is the insertion ramp, so it can be shallower.
detent_release_angle = 45.0;
detent_insert_angle = 30.0;
// Bead centres along X, kept clear of the USB notch
detent_positions_x = [30.0, 97.0];

/* --- Lateral locators on the short walls --- */
// The detent grooves are slots running along X, so they pin the lid in Y but
// do nothing in X — that is where the play shows up. These ribs take the X
// play out locally, instead of tightening 420 mm of perimeter to chase it.
// They live entirely on the lid, so the base is unaffected.
locator_engage = 0.10;
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

// Bead protrusion measured from the base's outer wall face. The collar's inner
// face already sits lid_clearance away, so only detent_engage is interference.
detent_proud = lid_clearance + detent_engage;
// The groove has to swallow the bead completely once seated, or the lid would
// stand proud of its shoulder.
detent_groove_depth = detent_engage + 0.10;
detent_lower_run = detent_proud / tan( detent_release_angle );
// Rib protrusion from the collar's inner face; only locator_engage of it is
// interference, exactly as with the detent beads
locator_proud = lid_clearance + locator_engage;
detent_upper_run = detent_proud / tan( detent_insert_angle );

// The seam: the top edge of the base wall, where the lid's shoulder lands
seam_z           = wall_height;
collar_bottom_z  = seam_z - collar_depth;
lid_ceiling_z    = seam_z + lid_clearance_height;
lid_height_total = lid_ceiling_z + lid_top_thinckness;

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

// One detent bead: laid along +X, protruding in +Y, apex at z = 0. The flat
// back is buried 0.5 mm inside the wall so the union has no seam.
module _detent_bead( length = detent_length ) {
	translate( [-length / 2, 0, 0] )
		rotate( [90, 0, 90] )
			linear_extrude( height = length )
				polygon( [
					[-0.5, -detent_lower_run],
					[detent_proud, 0],
					[-0.5, detent_upper_run]
				] );
}

// The beads on both long walls
module _detents() {
	for( x = detent_positions_x ) {
		translate( [x, -wall_thinckness, detent_z] ) rotate( [0, 0, 180] ) _detent_bead();
		translate( [x, base_depth + wall_thinckness, detent_z] ) _detent_bead();
	}
}

// Negative volume: the groove in the collar's inner face that swallows one
// bead. It is cut from the collar's inner face outward; the inboard end runs
// into the void the base wall occupies, so it removes nothing extra. Longer
// than the bead so X alignment is forgiving.
module _detent_groove_cut( length = detent_length + 2.0 ) {
	z0 = detent_z - detent_lower_run - 0.25;
	z1 = detent_z + detent_upper_run + 0.25;
	reach = wall_thinckness + lid_clearance + detent_groove_depth;

	translate( [-length / 2, -reach, z0] )
		cube( [length, reach, z1 - z0] );
}

module _detent_grooves() {
	for( x = detent_positions_x ) {
		translate( [x, 0, 0] ) _detent_groove_cut();
		translate( [x, base_depth, 0] ) mirror( [0, 1, 0] ) _detent_groove_cut();
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

// One lateral locator: a vertical ridge on the collar's inner face, protruding
// +X. Its lower end tapers back flush over locator_lead_in, so a lid coming
// down off centre is walked into place rather than jamming on the rib. Printed
// inverted, that taper faces up and the ridge itself is a vertical wall
// feature, so none of it needs support.
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

module _lift_tabs() {
	translate( [base_width + collar_offset, base_depth / 2, collar_bottom_z] )
		_lift_tab();
	translate( [-collar_offset, base_depth / 2, collar_bottom_z] )
		rotate( [0, 0, 180] ) _lift_tab();
}
