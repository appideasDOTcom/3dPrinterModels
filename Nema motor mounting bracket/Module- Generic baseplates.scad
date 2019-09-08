//!OpenSCAD
/**
 * Generic baseplates to use as the foundation for Universal Nema Mounting Bracket modules
 *
 * costmo: 2019-09-04
 */
include <Nema motor mounting bracket.scad>

baseCornerRoundness = 1.2;

module topBase()
{
    connectedM3Spacers( 4.2, distanceBetweenTopNutTraps, 0 );
}

module sideBase()
{
    connectedM3Spacers( 4.2, distanceBetweenInternalNutTraps, 0 );
}

module cornerBase()
{
    cornerSide();
    translate( [0, -1 * (internalNutTrapDistance + thickness + 4.2), internalNutTrapDistance + thickness + 4.2] )
    {
        rotate( [0, 180, 0] )
        rotate( [90, 0, 0] )
        rotate( [180, 0, 0] )
        {
            cornerSide();
        }
    }
}

module cornerSide()
{
    
    sideLength = internalNutTrapDistance + thickness + 2.8 + 5.2;
    lengthOffset = 1;

    difference()
    {
        {
            union()
            {
                m3Spacer( 4.2, 0 );
                translate( [-7.5, (-1 * (internalNutTrapDistance + thickness + 3.7)), -0.1] )
                {
                    hull()
                    {
                        {
                            translate( [baseCornerRoundness/2, lengthOffset, baseCornerRoundness/2] )
                            {
                                cube( [15 - baseCornerRoundness, sideLength - lengthOffset, 4.2 - (baseCornerRoundness/2) ] );
                            }
                        }
                        {
                            useHeight = 3.7;
                            useHalfHeight = 3.7/2;

                            union()
                            {
                                translate( [baseCornerRoundness/2, (sideLength), baseCornerRoundness/2] )
                                {
                                    cylinder( d=baseCornerRoundness, h = useHeight );
                                    sphere( d=baseCornerRoundness );
                                }

                                // make the endcaps slope at > 45 angle so we can print from any orientation without supports
                                translate( [baseCornerRoundness/2 + useHeight, (sideLength) + useHeight/3, (baseCornerRoundness/2) + (useHalfHeight)] )
                                {
                                    cylinder( d=baseCornerRoundness, h = useHalfHeight );
                                    sphere( d=baseCornerRoundness );
                                }


                                translate( [15 - (baseCornerRoundness/2), (sideLength), baseCornerRoundness/2] )
                                {
                                    cylinder( d=baseCornerRoundness, h = useHeight );
                                    sphere( d=baseCornerRoundness );
                                }

                                translate( [15 - (baseCornerRoundness/2) - useHeight, (sideLength) + useHeight/3, baseCornerRoundness/2 + (useHalfHeight)] )
                                {
                                    cylinder( d=baseCornerRoundness, h = useHalfHeight );
                                    sphere( d=baseCornerRoundness );
                                }


                                translate( [15 - (baseCornerRoundness/2), lengthOffset, 0] )
                                {
                                    translate( [0, -1 * (baseCornerRoundness/2), baseCornerRoundness] )
                                    {
                                        cube([(baseCornerRoundness/2), baseCornerRoundness/2, 3.2 ]);
                                    }
                                    translate( [0, -1 * (baseCornerRoundness/2), (baseCornerRoundness/2)] )
                                    {
                                        rotate( [-90, 0, 0] )
                                        {
                                            cylinder( d=baseCornerRoundness, h = useHeight + (baseCornerRoundness/2) );
                                        }
                                    }
                                }
                                translate( [(baseCornerRoundness/2), lengthOffset, 0] )
                                {
                                    translate( [-1 * (baseCornerRoundness/2), -1 * (baseCornerRoundness/2), baseCornerRoundness] )
                                    {
                                        cube([(baseCornerRoundness/2), baseCornerRoundness/2, 3.2 ]);
                                    }
                                    translate( [0, -1 * (baseCornerRoundness/2), (baseCornerRoundness/2)] )
                                    {
                                        rotate( [-90, 0, 0] )
                                        {
                                            cylinder( d=baseCornerRoundness, h = useHeight + (baseCornerRoundness/2) );
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        {
            union()
            {
                translate( [0, 0, -5] )
                {
                    m3ThroughHole();
                }

                // -3.5 brings the cutout to the surface. positive values after cut into the body
                translate( [0, 0, -3.5 + 1.0 ] )
                {
                    m3HeadCutout();
                }
                
            }
        }
    }

            
}

// examples:
/**
translate( [(cutoutXY/2) - (wtOnTopBaseWidth/2), (cutoutXY + topPieceSupport), 0] )
{
    translate( [topNutTrapDistance - wtNutTrapOffset, 0, (height/2)] )
    {
        rotate( [-90, 0, 0] )
        {
            topBase();
        }
    }
}

translate( [(-1 * thickness) - 4.2, internalNutTrapDistance, (height/2)] )
{
    rotate( [0, 90, 0] )
    rotate( [0, 0, 90] )
    {
        sideBase();
    }
}
**/

