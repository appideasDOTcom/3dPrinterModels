$fa = 1;
$fs = 0.1;

// model_1();
// model_2();



import( "mansion.stl" );


module model_1()
{
	difference()
	{
		{
			translate( [-113, -111, 0] ) import( "Wood/Small_cottage_L-Type/Dorfhaus_2LEG.stl" );
		}
		{
			union()
			{
				translate( [1.2, 1.4, -1] )
				{
					cube( [4.2, 9.2, 2] );
					translate( [0, 5, 0] )
					{
						cube( [6.6, 4.2, 2] );
						translate( [2.95, 4.8, 0] ) cube( [0.7, 0.35, 2] );
					}
				}
			}
		}
	}
}

module model_2()
{
	difference()
	{
		{
			import( "Wood/A_small_cottage/Dorfhaus_2K_EG_fixed.stl" );
		}
		{
			// #union()
			// {
			// 	translate( [6.2, 5, -1] ) cube( [39.5, 62, 5] );
			// }
		}
	}
}


