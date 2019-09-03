/**
 * A clamp/clip that holds bed frame pieces together.
 *
 * The clamps that keep our bed frame together disappeared somewhere in a move, so I had to come up with something real quick-like. This will do the trick.
 *
 * Install two clamps per rail, each with two zipties, and you're good to go.
 *
 * The easiest way to modify the size of this piece is to change the values of the endcapSize and middleSize variables. The rest of the model will adjust to those changes. The default settings give you a model that is 40mm wide with 5mm on either size of the zipties.
 *
 * Given the need for this part to take stress, I recommend printing in ABS with a high number of perimeters and solid layers and high infill. I used 5 perimeters and solid layers with 50% infill.
 *
 * 2019-09-03: costmo
 * https://github.com/appideasDOTcom/3dPrinterModels
 * https://appideas.com/blog
**/

// Render quality settings. This model is all cubes, so this probably won't have much effect.
$fa = 1;
$fs = 0.1;

// How tall to make the top on the Y axis. Not too thin or the pirce will be weak. Not too thick or it will not fit under the box spring.
topThickness = 5;
// How tall to make the piece that's below the elbow
bottomThickness = 12;
// Girth to add behind the elbow
elbowThickness = 7;

// Length of the top piece on the X axis
topLength = 30;
// The size of the openings for the rails on the Y axis
elbowHeight = 6.4;
// Length of the bottom piece (prior to the "support") on the Y axis
bottomLength = 31;
// How tall to make the bottom piece on the Y axis
bottomSupportLength = (25 - bottomThickness);
// Size of the bottom support on the X axis
bottomSupportThickness = 25;

// Width of ziptie cutouts
ziptieWidth = 5;

// These variables determine the overall length of the object (which is "height" from the printer's perspective)
// Overall length will be: (endcapSize * 2) + (ziptieWidth * 2) + middleSize
// Size of endcaps on the Z axis
endcapSize = 5;
// Size of the middle secion on the Z axis (between the ziptie cutouts)
middleSize = 20;

// Do it!
makeThing();

// Put the pieces together
module makeThing()
{
    union()
    {
        // endcap
        fullPiece( endcapSize );

        // First ziptie
        translate( [0, 0, endcapSize] )
        {
            ziptieCutout();
        }

        // Middle section
        translate( [0, 0, (endcapSize + ziptieWidth)] )
        {
            fullPiece( middleSize );
        }

        // second ziptie
        translate( [0, 0, (endcapSize + ziptieWidth + middleSize)] )
        {
            ziptieCutout();
        }

        // endcap
        translate( [0, 0, (endcapSize + ziptieWidth + middleSize + endcapSize)] )
        {
            fullPiece( endcapSize );
        }
    }
}

// A ziptie cutout piece as a modular unit
module ziptieCutout()
{
    difference()
    {
        {
            union()
            {
                top( ziptieWidth );
                elbow( ziptieWidth );
                bottom( ziptieWidth );
                bottomSupport( ziptieWidth );
            }
        }
        {
            union()
            {
                cornerCutouts( ziptieWidth );
                ziptieCutouts();
            }
        }
    }
}

// A full-sized piece as a modular unit
module fullPiece( width )
{
    difference()
    {
        {
            union()
            {
                top( width );
                elbow( width );
                bottom( width );
                bottomSupport( width );
            }
        }
        {
            union()
            {
                cornerCutouts( width );
            }
        }
    }
}

// Part of the model above the elbow (rail cutout)
module top( width )
{
    cube( [(topLength + elbowThickness), topThickness, width] );
}

// Cutout the place where the bed rails will live
module elbow( width )
{
    translate( [(elbowThickness + 1.5), -1.5, 0] )
    {
        rotate( [0, 0, -90] )
        {
            essCurve( d = 3, h = width );
        }
    }

    translate( [(elbowThickness + 1.5), (-1 * elbowHeight) + 1.5, 0] )
    {
        essCurve( d = 3, h = width );
    }

    translate( [0, (-1 * elbowHeight), 0] )
    {
        cube( [elbowThickness, elbowHeight, width] );
    }
}

// Part of the model below the elbow (rail cutout)
module bottom( width )
{
    translate( [0, ((-1 * elbowHeight) - bottomThickness), 0] )
    {
        cube( [(bottomLength + elbowThickness), bottomThickness, width] );
    }
}

// Part of the model beneath "bottom" for strength/stability
module bottomSupport( width )
{
    translate( [(bottomLength + elbowThickness - bottomSupportThickness - 3), (-3 - elbowHeight - bottomThickness), 0] )
    {
        rotate( [0, 0, 180] )
        {
            essCurve( d = 6, h = width );
        }
    }

    translate( [(bottomLength + elbowThickness - bottomSupportThickness), ((-1 * elbowHeight) - bottomThickness - bottomSupportLength), 0] )
    {
        cube( [bottomSupportThickness, bottomSupportLength, width] );
    }

    
}

// Impressions for iptie channels
module ziptieCutouts()
{
    translate( [-10.5, 0, 0] )
    {
        rotate( [0, 0, -30] )
        {
            cube( [10, 50, ziptieWidth] );
        }
    }

    translate( [41.6, -10, 0] )
    {
        rotate( [0, 0, 30] )
        {
            cube( [10, 50, ziptieWidth] );
        }
    }

    translate( [23.3, -50, 0] )
    {
        rotate( [0, 0, -30] )
        {
            cube( [10, 50, ziptieWidth] );
        }
    }

    translate( [-1, -30, 0] )
    {
        rotate( [0, 0, 30] )
        {
            cube( [10, 50, ziptieWidth] );
        }
    }

    translate( [38, -62, 0] )
    {
        rotate( [0, 0, 50] )
        {
            cube( [10, 50, ziptieWidth] );
        }
    }
}

// Cut 90 degree edges for better aesthetics and print quality
module cornerCutouts( width )
{
    translate( [-13.5, 0, -1] )
    {
        rotate( [0, 0, -30] )
        {
            cube( [10, 50, (width + 2)] );
        }
    }

    translate( [44.6, -10, -1] )
    {
        rotate( [0, 0, 30] )
        {
            cube( [10, 50, (width + 2)] );
        }
    }

    translate( [34.3, -3, -1] )
    {
        rotate( [0, 0, -30] )
        {
            cube( [10, 50, (width + 2)] );
        }
    }

    translate( [60, -47, -1] )
    {
        rotate( [0, 0, 30] )
        {
            cube( [10, 50, (width + 2)] );
        }
    }

    translate( [26.3, -50, -1] )
    {
        rotate( [0, 0, -30] )
        {
            cube( [10, 50, (width + 2)] );
        }
    }

    translate( [-4, -30, -1] )
    {
        rotate( [0, 0, 30] )
        {
            cube( [10, 50, (width + 2)] );
        }
    }

    translate( [25, -70, -1] )
    {
        rotate( [0, 0, 30] )
        {
            cube( [10, 50, (width + 2)] );
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
          cube( [xDimension, yDimension, (zDimension + 2)] );

          translate( [0, (-1 * yDimension), 0] )
          {
            cube( [xDimension, yDimension, (zDimension + 2)] );
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