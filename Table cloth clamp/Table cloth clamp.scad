$fa = 1;
$fs = 0.1;

armThickness = 8;
openingWidth = 46;
armLength = 35;
pieceWidth =  22;
armAngle = 8;

extraEndLength = 12;

cutoutWidth = 4;
cutoutLength = 36;

innerCurveDiameter = 10;

difference()
{
    {
        union()
        {
            body();
            translate( [(innerCurveDiameter/2) + armThickness, openingWidth + armThickness - (innerCurveDiameter/2), 0] )
            {
                rotate( [0, 0, -90] )
                {
                    essCurve( d = innerCurveDiameter, h = pieceWidth );
                }
            }
        }
    }
    {
        union()
        {
            translate( [-0.1, (openingWidth/2) - (cutoutLength/4), (pieceWidth/3.5) - (cutoutWidth/2)] )
            {
                flexCutout();
            }

            translate( [-0.1, (openingWidth/2) - (cutoutLength/4), pieceWidth - ((pieceWidth/3.5) + (cutoutWidth/2))] )
            {
                flexCutout();
            }
        }
    }
}







module body()
{
    union()
    {
        hull()
        {
            {
                translate( [0, armThickness, 0] )
                {
                    cube( [armThickness, openingWidth, pieceWidth] );
                }
            }
            {
                yEndcaps();
            }
        }

        translate( [armThickness, (openingWidth + armThickness), 0] )
        {
            hull()
            {
                {
                    cube( [armLength + extraEndLength, armThickness, pieceWidth] );
                }
                {
                    translate( [(-1 * armThickness), 0, 0] )
                    {
                        xEndcaps();
                    }

                    translate( [armLength + extraEndLength, armThickness/2, 0] )
                    {
                        cylinder( d = armThickness, h = pieceWidth );
                    }
                }
            }
        }

        translate( [(armAngle)/(armThickness*1.5), -1 * ((armAngle)/(armThickness*1.5)), 0] )
        {
            rotate( [0, 0, armAngle] )
            {
                hull()
                {
                    {
                        translate( [armThickness, 0, 0] )
                        {
                            cube( [armLength, armThickness, pieceWidth] );
                        }
                    }
                    {
                        xEndcaps();
                    }
                }
            }
        }
    }
}

module flexCutout()
{
    cube( [armThickness + 1.5, cutoutLength, cutoutWidth] );

    translate( [0, 0, (cutoutWidth/2)] )
    {
        rotate( [0, 90, 0] )
        {
            cylinder( d = cutoutWidth, h = armThickness + 1.5 );
        }
    }

    translate( [0, cutoutLength, (cutoutWidth/2)] )
    {
        rotate( [0, 90, 0] )
        {
            cylinder( d = cutoutWidth, h = armThickness + 1.5 );
        }
    }
}

module yEndcaps()
{
    union()
    {
        translate( [(armThickness/2), (armThickness/2), 0] )
        {
            cylinder( d = armThickness, h = pieceWidth );
        }
        translate( [(armThickness/2), openingWidth + armThickness + (armThickness/2), 0] )
        {
            cylinder( d = armThickness, h = pieceWidth );
        }
    }
}

module xEndcaps()
{
    union()
    {
        translate( [(armThickness/2), (armThickness/2), 0] )
        {
            cylinder( d = armThickness, h = pieceWidth );
        }
        translate( [armLength + armThickness + (armThickness/2), (armThickness/2), 0] )
        {
            cylinder( d = armThickness, h = pieceWidth );
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