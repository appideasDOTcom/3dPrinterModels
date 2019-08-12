/**
Carrier box for a small iHome speaker so I can throw it in a bag and not worry

- costmo
- 2018-02-19
**/

$fa = 4; // minimum angle -- use for final rendering
$fs = 0.5; // minumum size -- use for final rendering

wallThickness = 1.8;

baseWidth = 91.5;
baseLength = baseWidth + 5; // make one side a little wider so the cord can be stowed somehere
baseHeight = 35;

markerSize = 5;

base();
//lid();

// mark the long edges so the lid and base can be more easily matched visually + you know where to put the cord
module markers()
{
    
    translate( [(baseWidth / 4), ((-1 * wallThickness) - (markerSize - 0.4)), (baseHeight / 5)] )
    {
        markerCube();
    }
    
    translate( [(baseWidth / 4) * 2.6, ((-1 * wallThickness) - (markerSize - 0.4)), (baseHeight / 5)] )
    {
        markerCube();
    }
    
    translate( [(baseWidth / 4), (baseLength + wallThickness - 0.4), (baseHeight / 5)] )
    {
        markerCube();
    }
    
    translate( [(baseWidth / 4) * 2.6, (baseLength + wallThickness - 0.4), (baseHeight / 5)] )
    {
        markerCube();
    }
}

// eliminate some redundancy
module markerCube()
{
    rotate( a = 45, v = [0, 1, 0] )
    {
        cube( [markerSize, markerSize, markerSize] );
    }
}

// "BASE" is the smaller piece
module base()
{
    difference()
    {
        {
            // the solid piece around the main cutout
            translate( [(-1 * wallThickness), (-1 * wallThickness), (-1 * wallThickness)] )
            {
                cube( [(baseWidth + (wallThickness * 2)), (baseLength + (wallThickness * 2)), (baseHeight + wallThickness)] );
            }
        }
        {
            // the main cutout. this should match the dimensions of the speaker
            cube( [baseWidth, baseLength, (baseHeight + 0.1)] );
        }
        {
            markers();
        }
    }
}

module lid()
{
    lidHeight = 26;
    //lidHeight = 10;
    scaleFactor = 1.048;
    
    difference()
    {
        {
            scale( [scaleFactor, scaleFactor, scaleFactor] )
            {
                base();
            }
        }
        {
            translate( [-200, -200, lidHeight] )
            {
                cube( [400, 400, 100] );
            }
        }
    }
}