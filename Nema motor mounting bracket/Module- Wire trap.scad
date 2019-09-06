//!OpenSCAD

include <Nema motor mounting bracket.scad>
include <Module- Generic baseplates.scad>

// wtOnTopBaseWidth = ((cutoutXY - (toleranceGap * 2)) - (topBoltCutoutWidth * 2)) - 5;
wtOnTopBaseWidth = distanceBetweenTopNutTraps;
wtBaseHeight = 4.2; // Make the height the same as the distance the screw needs to be from the bottom of the model

wtNutTrapOffset = (cutoutXY/2) - (wtOnTopBaseWidth/2);

wtBasePlateCornerDiameter = 3;

renderTopBase();

module renderTopBase()
{
    difference()
    {
        {
            translate( [(cutoutXY/2) - (wtOnTopBaseWidth/2), (cutoutXY + topPieceSupport), 0] )
            {
                translate( [topNutTrapDistance - wtNutTrapOffset, 0, (height/2)] )
                {
                    rotate( [-90, 0, 0] )
                    {
                        topBase();
                    }
                }

                translate( [topNutTrapDistance - wtNutTrapOffset, 3.4, (height/2)] )
                {
                    rotate( [-90, 0, 0] )
                    {
                        topBase();
                    }
                }

                translate( [-3.5 + (wtBasePlateCornerDiameter/2), 0, wtBasePlateCornerDiameter/2] )
                {
                    hull()
                    {
                        {
                            cube( [(distanceBetweenTopNutTraps + 7 - wtBasePlateCornerDiameter), wtBaseHeight + 3.4, (height/2) - (wtBasePlateCornerDiameter/2)] );
                        }
                        {
                            union()
                            {
                                translate( [(-1 * (wtBasePlateCornerDiameter/2)) - 1, 0, (height/2) - (wtBasePlateCornerDiameter)] )
                                {
                                    cube( [(wtBasePlateCornerDiameter/2), wtBaseHeight + 3.4, (wtBasePlateCornerDiameter/2)] );
                                }

                                translate( [(distanceBetweenTopNutTraps + 8 - wtBasePlateCornerDiameter), 0, (height/2) - (wtBasePlateCornerDiameter)] )
                                {
                                    cube( [(wtBasePlateCornerDiameter/2), wtBaseHeight + 3.4, (wtBasePlateCornerDiameter/2)] );
                                }

                                translate( [-1, wtBaseHeight + 3.4, 0] )
                                {
                                    rotate( [90, 0, 0] )
                                    {
                                        cylinder( d=3, h=wtBaseHeight + 3.4 );
                                    }
                                }

                                translate( [(distanceBetweenTopNutTraps + 8 - wtBasePlateCornerDiameter), wtBaseHeight + 3.4, 0] )
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
        {
            translate( [(cutoutXY/2) - (wtOnTopBaseWidth/2), (cutoutXY + topPieceSupport), 0] )
            translate( [0, 10, (height/2)] )
            {
                rotate( [90, 0, 0] )
                {
                    connectedM3ThroughHoles( distanceBetweenTopNutTraps, 0 );
                    translate( [0, 0, 2.4] )
                    {
                        connectedM3HeadCutouts( distanceBetweenTopNutTraps, 0 );
                    }
                }
            }
        }
    }



        

}
    

    






