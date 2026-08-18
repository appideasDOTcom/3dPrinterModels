// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

floorWidth = 106.5;
floorLength = 88;
floorDepth = 6;

cornerDiameter = 4;
wallThickness = 4;

legDiameter = 3;
legPieceSelfOffset = 10;
legPieceCornerOffset = 2;
legTolerance = 0.2;

// legHeight = 170;
legHeight = 155;

legInset = 3;
legSpacer = 4.5;

wallOffset = wallThickness - (cornerDiameter/2);

legTotalOffset = (-1 * wallOffset) - (cornerDiameter/2) + (legDiameter/2) + legPieceCornerOffset;

m3HeadHeight = 3.3;
m3HeadDiameter = 6;
m3ThroughHoleDiameter = 3.7;
m3NutDiameter = 6.4;
m3NutDepth = 2.6;

// Constructed shelf with legs.
// difference()
// {
// 	{
// 		union()
// 		{
// 			body();
// 			translate( [legTotalOffset, legTotalOffset, -1 * legHeight] )
// 			{
// 				translate( [0, 0, legInset] )
// 				{
// 					leg();
// 					translate( [floorWidth, 0, 0] ) rotate( [0, 0, 90] ) leg();
// 					translate( [0, floorLength, 0] ) rotate( [0, 0, -90] ) leg();
// 					translate( [floorWidth, floorLength, 0] ) rotate( [0, 0, 180] ) leg();
// 				}
// 			}
// 		}
// 	}
// 	{
// 		combinedCutouts();
// 	}
// }

// A leg.
difference()
{
	{
		translate( [legTotalOffset, legTotalOffset, -1 * legHeight] )
		{
			translate( [0, 0, legInset] )
			{
				leg();
			}
		}
	}
	{
		combinedCutouts();
	}
}


// supportPlugs();




module supportPlugs()
{
	translate( [legTotalOffset, legTotalOffset, -0.1] )
	{
		translate( [(legPieceSelfOffset/3), (legPieceSelfOffset/3), legInset + 0.1] )
		{
			cylinder( d = m3HeadDiameter, h = 0.2);

			translate( [floorWidth - (legPieceSelfOffset/3) - (m3HeadDiameter/2) - 0.25, 0, 0] )
			{
				cylinder( d = m3HeadDiameter, h = 0.2);
			}

			translate( [0, floorLength  - (legPieceSelfOffset/3) - (m3HeadDiameter/2) - 0.25, 0] )
			{
				cylinder( d = m3HeadDiameter, h = 0.2);
			}

			translate( [floorWidth - (legPieceSelfOffset/3) - (m3HeadDiameter/2) - 0.25, floorLength  - (legPieceSelfOffset/3) - (m3HeadDiameter/2) - 0.25, 0] )
			{
				cylinder( d = m3HeadDiameter, h = 0.2);
			}

		}
	}
}

