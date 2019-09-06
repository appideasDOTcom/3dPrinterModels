//!OpenSCAD

include <Nema motor mounting bracket.scad>

// wtOnTopBaseWidth = ((cutoutXY - (toleranceGap * 2)) - (topBoltCutoutWidth * 2)) - 5;
wtOnTopBaseWidth = distanceBetweenTopNutTraps;
wtBaseHeight = 4.2; // Make the height the same as the distance the screw needs to be from the bottom of the model

wtNutTrapOffset = (cutoutXY/2) - (wtOnTopBaseWidth/2);

topBase();
sideBase();
cornerBase();

module topBase()
{
    union()
    {
        translate( [(cutoutXY/2) - (wtOnTopBaseWidth/2), (cutoutXY + topPieceSupport), 0] )
        {
            translate( [topNutTrapDistance - wtNutTrapOffset, 0, (height/2)] )
            {
                rotate( [-90, 0, 0] )
                {
                    connectedM3Spacers( 4.2, distanceBetweenTopNutTraps, 0 );
                }
            }
        }
    }
}

module sideBase()
{
    translate( [(-1 * thickness) - 4.2, internalNutTrapDistance, (height/2)] )
    {
        rotate( [0, 90, 0] )
        rotate( [0, 0, 90] )
        {
            connectedM3Spacers( 4.2, distanceBetweenInternalNutTraps, 0 );
        }
    }
}

module cornerBase()
{
    // #m3Spacer();
}

