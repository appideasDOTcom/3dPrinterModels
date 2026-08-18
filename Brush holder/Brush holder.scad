/**
 * A simple cup for holding a kitchen/dish brush and sponge
 *
 */

// Render quality options
$fa = 1;
$fs = 0.1;

extrusionWidth = 0.45;
perimeters = 4; // This will be half of the perimeters printed - (x inside + x outside)
wallThickness = extrusionWidth * (perimeters * 2);

brushCupHeight = 55;
brushCutoutDiameter = 65;
handleWidth = 20;
handleHeight = 25;

spongeCupHeight = 42;
spongeCutoutWidth = 25;
spongeCupLength = 72;

zScaleFactor = ((wallThickness*2)/brushCutoutDiameter);

brushCup();
spongeCup();

// Basic sponge cup
module spongeCup()
{
	segmentOneLength = 24;
	segmentThreeHeight = 14;

	difference()
	{
		{
			union()
			{
				//#translate( [(-1 * (spongeCutoutWidth/2)) - wallThickness, (brushCutoutDiameter/2), 0] ) cube( [spongeCutoutWidth + (wallThickness * 2), spongeCupLength + 0.1, spongeCupHeight + wallThickness] );

				hull()
				{
					{

					}
					{
						union()
						{
							translate( [(spongeCutoutWidth/2) + (wallThickness/2), (brushCutoutDiameter/2), spongeCupHeight + (wallThickness/2)] )
							{
								translate( [0, segmentOneLength, 0] ) sphere( d = wallThickness );
								rotate( [270, 0, 0] ) cylinder( d = wallThickness, h = segmentOneLength );
							}
							translate( [(-1 * (spongeCutoutWidth/2)) - (wallThickness/2), (brushCutoutDiameter/2), spongeCupHeight + (wallThickness/2)] )
							{
								translate( [0, segmentOneLength, 0] ) sphere( d = wallThickness );
								rotate( [270, 0, 0] ) cylinder( d = wallThickness, h = segmentOneLength );
							}

							
							
							translate( [(spongeCutoutWidth/2) + (wallThickness/2), (brushCutoutDiameter/2) + spongeCupLength - (wallThickness/2), 0] )
							{
								translate( [0, 0, segmentThreeHeight] ) sphere( d = wallThickness );
								cylinder( d = wallThickness, h = segmentThreeHeight );
							}
							translate( [(-1 * (spongeCutoutWidth/2)) - (wallThickness/2), (brushCutoutDiameter/2) + spongeCupLength - (wallThickness/2), 0] )
							{
								translate( [0, 0, segmentThreeHeight] ) sphere( d = wallThickness );
								cylinder( d = wallThickness, h = segmentThreeHeight );
							}

							translate( [(-1 * (spongeCutoutWidth/2)) - (wallThickness), (brushCutoutDiameter/2) - 0, 0] ) cube( [spongeCutoutWidth + (wallThickness * 2), spongeCupLength - (wallThickness/2), 0.1] );
						}
					}
				}

			}
		}
		{
			union()
			{
				translate( [(-1 * (spongeCutoutWidth/2)), (brushCutoutDiameter/2) -0.1, (wallThickness * 2)] ) cube( [spongeCutoutWidth, spongeCupLength + 0.4, spongeCupHeight] );
				translate( [0, (brushCutoutDiameter/2) + 0.2, (wallThickness/2) + wallThickness - 0] )
				{
					spongeCupFloor();
					hull()
					{
						{
							translate( [(-1 * (spongeCutoutWidth/2)), 0, (wallThickness/2)] ) cube( [spongeCutoutWidth, spongeCupLength, 0.1] );
						}
						{
							rotate( [269.3, 0, 0] ) cylinder( d = wallThickness, h = spongeCupLength );
						}
					}
				}
			}
		}
	}
}

module brushCupTop()
{
	rotate_extrude( convexity = 10 ) translate([brushCutoutDiameter/2 - 0.7, 0, 0]) circle( d = wallThickness +5, $fn = 100 );
}

module spongeCupFloor()
{
	difference()
	{
		{
			union()
			{
				hull()
				{
					{
						translate( [(-1 * (spongeCutoutWidth/2)), 0, (wallThickness/2)] ) cube( [spongeCutoutWidth, spongeCupLength, 0.1] );
					}
					{
						rotate( [269.3, 0, 0] ) cylinder( d = wallThickness, h = spongeCupLength );
					}
				}
				translate( [(-1 * (spongeCutoutWidth/2)), 0, (wallThickness/2) - 9] ) cube( [spongeCutoutWidth, spongeCupLength, 9] );
			}
		}
		{
			translate( [-1 * (brushCutoutDiameter/2), 4, -8] ) hexgrid([brushCutoutDiameter, brushCutoutDiameter, (wallThickness *2) + 10], 8, 5);
		}
	}
}

// Basic kithchen/dish brush cup
module brushCup()
{
	difference()
	{
		{
			union()
			{
				cylinder( d = brushCutoutDiameter + (wallThickness * 2), h = brushCupHeight + wallThickness );
				translate( [0, 0, brushCupHeight + wallThickness] ) brushCupTop();
			}
		}
		{
			union()
			{
				translate( [0, 0, (wallThickness * 2)] ) cylinder( d1 = brushCutoutDiameter, d2 = (brushCutoutDiameter - 10), h = brushCupHeight );
				translate( [(-1 * (handleWidth/2)), brushCutoutDiameter/4, (brushCupHeight - handleHeight) + wallThickness + 0.1] ) cube( [handleWidth, (brushCutoutDiameter/2), handleHeight + 5] );
				translate( [0, 0, (wallThickness*2)] )
				{
					scale( [1, 1, (zScaleFactor + 0.02)] )
					{
						sphere( d = brushCutoutDiameter );
					}
				}
				brushCupFloor();
			}
		}
		
		
	}
}

module brushCupFloor()
{
	difference()
	{
		{
			union()
			{
				translate( [0, 0, (wallThickness * 2)] )
				{
					scale( [1, 1, zScaleFactor] ) sphere( d = brushCutoutDiameter );
					translate( [0, 0, -8] ) cylinder( d = brushCutoutDiameter, h = 8 );
				}
			}
		}
		{
			union()
			{
				translate( [(-1 * (brushCutoutDiameter/2)), (-1 * (brushCutoutDiameter/2)), wallThickness - 5] )
				{
					hexgrid([brushCutoutDiameter, brushCutoutDiameter, (wallThickness *2) + 10], 8, 5);
				}
			}
		}
	}
}


module hex(hole, wall, thick){
    hole = hole;
    wall = wall;
    difference(){
        rotate([0, 0, 30]) cylinder(d = (hole + wall), h = thick, $fn = 6);
        translate([0, 0, -0.1]) rotate([0, 0, 30]) cylinder(d = hole, h = thick + 0.2, $fn = 6);
    }
}



module hexgrid(box, holediameter, wallthickness) {
    a = (holediameter + (wallthickness/2))*sin(60);
    for(x = [holediameter/2: a: box[0]]) {
        for(y = [holediameter/2: 2*a*sin(60): box[1]]) {
            translate([x, y, 0]) hex(holediameter, wallthickness, box[2]);
            translate([x + a*cos(60), y + a*sin(60), 0]) hex(holediameter, wallthickness, box[2]);

        }
    }
        
}