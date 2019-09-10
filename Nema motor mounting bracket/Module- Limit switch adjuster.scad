//!OpenSCAD
/**
 * A corner-mount module for the Universal Nema Mounting Bracket that provides an easy Z index adjustment mechanism
 *
 * costmo: 2019-09-04
 */
include <Nema motor mounting bracket.scad>
include <Module- Generic baseplates.scad>

lsaHeight = 6 - (baseCornerRoundness);
lsaWidth = 15 - (baseCornerRoundness);
lsaLength = 24 + 4.2 - (baseCornerRoundness);

translate( [-1 * ((bpPlatformHeightBase/2) - (baseCornerRoundness)), -1 * ((bpPlatformHeightBase/2) - (baseCornerRoundness)), 0] )
{
    renderCornerBase();
    translate( [-1 * (thickness + lsaLength - 0.15), -1 * (thickness + lsaHeight + (baseCornerRoundness/2) - 0.15) - 0.1, (height/2) - (lsaWidth/2)] )
    {
        renderPlatform();
    }
}

module renderCornerBase()
{
    translate( [-1 * (thickness + 4.05), internalNutTrapDistance + 0.15, height/2] )
    {
        rotate( [0, 90, 0] )
        {
            cornerBase();
        }
    }
}

module renderPlatform()
{
    platformYOffset = lsaHeight - (4.2 - (baseCornerRoundness));
    translate( [0, platformYOffset, 0] )
    {
        difference()
        {
            {
                platform();
            }
            {
                union()
                {
                    translate( [cutoutXY - (thickness/2) - 1 + cornerBaseExtensionLength, (thickness/2) + (baseCornerRoundness/2) - 0.4+ cornerBaseExtensionLength, -1 * (baseCornerRoundness/2)] )
                    {
                        cube( [cutoutXY, cutoutXY, lsaWidth + baseCornerRoundness] );
                    }

                    // m4Nut() goes a bit deeper than we need
                    // 0.6 brings the cutout to the model surface. The next number is how much further we want to pull it above the surface.
                    translate( [10, lsaHeight + 0.6 + 1.2, (lsaWidth/2)] )
                    {
                        rotate( [90, 0, 0] )
                        {
                            m4Nut();
                            m4ThroughHole();
                        }
                    }
                }
            }
        }
    }
}

module platform()
{
    hull()
    {
        {
            translate( [2, 0, 2] )
            {
                cube( [lsaLength - 2, lsaHeight, lsaWidth - 4] );
            }
        }
        {
            endcapShapeXDelta = 1;
            endcapShapeYDelta = 2;

            union()
            {
                
                translate( [lsaLength, 0, lsaWidth] )
                {
                    translate( [-3.7, 0, 0] )
                    {
                        rotate( [0, 0, -90] )
                        {
                            rotate( [-90, 0, 0] )
                            {
                                cylinder( d=baseCornerRoundness, h = 3.7 + (baseCornerRoundness/2) );
                            }
                        }
                    }
                }

                translate( [lsaLength, lsaHeight, lsaWidth] )
                {
                    translate( [-3.7, 0, 0] )
                    {
                        rotate( [0, 0, -90] )
                        {
                            rotate( [-90, 0, 0] )
                            {
                                cylinder( d=baseCornerRoundness, h = 3.7 + (baseCornerRoundness/2) );
                            }
                        }
                    }
                }
                translate( [lsaLength, 0, 0] )
                {
                    // sphere( d=baseCornerRoundness );
                    translate( [-3.7, 0, 0] )
                    {
                        rotate( [0, 0, -90] )
                        {
                            rotate( [-90, 0, 0] )
                            {
                                cylinder( d=baseCornerRoundness, h = 3.7 + (baseCornerRoundness/2) );
                            }
                        }
                    }
                }

                translate( [lsaLength, lsaHeight, 0] )
                {
                    // sphere( d=baseCornerRoundness );
                    translate( [-3.7, 0, 0] )
                    {
                        rotate( [0, 0, -90] )
                        {
                            rotate( [-90, 0, 0] )
                            {
                                cylinder( d=baseCornerRoundness, h = 3.7 + (baseCornerRoundness/2) );
                            }
                        }
                    }
                }

                // Endcap of platform
                // Top
                translate( [(1 + endcapShapeXDelta), 0, (0 + endcapShapeYDelta)] )
                {
                    sphere( d=baseCornerRoundness );
                }

                translate( [1, 0, 0] )
                {
                    translate( [0, lsaHeight, 0] )
                    {
                        sphere( d=baseCornerRoundness );
                    }
                }

                // Middle
                translate( [(-2 + endcapShapeXDelta), 0, lsaWidth/1.6] )
                {
                    sphere( d=baseCornerRoundness );
                }

                translate( [-2, lsaHeight, lsaWidth/1.6] )
                {
                    sphere( d=baseCornerRoundness );
                }


                // Bottom
                translate( [(2 + endcapShapeXDelta), 0, (lsaWidth - endcapShapeYDelta)] )
                {
                    sphere( d=baseCornerRoundness );
                }

                translate( [2, lsaHeight, lsaWidth] )
                {
                    sphere( d=baseCornerRoundness );
                }



                translate( [lsaLength, lsaHeight, lsaWidth] )
                {
                    rotate( [90, 0, 0] )
                    {
                        cube([(baseCornerRoundness/2), baseCornerRoundness/2, 2.8 ]);
                    }
                }


                translate( [lsaLength, lsaHeight, -1 * (baseCornerRoundness/2)] )
                {
                    rotate( [90, 0, 0] )
                    {
                        cube([(baseCornerRoundness/2), baseCornerRoundness/2, 2.8 ]);
                    }
                }
            }
        }
    }
}


    

    






