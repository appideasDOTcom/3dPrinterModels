
$fa = 1;
$fs= 0.1;

outsideWallDiameter = 40;
insideWallDiameter = 35;
wallDepth = 3;
openingDistance = 3.3;
cornerDiameter = 4;

supportSize = 1.2;

// fullPiece();
// halfPiece();

sideBracket();

module sideBracket()
{
	difference()
	{
		{
			union()
			{
				halfPiece();
				translate( [-1 * (wallDepth/2), 0, wallDepth/2] )
				{
					rotate( [0, -90, 180] )
					{
						halfPiece();
					}
				}
				// internalSupports();
			}
		}
		{
			translate( [-1 * (outsideWallDiameter/2) - (wallDepth/2), -1 * (outsideWallDiameter/2) - 1, -1 * openingDistance] )
			{
				cube( [outsideWallDiameter/2, outsideWallDiameter + 2, openingDistance] );
			}
		}
	}


}

module internalSupports()
{
	translate( [-1 * openingDistance - (wallDepth/2), -0.4, -1 * (insideWallDiameter/2) + wallDepth - 0.7 + 0.3] ) rotate( [0, 90, 0] ) cube( [supportSize, supportSize, openingDistance] );

	translate( [-1 * openingDistance - (wallDepth/2), (insideWallDiameter/3), -10.3] ) rotate( [0, 90, 0] ) cube( [supportSize, supportSize, openingDistance] );
	translate( [-1 * openingDistance - (wallDepth/2), -1 * (insideWallDiameter/3) - supportSize, -10.3] ) rotate( [0, 90, 0] ) cube( [supportSize, supportSize, openingDistance] );

	translate( [-1 * openingDistance - (wallDepth/2), (insideWallDiameter/5.5), -13.7] ) rotate( [0, 90, 0] ) cube( [supportSize, supportSize, openingDistance] );

	translate( [-1 * openingDistance - (wallDepth/2), -1 * (insideWallDiameter/5.5) - supportSize, -13.7] ) rotate( [0, 90, 0] ) cube( [supportSize, supportSize, openingDistance] );


}

module halfPiece()
{
	difference()
	{
		{
			fullPiece();
		}
		{
			translate( [(wallDepth/2), -1 * ((outsideWallDiameter/2) + 1), -1 * (openingDistance + wallDepth + 1)] )
			{
				cube( [outsideWallDiameter + 2, outsideWallDiameter + 2, openingDistance + (wallDepth * 2) + 2] );
			}
		}
	}
}

module fullPiece()
{
	union()
	{
		cylinder( d = outsideWallDiameter, h = wallDepth );

		translate( [0, 0, -1 * (openingDistance + wallDepth)] )
		{
			cylinder( d = insideWallDiameter, h = wallDepth );
		}

		translate( [-1 * (wallDepth/2), -1 * (insideWallDiameter/2), -1 * openingDistance] )
		{
			cube( [wallDepth, insideWallDiameter, openingDistance] );
		}
	}
}