module combinedCutouts()
{
	union()
	{
		bodyCutout();
		translate( [legTotalOffset, legTotalOffset, -0.1] )
		{

			translate( [(legPieceSelfOffset/3), (legPieceSelfOffset/3), -30 + legSpacer + legInset + 0.1] )
			{
				rotate( [0, 0, 15] ) translate( [0, 0, 30 - legInset - 11] )
				{
					m3Nut();
					translate( [1.5, -2.8, 0] ) rotate( [0, 0, 30] ) cube( [m3NutDiameter, m3NutDiameter, m3NutDepth + 0.2] );
					translate( [0, 0, 30 - legInset - 11 - floorDepth - m3HeadHeight + 0.1] )
					{
						m3Head();
					}
				}
				m3ThroughHole( height = 30.1 );

				translate( [0, 0, (-1 * legHeight) + 47.9] ) rotate( [180, 0, 0] ) {
					rotate( [0, 0, -75] ) translate( [0, 0, 30 - legInset - 11] )
					{
						m3Nut();
						translate( [1.5, -2.8, 0] ) rotate( [0, 0, 30] ) cube( [m3NutDiameter, m3NutDiameter, m3NutDepth + 0.2] );
						translate( [0, 0, 30 - legInset - 11 - floorDepth - m3HeadHeight + 0.1] )
						{
							m3Head();
						}
					}
					m3ThroughHole( height = 30.1 );
				}
			}
			legCutout();

			translate( [floorWidth, 0, 0] )
			{
				translate( [(-1 * legPieceSelfOffset/3), (legPieceSelfOffset/3), -30 + legSpacer + legInset + 0.1] )
				{
					rotate( [0, 0, 105] ) translate( [0, 0, 30 - legInset - 11] )
					{
						m3Nut();
						translate( [1.5, -2.8, 0] ) rotate( [0, 0, 30] ) cube( [m3NutDiameter, m3NutDiameter, m3NutDepth + 0.2] );
						translate( [0, 0, 30 - legInset - 11 - floorDepth - m3HeadHeight + 0.1] )
						{
							m3Head();
						}
					}
					m3ThroughHole( height = 30.1 );
				}
				rotate( [0, 0, 90] ) legCutout();
			}

			translate( [0, floorLength, 0] )
			{
				translate( [(legPieceSelfOffset/3),  -1 * (legPieceSelfOffset/3), -30 + legSpacer + legInset + 0.1] )
				{
					rotate( [0, 0, -75] ) translate( [0, 0, 30 - legInset - 11] )
					{
						m3Nut();
						translate( [1.5, -2.8, 0] ) rotate( [0, 0, 30] ) cube( [m3NutDiameter, m3NutDiameter, m3NutDepth + 0.2] );
						translate( [0, 0, 30 - legInset - 11 - floorDepth - m3HeadHeight + 0.1] )
						{
							m3Head();
						}
					}
					m3ThroughHole( height = 30.1 );
				}
				rotate( [0, 0, -90] ) legCutout();
			}

			translate( [floorWidth, floorLength, 0] )
			{
				translate( [-1 * (legPieceSelfOffset/3),  -1 * (legPieceSelfOffset/3), -30 + legSpacer + legInset + 0.1] )
				{
					rotate( [0, 0, 195] ) translate( [0, 0, 30 - legInset - 11] )
					{
						m3Nut();
						translate( [1.5, -2.8, 0] ) rotate( [0, 0, 30] ) cube( [m3NutDiameter, m3NutDiameter, m3NutDepth + 0.2] );
						translate( [0, 0, 30 - legInset - 11 - floorDepth - m3HeadHeight + 0.1] )
						{
							m3Head();
						}
					}
					m3ThroughHole( height = 30.1 );
				}
				rotate( [0, 0, 180] ) legCutout();
			}
		}
	}
}

module legCutout()
{
	hull()
	{
		{

		}
		{
			union()
			{
				translate( [-1 * legTolerance, -1 * legTolerance, 0] ) cylinder( d = legDiameter, h = legInset + 0.1 );
				translate( [legPieceSelfOffset + (legTolerance * 2), -1 * legTolerance, 0] ) cylinder( d = legDiameter, h = legInset + 0.1 );
				translate( [-1 * legTolerance, legPieceSelfOffset + (legTolerance * 2), 0] ) cylinder( d = legDiameter, h = legInset + 0.1 );
			}
		}
	}

}

module leg()
{
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
						cylinder( d = legDiameter, h = legHeight );
						translate( [legPieceSelfOffset, 0, 0] ) cylinder( d = legDiameter, h = legHeight );
						translate( [0, legPieceSelfOffset, 0] ) cylinder( d = legDiameter, h = legHeight );
					}
				}
			}
		}
		{
			translate( [-5, -5, legHeight -1] ) cube( [20, 20, 5] );
		}
	}

}



module body()
{
	linear_extrude( height = (legInset + legSpacer + floorDepth) )
	{
		offset( r = (cornerDiameter/2) ) offset( delta = wallOffset ) square( size=[floorWidth, floorLength] );
	}
}

module bodyCutout()
{
	translate( [0, 0, (legInset + legSpacer)] )
	linear_extrude( height = (floorDepth + 0.1) )
	{
		square( size=[floorWidth, floorLength] );
	}
}


// An M3 head cutout
module m3Head()
{
    cylinder( d = m3HeadDiameter, h = m3HeadHeight );
}

// A through-hole for an M3 bolt
module m3ThroughHole( height )
{
	cylinder( d = m3ThroughHoleDiameter, h = height );
}

// A nut trap for an M3 bolt
module m3Nut()
{
    cylinder( d = m3NutDiameter, h = (m3NutDepth + 0.2), $fn = 6 );
}
