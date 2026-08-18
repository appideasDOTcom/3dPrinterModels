// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

postDiameter = 3.5;
postHeight = 1.2;

bodyHeight = 6.0;
bodyLength = 15;
bodyWidth = 5.4;

orientToPrint = true;

if( orientToPrint )
{
	rotate( [180, 0, 0] ) render();
}
else
{
	render();
}


module render()
{
	difference()
	{
		{
			union()
			{
				hull()
				{
					{
						cube( [bodyLength, bodyWidth, bodyHeight] );
					}
					{
						translate( [0, (bodyWidth/2), 0] ) cylinder( d = postDiameter, h = bodyHeight );
					}
				}
				translate( [0, (bodyWidth/2), -1 * postHeight] ) sphere( d = postDiameter );
			}
		}
		{
			translate( [bodyLength, bodyWidth/2, -0.1] ) cylinder( d = bodyWidth + 0.5, h = bodyHeight + 0.2 );
		}
	}

	translate( [0, (bodyWidth/2), -1 * postHeight] ) cylinder( d = postDiameter, h = postHeight );
}
