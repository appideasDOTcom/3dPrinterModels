// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;


base_width = 127.0;
base_depth = 83.0;
base_thinckness = 1.2;

wall_thinckness = 1.6;
// Total height of the piece from the build plate, floor included
wall_height = 18.2;

corner_radius = 3.5;

// A rounded rectangular slab sitting with its lower-left corner on the origin
module _rounded_slab( width, depth, height, radius ) {
	hull() {
		translate( [radius, radius, 0] ) cylinder( r = radius, h = height );
		translate( [width - radius, radius, 0] ) cylinder( r = radius, h = height );
		translate( [radius, depth - radius, 0] ) cylinder( r = radius, h = height );
		translate( [width - radius, depth - radius, 0] ) cylinder( r = radius, h = height );
	}
}

module _floor() {
	_rounded_slab( base_width, base_depth, base_thinckness, corner_radius );
}

// The wall wraps the outside of the floor, leaving the floor footprint untouched.
// The outer corner radius grows with the wall so its thickness stays constant
// through the corners instead of pinching.
module _wall() {
	difference() {
		translate( [-wall_thinckness, -wall_thinckness, 0] )
			_rounded_slab( base_width + (wall_thinckness * 2), base_depth + (wall_thinckness * 2), wall_height, corner_radius + wall_thinckness );

		// Negative volume: exactly the floor's footprint, overshot in Z so the
		// subtraction leaves no zero-thickness skin at either end
		translate( [0, 0, -1] )
			_rounded_slab( base_width, base_depth, wall_height + 2, corner_radius );
	}
}

_floor();
_wall();
