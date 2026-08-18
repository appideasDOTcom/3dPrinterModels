// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

// Top shelf: 20.6
// Bottom shelves: 19.1

shelf_Thickness		= 20.6;

arm_Height			= 4;
arm_Width			= 9;
arm_Reach			= 65;

fin_Height = 8;
//
fin_Thickness = 3;

back_Thickness = 5;

difference()
{
	{
		union()
		{
			arms();
			back();
			// fin();
			opposing_fin();
		}
	}
	{
		corner_relief();
	}
}



module opposing_fin()
{
	translate( [shelf_Thickness, 0, fin_Thickness] ) rotate( [0, 180, 0] ) fin();
}

module corner_relief()
{
	translate( [0, back_Thickness - arm_Height/2, -1] ){
		translate( [0.25, 0.25, 0] ) cylinder( d = 1, h = arm_Width + 2 );
		translate( [shelf_Thickness - 0.25, 0.25, 0] ) cylinder( d = 1, h = arm_Width + 2 );
	}
}


module fin()
{
	hull()
	{
		{
			translate( [(-1 * fin_Height) - arm_Height/2, 0, 0] ) cube( [fin_Height, arm_Reach, fin_Thickness] );
		}
		{
			translate( [(-1 * fin_Height) - (arm_Height/2), arm_Height/2, 0] )
			{
				cylinder( d = arm_Height, h = fin_Thickness );
				translate( [0, arm_Reach - arm_Height, 0] ) cylinder( d = arm_Height, h = fin_Thickness );
			}
		}
	}
}


// %translate( [(-1 * fin_Height) - arm_Height, 0, 0] ) cube( [fin_Height - (arm_Height/2), arm_Reach, fin_Thickness] );

module back()
{
	hull()
	{
		{}
		{
			translate( [0, -1 * (arm_Height/2), 0] )
			{
				translate( [(-1 * (arm_Height/2)), 0, 0] ) cube( [arm_Height, back_Thickness, arm_Width] );
				translate( [shelf_Thickness - (arm_Height/2), 0, 0] ) cube( [arm_Height, back_Thickness, arm_Width] );
			}
		}
	}

}

module arms()
{
	arm();
	// translate( [0, 0, 6] ) arm();
	translate( [shelf_Thickness + arm_Height, 0, 0] ) arm();
}

module arm()
{
	translate( [-1 * (arm_Height/2), 0, 0] )
	{
		hull()
		{
			{}
			{
				union()
				{
					cylinder( d = arm_Height, h = arm_Width );
					translate( [0, arm_Reach, 0] ) cylinder( d = arm_Height, h = arm_Width );
				}
			}
		}
	}
}
