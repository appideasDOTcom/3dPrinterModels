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
// The charger fills this footprint with NO clearance at the inner wall. That
// rules out anything that intrudes on the interior: no fillet at the
// floor-to-wall junction, no inner shoulder relief, and it is why the lid's
// retention had to be built on the OUTSIDE of the wall.
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
// so the detents this replaces were decoration. One free cantilever finger per
// short wall replaced them, sitting directly under the lift wing so the release
// force lands on the latch itself.
//
// The first cut of that finger still would not hold, and the reason is worth
// keeping: its hook reached EXACTLY to the base wall's outer face, so its
// resting deflection was zero and every error subtracted straight out of
// engagement. The locator ribs spread the collar outward, and both ramp tips
// were knife edges that print rounded. 0.39 mm of designed overlap minus those
// is nothing, and the lid fell off under its own weight -- while pressing the
// finger in by hand made the catch work perfectly. Two changes follow from that:
//
// 1. PRELOAD. The hook now reaches snap_preload PAST the wall face, so it is
//    always sprung against it. The standoff is designed out instead of
//    toleranced out, and the contact force it takes to do that is free friction.
// 2. ROOM TO FLEX. Travel is preload + engagement, and root strain is
//    3*t*d/(2*L^2). Hanging 10 mm below the collar, 1.0 mm of travel meant
//    42 MPa at 1.2 mm thick and 61 MPa at 1.6 -- across layer lines, in PLA,
//    where interlayer strength is around 40 MPa. The finger is now a slotted
//    section of the collar itself, rooted at the seam and running the full
//    height of the wall: 17.7 mm long, which puts 1.0 mm of travel at 27 MPa
//    and makes full wall thickness affordable. The slots also cut the finger
//    loose from the locator ribs, which removes the standoff at its source.
//
// At 1.6 x 36 x 17.7:
//   I = 36 x 1.6^3/12 = 12.29 mm^4,  k = 3 x 3500 x 12.29 / 17.7^3 = 23 N/mm.
// Travel 1.0 mm -> 23 N per finger, which the ramps turn into ~27 N for the
// pair to press closed and ~67 N to pull straight off. Release is by dishing
// the lid, which splays the skirt and swings both fingers out at once, so
// pull-off force and release effort are set by different things.
//
// snap_engage and snap_preload are the adjustment. Engagement is the overlap
// that holds the lid down; preload is the margin that guarantees the hook is in
// contact at all. Both add to travel, so force scales with their sum.
snap_engage  = 0.50;
snap_preload = 0.50;
// Width is the one lever that buys holding force for free: k scales with it,
// but bending stress (3*t*d/(2*L^2)) has no width term at all. 48 mm is +33% of
// grip at exactly the same 39 MPa root stress. It costs proportionally more
// effort at the wings, which is the only reason not to go wider still.
snap_finger_width = 48.0;
// Full wall thickness: the finger is a rectangular continuation of the collar,
// flush on both faces. That removes the seam on the outside AND the step on the
// inside, so the root fillet the old thin finger needed is gone with them.
snap_finger_thickness = collar_thinckness;
// How far the finger tip stops short of the build plate, so the case still
// stands on its floor
snap_finger_gap = 0.5;
// The hook's tip is a vertical land, not a point. The land is what rides the
// wall and sets engagement, and a vertical face prints to size where a knife
// edge rounds off -- which is half of why the old hook lost its overlap.
snap_land = 0.8;
// The same treatment on the base's ledge tip
snap_ledge_flat = 0.35;
// Relief slots that cut the finger free of the collar. Rounded at the top,
// because that end is the finger's root and the most stressed point on the lid.
snap_slot_width = 1.0;
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
// Moved outboard to clear the wider finger's slots (which land at 16.5 and
// 66.5). A wider stance locates the lid better anyway.
locator_positions_y = [10.0, 73.0];

