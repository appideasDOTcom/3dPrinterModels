$fa = 1;
$fs = 0.1;

baseX = 26;
baseY = 21;
baseZ = 14;

supportX = 52;
supportY = 22;
supportZ = 8;

supportCutoutX = 12;
// supportCutoutY = 65;
supportCutoutY = 62;

roundness = 2;

boltOffset = 3.0;
boltDistance = 20;

m3Diameter = 3.8;
m3HeadDiameter = 7;
m3NutDiameter = 6.3;

motorDiameter = 47;
clampThickness = 4;
clampHeight = baseY + (roundness * 2);
clampCutout = 4;

// import( "slider.stl" );

// #translate( [94, 96.5, -84] ) rotate( [0, 0, 90] ) rotate( [0, -90, 0] ) import( "top.stl" );
// #translate( [80, 20, -61.5] ) rotate( [0, 0, 90] ) rotate( [0, -90, 0] ) import( "bottom.stl" );

// translate( [77, 26.5, -27] ) import( "ClampAdapter.stl" );

// translate( [44.5, 26.5, 12] )
// {
// 	rotate( [0, 180, 0] )
// 	{
// 		clamp();
// 	}
// }

cap();

module cap()
{
	translate( [-31, -24, 12] )
	{

		difference()
		{
			{
				union()
				{



					translate( [(baseX/2), clampHeight - roundness, (motorDiameter + clampThickness) - 12.5] )
					rotate( [90, 0, 0] )
					difference()
					{
						{
							union()
							{
								cylinder( d = (motorDiameter + (clampThickness * 2)), h = clampHeight );
								sphere( d = (motorDiameter + (clampThickness * 2)) );
							}
						}
						{
							union()
							{
								translate( [0, 0, -1] ) cylinder( d = motorDiameter, h = clampHeight + 2 );
							}
						}


					}

					translate( [(baseX/2) - (clampCutout/2) - clampCutout, -1 * (clampCutout/2), 60] )
					{
						cube( [clampCutout, clampHeight, 14] );
						translate( [(clampCutout*2), 0, 0] ) cube( [clampCutout, clampHeight, 14] );
					}

				}
			}
			{
				union()
				{


					translate( [(baseX/2), clampHeight, (motorDiameter + clampThickness) - 12.5] )
					{
						rotate( [90, 0, 0] )
						{
							sphere( d = motorDiameter );
							// translate( [0, 0, -5] )
							// {
							// 	cylinder( d = motorDiameter, h = clampHeight + 10 );
							// }
						}
					}

					translate( [(baseX/2) - (clampCutout/2), -3, 40] )
					{
						cube( [clampCutout, 60, 30] );
						translate( [-8, -2, -11] ) cube( [20, 5, 20] );

						translate( [-8, (clampHeight/2) + (m3Diameter/2) - (roundness/2), 30] )
						{

							rotate( [90, 0, 0] )
							{
								translate( [10.5, -8 - (motorDiameter/2), -45] ) cylinder( d = 12, h = 20 );
								rotate( [0, 90, 0] )
								{
									cylinder( d = m3Diameter, h = 20 );
									cylinder( d = m3NutDiameter, h = 6, $fn = 6 );
								}
							}
						}
					}
				}
			}
		}



	}
}


module clamp()
{
	// import( "Motorclamp.stl" );

