/**
Magnets for the fridge

- costmo
- 2017-10-12
**/

// Default facet count settings (control model smoothness)
//$fn = 64; // Number of facets -- very inneficient way to control rendering smoothness. Probably should leave this commented
//
$fa = 3; // minimum angle -- use for final rendering
$fs = 0.2; // minumum size -- use for final rendering
//
// $fa = 5; // minimum angle --  use for previewing
// $fs = 1; // minumum size -- use for previewing

// variables

difference()
{
    {
        union()
        {
            {
                import( "heart_rotated.STL" );
            }
            {
                words();
            }
        }
    }
    {
        magnets();
    }
}


module magnets()
{
    translate( [-8, 6, -0.1] )
    {
        magnet();
    }
    translate( [8, 6, -0.1] )
    {
        magnet();
    }
    // translate( [0, -4, -0.1] )
    // {
    //     magnet();
    // }
}


module words()
{
    translate( [-1, -10, 0 ] )
    {
        rotate( a = 140, v = [0, 0, 1] )
        {
            letter( "w" );
        }
    }
    translate( [-9, -3, 0 ] )
    {
        rotate( a = 125, v = [0, 0, 1] )
        {
            letter( "h" );
        }
    }

    translate( [-14, 3, 0 ] )
    {
        rotate( a = 90, v = [0, 0, 1] )
        {
            letter( "o" );
        }
    }


    translate( [-11, 12, 0 ] )
    {
        rotate( a = -10, v = [0, 0, 1] )
        {
            letter( "k" );
        }
    }

    translate( [0, 9, 0 ] )
    {
        rotate( a = 25, v = [0, 0, 1] )
        {
            letter( "n" );
        }
    }

    translate( [7, 12, 0 ] )
    {
        rotate( a = -30, v = [0, 0, 1] )
        {
            letter( "e" );
        }
    }

    translate( [15, 10, 0 ] )
    {
        rotate( a = -105, v = [0, 0, 1] )
        {
            letter( "w" );
        }
    }

    translate( [-0.6, -6.5, 0 ] )
    {
        rotate( a = -60, v = [0, 0, 1] )
        {
            letter( "?" );
        }
    }
}

module magnet()
{
    cutoutDiameter = 10.4;
    cutoutHeight = 2.4;
    
    cylinder( h = cutoutHeight, d = cutoutDiameter );
}

module letter( letter )
{

	font = "Open Sans";
	fontSize = 12;
	fontHeight = 8;
	scaleX = 1.2;
	scaleY = 1.2;
	scaleZ = 0.8;

	offsetX = -0.8;
	offsetY = -0.5;
	offsetZ = 0;

	shiftX = 4.2;



	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( letter, font = font, size = (fontSize * 1) );
	}
	translate( [offsetX, offsetY, offsetZ] )
	{
		scale( [scaleX, scaleY, scaleZ] )
		{
			// size is multiplied by 0.75 because openScad font sizes are in points, not pixels
			linear_extrude( height = fontHeight, twist = 0, center = false )
			{
				text( letter, font = font, size = (fontSize * 1) );
			}

		}
	}
}

