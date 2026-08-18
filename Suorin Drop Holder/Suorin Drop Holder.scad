/**
 * A thing to keep a Suorin Drop E-cig standing upright.
 *
 * I wish someone would make a vape Weeble Wobble
 *
 */

// Render quality
// Render quality: Minimum angle
$fa = 1;
// Render quality: Minimum size
$fs = 0.1;

// Inefficient render quality control - quick way to make rendering fast, but ugly
// $fn = 16;

// The diameter of the circle the creates the cutout for the e-cig body
cutoutDiameter = 49;
// The width of the cutout
cutoutTopWidth = 12.6;
// The width at the bottom of the cutout (currently unused)
cutoutBottomWidth = 9.4;
// The height of the cutout
cutoutHeight = 16;

// Make a shape in the bottom where the USB connector lives
// The diameter of the bottom shape
bottomShapeDiameter = 7.7;
// The width of the bottom shape
bottomShapeWidth = 19.5;
// The height of the bottom shape
bottomShapeHeight = 3;

// How thick to make the walls. Also changes corner diameter
wallThickness = 2;

bottomXscale = cutoutDiameter/(bottomShapeDiameter*2.8);
bottomYscale = ((bottomShapeDiameter / 1.66) / cutoutHeight);

difference()
{
    {
        stand();
    }
    {
        translate( [cutoutDiameter/2, cutoutTopWidth/2, cutoutHeight + 2] )
        {
            rotate( [0, -90, -90] )
            {
                cutout();
            }
        }
    }
}


module cutoutWedgePieces()
{
    intersection()
    {
        rotate_extrude()
        {
            translate( [(cutoutBottomWidth/2), 0, 0] )
            {
                circle( r = (cutoutBottomWidth/4) );
            }
            wedge( angle = 2 );
        }
    }
}


module wedge(angle, extent=100, height=100, center=true)
{
    module wedge_wall()
    {
        translate([0,0,(center==true ? -height/2 : 0)])
        cube([extent,0.1,height]);
    }

    for(r=[0:45:angle-45-1])
    {
        hull()
        {
            rotate([0,0,r]) wedge_wall(); 
            rotate([0,0,min(angle,r+45)]) wedge_wall();
        }
    }
    hull()
    {
        rotate([0,0,max(0,angle-45)]) wedge_wall();
        rotate([0,0,angle]) wedge_wall();
    }
}


module stand()
{
    // translate( [(-1 * wallThickness), (-1 * wallThickness), (-1 * wallThickness)] )
    // {
    //     cube( [(cutoutDiameter + (wallThickness * 2)), (cutoutTopWidth + (wallThickness * 2)), (cutoutHeight + wallThickness)] );
    // }
    hull()
    {
        {
            cube( [cutoutDiameter, cutoutTopWidth , cutoutHeight] );
        }
        {
            union()
            {
                wallHull();
                translate( [0, cutoutTopWidth, 0] )
                {
                    wallHull();
                }
            }
        }
    }

    // baseDiameter = 15;

    // translate( [-1 * (wallThickness/2) - wallThickness + 1, -1 * (cutoutTopWidth/2) - (wallThickness/2) - wallThickness + 2, 5.5] )
    // {
    //     rotate( [0, -90, 180] )
    //     {
    //         #essCurve( d = baseDiameter, h = cutoutDiameter + (wallThickness*2) );
    //     }
    // }

    // translate( [cutoutDiameter + (wallThickness), baseDiameter + (cutoutTopWidth/2) - 1, 5.5] )
    // {
    //     rotate( [0, -90, 0] )
    //     {
    //         #essCurve( d = baseDiameter, h = cutoutDiameter + (wallThickness*2) );
    //     }
    // }

    // translate( [-1 * (wallThickness/2) - wallThickness + 1 - (baseDiameter/2) + wallThickness, (cutoutTopWidth) + (wallThickness) + (baseDiameter/2) - 1.8, 5.5] )
    // {
    //     rotate( [0, -90, 90] )
    //     {
    //         #essCurve( d = baseDiameter, h = cutoutTopWidth + (baseDiameter) );
    //     }
    // }

}

module wallHull()
{
    translate( [0, 0, (-1 * wallThickness)] )
    {
        cylinder( r = wallThickness, h = (cutoutHeight + wallThickness));
    }
    translate( [0, 0, cutoutHeight] )
    {
        sphere( r = wallThickness );
    }

    translate( [cutoutDiameter, 0, cutoutHeight] )
    {
        sphere( r = wallThickness );
    }
    translate( [cutoutDiameter, 0, (-1 * wallThickness)] )
    {
        cylinder( r = wallThickness, h = (cutoutHeight + wallThickness));
    }
}

module cutout()
{
    union()
    {
        {
            difference()
            {
                {
                    hull()
                    {
                        {
                            scale( [1.6, 3, 1] )
                            {
                                sphere( d = cutoutTopWidth );
                            }
                        }
                        {
                            scale( [bottomXscale, 1, 1] )
                            {
                                scale( [1, 1/bottomYscale, 1] )
                                {
                                    cutoutWedgePieces();
                                }
                            }
                        }
                    }
                }
                {
                    translate( [0.1, -30, -10] )
                    {
                        cube( [30, 60, 20] );
                    }
                }
            }
        }
        {
            // translate( [-1 * cutoutHeight, -1 * ((bottomShapeWidth - bottomShapeDiameter)/2), 0] )
            // {
            //     rotate( [90, 0, 90] )
            //     {
            //         cylinder( d = bottomShapeDiameter, h = bottomShapeHeight );
            //         translate( [0, (-1 * (bottomShapeDiameter/2)), 0] )
            //         {
            //             cube( [(bottomShapeWidth - bottomShapeDiameter), bottomShapeDiameter, bottomShapeHeight] );
            //         }
            //         translate( [(bottomShapeWidth - bottomShapeDiameter), 0, 0] )
            //         {
            //             cylinder( d = bottomShapeDiameter, h = bottomShapeHeight );
            //         }
            //     }
            // }
        }
    }
}

// Create an "S" shaped curve for model strength on what would otherwise be a corner
module essCurve( d, h )
{
  xDimension = d;
  yDimension = d;
  zDimension = h;

  difference()
    {
      {
        translate( [(-1 * (xDimension / 2)), (-1 * (yDimension / 2)), 0] )
        {
          cube( [xDimension, yDimension, zDimension] );
        }
      }
      {
        translate( [ 0, 0, -1 ] )
        {
          translate( [0, (-1 * yDimension), 0] )
          {
            cube( [xDimension, yDimension * 2, (zDimension + 2)] );
          }
          translate( [(-1 * xDimension), 0, 0] )
          {
            cube( [xDimension, yDimension, (zDimension + 2)] );
          }

          linear_extrude( height=(zDimension + 2), twist=0, scale=[1, 1], center=false)
          {
            $fn=64;    //set sides to 64
            circle(r=(xDimension / 2));
          }
          
        }

      }
    
  }
}