// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

cornerRadius = 2;
wallDepth = 2.8;
wallOffset = (wallDepth - cornerRadius);

openingWidth = 30.5;
openingDepth = 25.5;
openingHeight = 25;

holeDiameter = 4;

mainBody();
back();

module back()
{
	translate( [(openingWidth/2) + (wallOffset/2), wallOffset/2, openingHeight] ) rotate( [90, 0, 0] )
	difference()
	{
		{
			union()
			{
				cylinder( d = openingWidth, h = wallDepth - 0.4 );
			}
		}
		{
			union()
			{
				translate( [0, (openingDepth/5), -1] ) cylinder( d = holeDiameter, h = wallDepth * 2 );
			}
		}
	}
}

module mainBody()
{
	difference()
	{
		{
			hull()
			{
				{
					union()
					{
						translate( [0, openingDepth + (wallOffset*2), 0] ) cylinder( d = wallDepth, h = openingHeight );
						translate( [openingWidth + wallOffset, openingDepth + (wallOffset*2), 0] ) cylinder( d = wallDepth, h = openingHeight );
						linear_extrude( height = openingHeight )offset( r = cornerRadius ) square( [(openingWidth + wallOffset), (openingDepth + wallOffset)] );
					}
				}
				{
					translate( [0, 0, 5.85] )
					rotate( [-12, 0, 0] )
					{
						translate( [0, openingDepth + (wallOffset*2), 0] ) cylinder( d = wallDepth, h = openingHeight );
						translate( [openingWidth + wallOffset, openingDepth + (wallOffset*2), 0] ) cylinder( d = wallDepth, h = openingHeight );
					}
				}
			}
		}
		{ // difference
			translate( [(wallOffset/2), (wallOffset/2), -1] ) linear_extrude( height = openingHeight + 2 ) square( [openingWidth, openingDepth] );
		}
	}











}



