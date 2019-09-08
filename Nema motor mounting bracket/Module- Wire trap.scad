//!OpenSCAD
/**
 * A top-mount wire trap module for the Universal Nema Mounting Bracket
 *
 * costmo: 2019-09-04
 */

include <Nema motor mounting bracket.scad>
include <Module- Generic baseplates.scad>

// wtOnTopBaseWidth = ((cutoutXY - (toleranceGap * 2)) - (topBoltCutoutWidth * 2)) - 5;
wtOnTopBaseWidth = distanceBetweenTopNutTraps;
wtBaseHeight = 4.2; // Make the height the same as the distance the screw needs to be from the bottom of the model

wtNutTrapOffset = (cutoutXY/2) - (wtOnTopBaseWidth/2);

wtBasePlateCornerDiameter = 3;

wtTopNeckWidth = 18;
wtTopNeckDepth = 5;

wtTopNeckHeight = 7.3;

wtBodyHeight = 8;
wtBodyThickness = 4;

wtBasePlateExtraWidth = 9;
extraBackBaseOffset = -4.5; // fix center when extra "wtTopNeckHeight" is added

renderTop = true;

if( renderTop )
{
    union()
    {
        renderTopBase();
        topWireTrapNeck();
        wiretrapBody();
    }
}
else
{
    union()
    {
        renderSideBase();
    }
}



module wiretrapBody()
{
    translate( [distanceBetweenTopNutTraps + wtBasePlateCornerDiameter - wtTopNeckHeight - extraBackBaseOffset, cutoutXY + topPieceSupport + wtBaseHeight + 3.4 + wtTopNeckHeight, 0] )
    {
        difference()
        {
            {
                hull()
                {
                    {
                        translate( [0.5, 0.5, 0.5] )
                        {
                            cube( [wtTopNeckWidth - 1, wtBodyHeight, wtTopNeckDepth - 1] );
                        }
                    }
                    {
                        cube( [0.5, 0.5, 0.5] );

                        translate( [0.5, wtBodyHeight + 0.5, 0.5] )
                        {
                            sphere( r=0.5 );
                        }

                        translate( [0, 0, wtTopNeckDepth - 0.5] )
                        {
                            cube( [0.5, 0.5, 0.5] );
                        }

                        translate( [0.5, wtBodyHeight + 0.5, wtTopNeckDepth - 0.5] )
                        {
                            sphere( r=0.5 );
                        }

                        translate( [wtTopNeckWidth - 0.5, 0, wtTopNeckDepth - 0.5] )
                        {
                            cube( [0.5, 0.5, 0.5] );
                        }

                        translate( [wtTopNeckWidth - 0.5, wtBodyHeight + 0.5, wtTopNeckDepth - 0.5] )
                        {
                            sphere( r=0.5 );
                        }

                        translate( [wtTopNeckWidth - 0.5, 0, 0] )
                        {
                            cube( [0.5, 0.5, 0.5] );
                        }

                        translate( [wtTopNeckWidth - 0.5, wtBodyHeight + 0.5, 0.5] )
                        {
                            sphere( r=0.5 );
                        }
                    }
                }
            }
            {
                translate( [wtBodyThickness/2, wtBodyThickness/1.3 - 0.4, 0] )
                {
                    cube( [wtTopNeckWidth - wtBodyThickness, wtBodyHeight - wtBodyThickness, wtTopNeckDepth] );
                }
            }
            
        }
    }
}

module topWireTrapNeck()
{
    translate( [distanceBetweenTopNutTraps + wtBasePlateCornerDiameter - wtTopNeckHeight - extraBackBaseOffset, cutoutXY + topPieceSupport + wtBaseHeight + 3.4, 0] )
    {
        
        cube( [wtTopNeckWidth, wtTopNeckHeight, wtTopNeckDepth] );

        difference()
        {
            {
                // Bottom curves
                union()
                {
                    translate( [-1.3, 1.3, 0] )
                    {
                        rotate( [0, 0, 90] )
                        {
                            essCurve( 2.6, wtTopNeckDepth + 1.3 );
                        }
                    }

                    translate( [wtTopNeckWidth + 1.3, 1.3, 0] )
                    {
                        essCurve( 2.6, wtTopNeckDepth + 1.3 );
                    }

                    translate( [wtTopNeckWidth + 0.65, 1.3, wtTopNeckDepth + 1.3] )
                    {
                        rotate( [0, -90, 0] )
                        {
                            essCurve( 2.6, wtTopNeckWidth + 1.3 );
                        }
                    }
                }
            }
            {
                // Cylinder cutouts
                union()
                {
                    translate( [-1.3, 1.3, wtTopNeckDepth + 1.3] )
                    {
                        rotate( [0, 90, 0] )
                        {
                            cylinder( r=1.3, h=wtTopNeckWidth + 2.6 );
                        }
                    }

                    translate( [-1.3, 1.3, 0] )
                    {
                        cylinder( r=1.3, h=wtTopNeckDepth + 2.6 );
                    }

                    translate( [wtTopNeckWidth + 1.3, 1.3, 0] )
                    {
                        cylinder( r=1.3, h=wtTopNeckDepth + 2.6 );
                    }
                }
                
            }
        }
        
    }
    
}

