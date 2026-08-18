//!OpenSCAD
/**
 * A corner-mount module for a costmo Bracket that provides an easy Z index adjustment mechanism
 *
 * costmo: 2019-09-04
 */
include <costmo Bracket.scad>
include <Module- Generic baseplates.scad>

lsaHeight = 7 - (baseCornerRoundness);
lsaWidth = 15 - (baseCornerRoundness);
lsaLength = 24 + 4.2 - (baseCornerRoundness);

renderSidePlatform = true;
renderFrontPlatform = false;

if( renderSidePlatform )
{
    translate( [-1 * ((bpPlatformHeightBase/2) - (baseCornerRoundness)), -1 * ((bpPlatformHeightBase/2) - (baseCornerRoundness)), 0] )
    {
		difference() {
			{
				union()
				{
					renderCornerBase();
					translate( [-1 * (thickness + lsaLength - 0.15), -1 * (thickness + lsaHeight + (baseCornerRoundness/2) - 0.15) - 0.1, (height/2) - (lsaWidth/2)] )
					{
						renderPlatform( coverTheNut = true );
					}
				}
			}
			{
				translate( [-20, -21.0, -10] ) cube( [50, 10, 50] );
			}
		}

    }
}

if( renderFrontPlatform )
{
    translate( [-1 * ((bpPlatformHeightBase/2) - (baseCornerRoundness)), -1 * ((bpPlatformHeightBase/2) - (baseCornerRoundness)), 0] )
    {
        renderCornerBase();
        rotate( [0, 90, 0] )
        translate( [-1 * (thickness + lsaLength - 0.15) - 6, -1 * (thickness + lsaHeight + (baseCornerRoundness/2) - 0.15) - 0.1, (height/2) - (lsaWidth/2) + 0.4] )
        {
            difference()
            {
                {
                    renderPlatform();
                }
                {
                    translate( [-5, thickness, -3] )
                    {
                        cube( [45, 10, 20] );
                    }
                }
            }
            
        }
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

module renderPlatform( coverTheNut = false )
{
    platformYOffset = lsaHeight - (4.2 - (baseCornerRoundness));

	throughHoleBodyOffset = 5;
	throughHoleX = 13;
	throughHoleY = -12;

	platformRoundness = 4;
	platformHeight = 8;

	translate( [10, lsaHeight + 0.6 + 1.2, (lsaWidth/2)] )
	{
		rotate( [90, 0, 0] )
		{
			// #m4Nut();

			// I'm not maintaining the press-fit nut version any more
			// if( coverTheNut == false )
			// {
			// 	pressFitM4Nut();
			// }

			difference()
			{
				{
					hull()
					{
						{

						}
						{
							union()
							{
								translate( [throughHoleX + throughHoleBodyOffset - 10 + (platformRoundness/2), -1 * (height/2) + (platformRoundness/2) + 0.1, -2.2 + 5.4 - 6.91 + 1] ) {

									translate( [(-3.5), -5 - (8.4) - (1), 0] ) cylinder( d = platformRoundness, h = platformHeight );
									translate( [3, -5 - (8.4) - (1), 0] ) cylinder( d = platformRoundness, h = platformHeight );
									translate( [3 - (platformRoundness/2), height - lsaHeight - (platformRoundness), 0] ) cube( [platformRoundness, platformRoundness/2 + 0.2, platformHeight + 0.17] );
									translate( [(-3.5), height - lsaHeight - (platformRoundness) + 0.2, 0] ) cylinder( d = platformRoundness, h = platformHeight );
								}
							}
						}
					}
				}
				{
					union()
					{
						translate( [throughHoleX - (3.5), throughHoleY - (8.4) - (1), -2.2 + 5.4 - 4] ) coveredM4Nut( height = 4.8, diameter = 8.2 );
						translate( [throughHoleX - (3.5), throughHoleY - (8.4) - (1), -5] ) m4ThroughHole();
					}

				}
			}

		}

		
	}
    // translate( [0, platformYOffset, 0] )
    // {
    //     difference()
    //     {
    //         {
    //             platform();
    //         }
    //         {
    //             union()
    //             {
    //                 translate( [cutoutXY - (thickness/2) - 1 + cornerBaseExtensionLength, (thickness/2) + (baseCornerRoundness/2) - 0.4+ cornerBaseExtensionLength, -1 * (baseCornerRoundness/2)] )
    //                 {
    //                     cube( [cutoutXY, cutoutXY, lsaWidth + baseCornerRoundness] );
    //                 }

    //                 // m4Nut() goes a bit deeper than we need
    //                 // 0.6 brings the cutout to the model surface. The next number is how much further we want to pull it above the surface.
    //                 #translate( [10, lsaHeight + 0.6 + 1.2, (lsaWidth/2)] )
    //                 {
    //                     rotate( [90, 0, 0] )
    //                     {
    //                         // #m4Nut();

	// 						if( coverTheNut == false )
	// 						{
	// 							pressFitM4Nut();
	// 						}
	// 						else
	// 						{
	// 							// -2.2 bring it to the surface, + 5.4 sinks it 2mm below (3.4mm nut height + 2mm)
	// 							translate( [0, 0, -2.2 + 5.4] ) coveredM4Nut( height = 3.4, diameter = 8.3 );
	// 						}
    //                         m4ThroughHole();
    //                     }
    //                 }
    //             }
    //         }
    //     }
    // }
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


    

    






