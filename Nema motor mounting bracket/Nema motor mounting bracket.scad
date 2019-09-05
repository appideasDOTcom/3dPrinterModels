/**
 * A generic bracket for a Nema 17 motor with a modular build approach so that an aribtrary number and type of things can be mounted to it
 *
 * costmo: 2019-09-04
 */

 /** Variables at top, functional code below **/

 // Render Quality: Minimum angle
$fa = 3;
 // Render Quality: Minimum size
$fs = 0.2;

// The X and Y dimensions od the motor. Added 0.1mm to the technically correct size for tolerance
cutoutXY = 42.;
// How tall to print - or how wide the piece will be. This piece fits between the metal endcaps of the motor housing. The most common motor has a 20mm gap between the raised metal pieces, so you'll probably need that value or less
height = 15;
// How thick the printed piece will be
thickness = 7;

// How tall to make the cutout that holds the top nut trap
topBoltCutoutHeight = 9;
// How wide to make the cutout that holds the top nut trap
topBoltCutoutWidth = 7;
// How much material should go beneath the cutout shape for support and space for extra modular options
topPieceSupport = 4;

// How thick/tall the top piece will be in total
topThickness = (topBoltCutoutHeight + topPieceSupport);
// Add a small gap between pieces for better fit
toleranceGap = 0.2;

boltCenterOffset = 0.8;

orientForPrinting = false;

/** Build the final piece here **/

if( !orientForPrinting )
{
    mainUnit();
    corners();
    top();
}
else
{
    mainUnit();
    corners();
    translate( [77, 8, 0] )
    {
        rotate( [0, 0, 90] )
        {
            top();
        }
    }
}

/** Reusable modules below here **/

module mainUnit()
{
    difference()
    {
        {
            union()
            {
                body();
                
            }
        }
        {
            cutout();
        }
    }
}

module body()
{
    translate( [(-1 * thickness), (-1 * thickness), 0] )
    {
        cube( [(cutoutXY + (thickness * 2)), (cutoutXY + thickness + topThickness), height ] );
    }
}

module corners()
{
    translate( [-4.1, 0, 0] )
    {
        rotate( [0, 0, -45] )
        {
            cube( [5.8, 5.8, height] );
        }
    }

    translate( [(cutoutXY - 5.8) + 1.7, 0, 0] )
    {
        rotate( [0, 0, -45] )
        {
            cube( [5.8, 5.8, height] );
        }
    }

    translate( [(cutoutXY - 5.8) + 1.7, (cutoutXY - 5.8) + 5.8, 0] )
    {
        difference()
        {
            {
                rotate( [0, 0, -45] )
                {
                    cube( [5.8, 5.8, height] );
                }
            }
            {
                translate( [0, (-1 * toleranceGap), -1] )
                {
                    cube( [5.8, 5.8, (height + 2)] );
                }
            }
        }
    }

    translate( [0, (cutoutXY - 5.8) + 5.8, 0] )
    {
        difference()
        {
            {
                translate( [0, -4.1, 0] )
                {
                    rotate( [0, 0, 45] )
                    {
                        cube( [5.8, 5.8, height] );
                    }
                }
            }
            {
                translate( [0, (-1 * toleranceGap), -1] )
                {
                    cube( [5.8, 5.8, (height + 2)] );
                }
            }
        }
    }
}

module cutout()
{
    translate( [0, 0, -1] )
    {
        cube( [cutoutXY, (cutoutXY + topThickness + 1), (height + 2)] );
    }

    translate( [(toleranceGap + topBoltCutoutWidth), (cutoutXY + (topThickness - topBoltCutoutHeight)), -1] )
    {
        translate( [((cutoutXY - (toleranceGap * 2)) - (topBoltCutoutWidth * 2)), 3.5, (height/2 + boltCenterOffset)] )
        {
            rotate( [0, 90, 0] )
            {
                m4ThroughHole();
                translate( [0, 0, -4.6 + (topBoltCutoutWidth + (toleranceGap*3) + thickness + 0.2)] )
                {
                    m4HeadCutout();
                }
            }
        }

        translate( [-4.6, 3.5, (height/2 + boltCenterOffset)] )
        {
            rotate( [0, 90, 0] )
            {
                translate( [0, 0, -10] )
                {
                    m4ThroughHole();
                }
                translate( [0, 0, 4.6 - (topBoltCutoutWidth + toleranceGap + thickness + 0.2)] )
                {
                    m4HeadCutout();
                }
            }
        }
    }
}

module top()
{
    difference()
    {
        {
            // The main cube
            translate( [toleranceGap, cutoutXY, 0] )
            {
                cube( [(cutoutXY - (toleranceGap * 2)), topThickness, height] );
            }
        }
        {
            translate( [(toleranceGap + topBoltCutoutWidth), (cutoutXY + (topThickness - topBoltCutoutHeight)), -1] )
            {
                // main cutout piece
                cube( [((cutoutXY - (toleranceGap * 2)) - (topBoltCutoutWidth * 2)), topBoltCutoutHeight + 1, (height + 2)] );
                
                translate( [((cutoutXY - (toleranceGap * 2)) - (topBoltCutoutWidth * 2)), 3.5, (height/2 + boltCenterOffset)] )
                {
                    rotate( [0, 90, 0] )
                    {
                        m4Nut();
                        m4ThroughHole();
                    }
                }

               translate( [-4.6, 3.5, (height/2 + boltCenterOffset)] )
                {
                    rotate( [0, 90, 0] )
                    {
                        m4Nut();
                        translate( [0, 0, -10] )
                        {
                            m4ThroughHole();
                        }
                    }
                }

                // Top left nut trap angle cutout
                rotate( [0, 0, 30] )
                {
                    cube( [topBoltCutoutWidth, topBoltCutoutHeight + 5, (height + 2)] );
                }

                // Top right nut trap angle cutout
                translate( [(cutoutXY - (toleranceGap * 2) - (topBoltCutoutWidth * 2)), 0, height + 2] )
                {
                    rotate( [0, 180, -30] )
                    {
                        cube( [topBoltCutoutWidth, topBoltCutoutHeight + 5, (height + 2)] );
                    }
                }
            }
        }
    }

}

module m4Nut()
{
    cylinder(h = 4.6, r = 4.1, $fn=6);
}

module m4HeadCutout()
{
    cylinder(h = 4.2, r = 3.8, $fn=256);
}

module m4ThroughHole()
{
    cylinder( r=2.1, h=20, center=false, $fn=256);
}