module renderSideBase()
{
    fullSideBase();
}

module renderTopBase()
{
    difference()
    {
        {
            fullTopBase();
        }
        {
            fullTopBoltCutouts();
        }
    }
}


module fullSideBase()
{
    translate( [-1 * thickness, internalNutTrapDistance, height/2] )
    {
        rotate( [-90, 0, 0] )
        rotate( [0, -90, 0] )
        {
            sideBase();
            translate( [0, 0, 3.4] )
            {
                sideBase();
            }
        }
    }
}

module fullTopBase()
{
    translate( [(cutoutXY/2) - (wtOnTopBaseWidth/2), (cutoutXY + topPieceSupport), 0] )
    {
        translate( [topNutTrapDistance - wtNutTrapOffset, 0, (height/2)] )
        {
            rotate( [-90, 0, 0] )
            {
                topBase();
                // repeated to make an extra deep recess so that M3 bolt heads will be flush with the model surface
                translate( [0, 0, 3.4] )
                {
                    topBase();
                }
            }
        }

        translate( [-1 * (wtBasePlateExtraWidth/2) + (wtBasePlateCornerDiameter/2), 0, wtBasePlateCornerDiameter/2] )
        {
            // Clumsily filling a hole left over from resizing the base. This will need to change is other size change
            translate( [(wtBasePlateExtraWidth - 7 + 1), 0, 11.8] )
            {
                cube( [distanceBetweenTopNutTraps, 7.6, (wtBasePlateExtraWidth - 7)] );
            }

            hull()
            {
                {
                    cube( [(distanceBetweenTopNutTraps + wtBasePlateExtraWidth - wtBasePlateCornerDiameter), wtBaseHeight + 3.4, (height/2) - (wtBasePlateCornerDiameter/2)] );
                }
                {
                    union()
                    {
                        translate( [-1 * (wtBasePlateExtraWidth - 7 + 0.5), 0, (height/2) - (wtBasePlateCornerDiameter + (wtBasePlateCornerDiameter/2))] )
                        {
                            cube( [(wtBasePlateExtraWidth - 7 + 0.5), wtBaseHeight + 3.4, wtBasePlateCornerDiameter] );
                        }

                        translate( [distanceBetweenTopNutTraps + (wtBasePlateExtraWidth - 3), 0, (height/2) - (wtBasePlateCornerDiameter + (wtBasePlateCornerDiameter/2))] )
                        {
                            cube( [(wtBasePlateExtraWidth - 7 + 0.5), wtBaseHeight + 3.4, wtBasePlateCornerDiameter] );
                        }

                        translate( [-1 * (wtBasePlateExtraWidth - 7), wtBaseHeight + 3.4, 0] )
                        {
                            rotate( [90, 0, 0] )
                            {
                                cylinder( d=3, h=wtBaseHeight + 3.4 );
                            }
                        }

                        translate( [(distanceBetweenTopNutTraps + (wtBasePlateExtraWidth - 3) + (wtBasePlateExtraWidth - 7)), wtBaseHeight + 3.4, 0] )
                        {
                            rotate( [90, 0, 0] )
                            {
                                cylinder( d=3, h=wtBaseHeight + 3.4 );
                            }
                        }
                    }
                }

            }
            
        }
    }
}

module fullTopBoltCutouts()
{
    translate( [(cutoutXY/2) - (wtOnTopBaseWidth/2), (cutoutXY + topPieceSupport), 0] )
    translate( [0, 10, (height/2)] )
    {
        rotate( [90, 0, 0] )
        {
            connectedM3ThroughHoles( distanceBetweenTopNutTraps, 0 );
            // Need to sink a little deeper to use an M3x8mm bolt
            translate( [0, 0, 3.4] )
            {
                connectedM3HeadCutouts( distanceBetweenTopNutTraps, 0 );
            }
            translate( [0, 0, 2.2] )
            {
                connectedM3HeadCutouts( distanceBetweenTopNutTraps, 0 );
            }
        }
    }
}
    

    






