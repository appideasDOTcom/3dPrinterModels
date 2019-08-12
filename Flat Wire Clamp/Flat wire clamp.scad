/**
A clamp for a flat wire to be secured to something by being screwed into it ("something" like a wall or 2x4)

2018-01-07
costmo
http://appideas.com
**/

$fa = 4; // minimum angle -- use for final rendering
$fs = 0.5; // minumum size -- use for final rendering

wallThickness = 1.2; // how thick to make the walls
clampWidth = 10; // the width of the entire thing

extraDepth = 12; // how much of an extra "tip" to add for screwing this into something
wireDepth = 11.4; // width of the wire that passes through (called "depth" because that's the dimension it represents in the thing)
depth = wireDepth + extraDepth; // overall depth/length of the thing
wireHeight = 6.4; // height of the wire that passes through
height = wireHeight + (wallThickness * 2); // oevrall height of the thing

pinchGap = 3; // the height of the cutout (distance between landings in the clamp's pinch gap)
pinchOffsetZ = -0.6; // how far off-center to make the cutout. Negative values move it up, positive move it down

holeDiameter = 4; // screw hole diameter
holOffsetY = 2; // bring the hole closer to the wire so it clamps tighter

difference()
{
    {
        // Main body of the thing
        cube( [depth, clampWidth, height] );
    }
    {
        // Remove stuff
        cutouts();
    }
}

module cutouts()
{
    union()
    {
        // Wire pass-through
        translate( [wallThickness, -0.1, wallThickness] )
        {
            cube( [wireDepth, (clampWidth + 0.2), wireHeight] );
        }
    }
    {
        // The "pinch" cutout
        translate( [((wallThickness + wireDepth) - 0.1), -0.1, ((height / 2) - (pinchGap / 2) - pinchOffsetZ)] )
        {
            cube( [extraDepth, (clampWidth + 0.2), pinchGap] );
        }
    }
    {
        // A screw hole
        translate( [((wallThickness + wireDepth) + (extraDepth / 2) - holOffsetY), (clampWidth / 2), -0.1] )
        {
            cylinder( d = holeDiameter, h = (height + 0.2) );
        }

    }
}


