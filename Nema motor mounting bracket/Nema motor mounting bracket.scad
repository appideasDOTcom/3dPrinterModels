/**
 * A generic bracket for a Nema 17 motor with a modular build approach so that an aribtrary number and type of things can be mounted to it
 *
 * costmo: 2019-09-04
 */

 /** Variables at top, functional code below **/

// The X and Y dimensions od the motor. Added 0.1mm to the technically correct size for tolerance
cutoutXY = 42.4;
// How tall to print - or how wide the piece will be. This piece fits between the metal endcaps of the motor housing. The most common motor has a 20mm gap between the raised metal pieces, so you'll probably need that value or less
height = 5;
// How thick the printed piece will be
thickness = 3;

topBoltCutoutHeight = 6;
topBoltCutoutWidth = 6;
topPieceSupport = 4;

// How thick/tall the top piece will be in total
topThickness = (topBoltCutoutHeight + topPieceSupport);
// Add a small gap between pieces for better fit
toleranceGap = 0.2;

/** Build the final piece here **/

mainUnit();
top();

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

module cutout()
{
    translate( [0, 0, -1] )
    {
        cube( [cutoutXY, (cutoutXY + topThickness + 1), (height + 2)] );
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

                // Top left nut trap angle cutout
                rotate( [0, 0, 30] )
                {
                    cube( [topBoltCutoutWidth, topBoltCutoutHeight + 5, (height + 2)] );
                }

                // Top right nut trap angle cutout
                translate( [(cutoutXY - (toleranceGap * 2) - (topBoltCutoutWidth * 2)), 0, topBoltCutoutWidth + 1] )
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