/* --- Lift tabs on the short ends --- */
// The wings sit ON the snap fingers, so where they sit along the finger decides
// whether they are a release lever or just a handle. Prying at height z acts on
// an arm of (seam_z - z), and the hook needs 1.0 mm of travel at 14.65 mm:
//
//   z = 12.2, at the collar's bottom edge  ->  189 N     (the old position)
//   z =  8.0                               ->   73 N
//   z =  5.0                               ->   48 N
//   z =  3.55, level with the hook         ->   41 N
//   z =  0.5, the finger's tip             ->   31 N
//
// Pulling the lid straight off takes 59 N per finger, so at the old position
// prying was three times HARDER than brute force -- the wing was never a
// release lever, and every successful release was really the lid dishing. At
// 5.0 it clears the hook's back edge (4.46) and beats brute force by 20%.
// Below that the curve flattens and the grab just gets closer to the table.
lift_tab_z = 5.0;
// Width buys nothing in leverage -- that is purely the arm above. It buys
// evenness: a narrow wing on a wide finger pulls the middle and lets the outer
// thirds lag, so the hook peels off instead of releasing across its full width.
lift_tab_width = 20.0;
lift_tab_proud = 2.0;
// Pulling up on a wing puts its underside root in tension, across a layer
// boundary, at a right angle. Same failure mode as the finger root. Kept small
// so most of the wing's underside stays a flat ledge to hook a finger under.
lift_tab_fillet = 1.0;

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

// Everything below is measured outward from the base wall's OUTER face, which
// is the surface the hook rides on and the surface the ledge grows from.
//
// The finger is flush with the collar, so its shank sits at exactly the collar's
// own clearance. The hook then reaches snap_preload further, which puts its
// resting tip INSIDE the wall -- the interference that becomes the preload once
// the part is real and the finger has to bend to get there.
snap_shank_clearance = lid_clearance;
snap_hook_proud      = snap_shank_clearance + snap_preload;
snap_ledge_proud     = snap_engage;

// Rooted at the seam, cut free of the collar by the slots, and stopping just
// short of the build plate
snap_root_z          = seam_z;
snap_finger_bottom_z = snap_finger_gap;
snap_finger_length   = snap_root_z - snap_finger_bottom_z;

snap_profile_reach = snap_hook_proud + snap_embed;
// The lead-in ramp starts at the finger's own bottom edge and climbs to the
// land; the land rides the wall; the retention face cuts back above it.
snap_hook_land_bottom_z = snap_finger_bottom_z + (snap_profile_reach * tan( snap_insert_angle ));
snap_hook_land_top_z    = snap_hook_land_bottom_z + snap_land;
snap_hook_back_top_z    = snap_hook_land_top_z + (snap_profile_reach * tan( snap_retain_angle ));

// Seated, the finger is deflected by snap_preload, so the land lies flat on the
// wall and the hook's retention face starts at the wall face. The ledge's
// underside is cut at the same angle from snap_seat_gap above that point, so the
// two faces are parallel with a known gap along their whole length. Lifting the
// lid past that gap is what loads the hook.
snap_ledge_bottom_z      = snap_hook_land_top_z + snap_seat_gap;
snap_ledge_tip_bottom_z  = snap_ledge_bottom_z + (snap_ledge_proud * tan( snap_retain_angle ));
snap_ledge_tip_top_z     = snap_ledge_tip_bottom_z + snap_ledge_flat;
snap_ledge_reach         = snap_ledge_proud + snap_embed;
snap_ledge_back_bottom_z = snap_ledge_bottom_z - (snap_embed * tan( snap_retain_angle ));
snap_ledge_back_top_z    = snap_ledge_tip_top_z + (snap_ledge_reach * tan( snap_insert_angle ));

/* --- Shared geometry --- */

// Concave quarter-cylinder fillet for rounding right angle junctions.
// Improves structural integrity and high speed print quality. Looks nicer, too.
// Place the origin at the corner, rotate to the target face, then union into the parent.
// d: fillet diameter (concave curve radius is d/2); l: length of the produced output.
// From costmo's printery/models/common/shapes.scad.
module inner_fillet( d, l )
{
	xDimension = d;
	yDimension = d;
	zDimension = l;