	translate( [-31, -24, 12] )
	{

		difference()
		{
			{
				union()
				{
					linear_extrude( height = baseZ + 12.5 ) offset( r = roundness ) square( size = [baseX, baseY] );
					linear_extrude( height = supportZ ) offset( r = roundness ) square( size = [baseX, baseY + 75.5] );
					translate([-1 * (baseX/2), 74.5, 0]) linear_extrude( height = supportZ ) offset( r = roundness ) square( size = [supportX, supportY] );

					hull()
					{
						{

						}
						{
							translate( [-1 * (baseX/2) - (roundness/2), 74.2, 0] ) cylinder( d = roundness, h = supportZ );
							translate( [-1 * (roundness/2), 74.2, 0] ) cylinder( d = roundness, h = supportZ );
							translate( [-1 * (roundness/2), baseY, 0] ) cylinder( d = roundness, h = supportZ );
						}
					}

					hull()
					{
						{

						}
						{
							translate( [supportX - supportCutoutX, 74.2, 0] ) cylinder( d = roundness, h = supportZ );
							translate( [supportX/2, 74.2, 0] ) cylinder( d = roundness, h = supportZ );
							translate( [supportX/2 + (roundness/2), baseY, 0] ) cylinder( d = roundness, h = supportZ );
						}
					}



					translate( [(baseX/2), clampHeight - roundness, (motorDiameter + clampThickness) - 12.5] )
					rotate( [90, 0, 0] )
					difference()
					{
						{
							cylinder( d = (motorDiameter + (clampThickness * 2)), h = clampHeight );
						}
						{
							union()
							{
								translate( [0, 0, -1] ) cylinder( d = motorDiameter, h = clampHeight + 2 );
							}
						}


					}

					translate( [(baseX/2) - (clampCutout/2) - clampCutout, -1 * (clampCutout/2), 60] )
					{
						cube( [clampCutout, clampHeight, 14] );
						translate( [(clampCutout*2), 0, 0] ) cube( [clampCutout, clampHeight, 14] );
					}

				}
			}
			{
				union()
				{
					translate([(baseX/2) - (supportCutoutX/2), 27, -2]) linear_extrude( height = supportZ + 4 ) offset( r = roundness ) square( size = [supportCutoutX, supportCutoutY] );
					//translate([(baseX/2) - (supportCutoutX/2) - 8, 78, -2]) linear_extrude( height = supportZ + 4 ) offset( r = roundness ) square( size = [28, 14] );

					// hull()
					// {
					// 	{

					// 	}
					// 	{
					// 		translate([(baseX/2) - (supportCutoutX/2) - 1, 27 - 1, -2]) cylinder( d = roundness, h = supportZ + 4 );
					// 		translate([(baseX/2) - (supportCutoutX/2) + supportCutoutX + (roundness/2), 27 - 1, -2]) cylinder( d = roundness, h = supportZ + 4 );
					// 		translate([(baseX/2), 27 + supportCutoutY, -2]) cylinder( d = roundness * 2, h = supportZ + 4 );

					// 	}
					// }

					translate( [-1 * (baseX/2) + 3.5, 74.1 + (baseY/2) + (m3Diameter/2), -1] )
					{
						cylinder( d = m3Diameter, h = 20 );
						translate( [0, 0, 6.1] ) cylinder( d = m3HeadDiameter, h = 14, $fn = 6 );

						translate( [45, 0, 0] )
						{
							cylinder( d = m3Diameter, h = 20 );
							translate( [0, 0, 6.1] ) cylinder( d = m3HeadDiameter, h = 14, $fn = 6 );
						}
					}

					translate( [boltOffset, 11.5, -1] )
					{
						cylinder( d = m3Diameter, h = 20 );
						translate( [0, 0, 6.1] ) cylinder( d = m3HeadDiameter, h = 16, $fn = 6 );
					}
					translate( [boltOffset + boltDistance, 11.5, -1] )
					{
						cylinder( d = m3Diameter, h = 20 );
						translate( [0, 0, 6.1] ) cylinder( d = m3HeadDiameter, h = 16, $fn = 6 );
					}

					translate( [(baseX/2), clampHeight, (motorDiameter + clampThickness) - 12.5] )
					rotate( [90, 0, 0] )
					translate( [0, 0, -5] ) cylinder( d = motorDiameter, h = clampHeight + 10 );

					translate( [(baseX/2) - (clampCutout/2), -3, 40] )
					{
						cube( [clampCutout, 40, 30] );

						translate( [-8, (clampHeight/2) + (m3Diameter/2) - (roundness/2), 30] )
						{
							rotate( [90, 0, 0] )
							rotate( [0, 90, 0] )
							{
								cylinder( d = m3Diameter, h = 20 );
								cylinder( d = m3NutDiameter, h = 6, $fn = 6 );
							}
						}
					}
				}
			}
		}



	}
}


// translate( [0, 0, -27] )
// {
// 	//rotate( [0, 180, 0] )
// 	{
// 		%import( "Motorclamp.stl" );
// 	}
// }