	difference()
	{
		{
			translate( [(-1 * (xDimension / 2)), (-1 * (yDimension / 2)), 0] )
			{
				cube( [xDimension, yDimension, zDimension] );
			}
		}
		{
			translate( [ 0, 0, -1 ] )
			{
				translate( [0, (-1 * yDimension), 0] )
				{
					cube( [xDimension, yDimension * 2, (zDimension + 2)] );
				}
				translate( [(-1 * xDimension), 0, 0] )
				{
					cube( [xDimension, yDimension, (zDimension + 2)] );
				}

				linear_extrude( height=(zDimension + 2), twist=0, scale=[1, 1], center=false)
				{
					circle(r=(xDimension / 2));
				}

			}

		}

	}
}

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
// the retention face and its top is the ramp the hook rides down. The tip is a
// vertical flat rather than a point, so the protrusion that sets engagement is
// held by a face the printer can actually hit. Printed upright, the only
// overhang is the underside, at snap_retain_angle over snap_ledge_reach.
module _snap_ledge( length = snap_finger_width + 1.0 ) {
	translate( [-length / 2, 0, 0] )
		rotate( [90, 0, 90] )
			linear_extrude( height = length )
				polygon( [
					[-snap_embed, snap_ledge_back_bottom_z],
					[snap_ledge_proud, snap_ledge_tip_bottom_z],
					[snap_ledge_proud, snap_ledge_tip_top_z],
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

// One snap finger. Laid along +X with its inner face on y = 0, shank material
// running out to -Y and the hook protruding +Y toward the base wall.
//
// Only the part BELOW the collar is built here: from collar_bottom_z up to the
// seam the finger is the collar wall itself, already flush on both faces. The
// slots are what turn that strip into a cantilever, so this is deliberately cut
// wider than snap_finger_width and trimmed to size by _snap_slots().
module _snap_finger() {
	blank_width = snap_finger_width + (snap_slot_width * 2);

	translate( [-blank_width / 2, -snap_finger_thickness, snap_finger_bottom_z] )
		cube( [blank_width, snap_finger_thickness,
		       (collar_bottom_z - snap_finger_bottom_z) + 0.01] );

	// Lead-in ramp, land, retention face
	translate( [-blank_width / 2, 0, 0] )
		rotate( [90, 0, 90] )
			linear_extrude( height = blank_width )
				polygon( [
					[-snap_embed, snap_finger_bottom_z],
					[snap_hook_proud, snap_hook_land_bottom_z],
					[snap_hook_proud, snap_hook_land_top_z],
					[-snap_embed, snap_hook_back_top_z]
				] );
}

module _snap_fingers() {
	translate( [-(wall_thinckness + snap_shank_clearance), base_depth / 2, 0] )
		rotate( [0, 0, -90] ) _snap_finger();
	translate( [base_width + wall_thinckness + snap_shank_clearance, base_depth / 2, 0] )
		rotate( [0, 0, 90] ) _snap_finger();
}

// Negative volume: one relief slot, cut radially through the lid wall. It stops
// at the seam, so the finger hangs from the shoulder ring -- the stiffest line
// on the lid. That top end is the finger's root and therefore the highest
// stressed point on the part, so it gets a radius rather than a square corner.
module _snap_slot( reach ) {
	top_z = seam_z - (snap_slot_width / 2);

	hull() {
		translate( [0, 0, top_z] )
			rotate( [0, 90, 0] ) cylinder( d = snap_slot_width, h = reach, $fn = 32 );
		translate( [0, 0, snap_finger_bottom_z - 1] )
			rotate( [0, 90, 0] ) cylinder( d = snap_slot_width, h = reach, $fn = 32 );
	}
}

// A pair per short wall, straddling the finger so the gap between them is
// exactly snap_finger_width
module _snap_slots() {
	reach  = collar_offset + 1;
	spread = (snap_finger_width + snap_slot_width) / 2;

	for( dy = [-spread, spread] ) {
		translate( [-reach, (base_depth / 2) + dy, 0] ) _snap_slot( reach );
		translate( [base_width, (base_depth / 2) + dy, 0] ) _snap_slot( reach );
	}
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

	// The tension corner, where the wing's underside meets the wall below it.
	// Origin sits one radius into the void, as with the finger root.
	translate( [lift_tab_fillet / 2, -width / 2, -lift_tab_fillet / 2] )
		rotate( [-90, 0, 0] )
			inner_fillet( d = lift_tab_fillet, l = width );
}

module _lift_tabs() {
	translate( [base_width + collar_offset, base_depth / 2, lift_tab_z] )
		_lift_tab();
	translate( [-collar_offset, base_depth / 2, lift_tab_z] )
		rotate( [0, 0, 180] ) _lift_tab();
}
