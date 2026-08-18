// this makes a solid object, but the idea is to print it hollow with 1 shell

// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

globeDiameter = 55;
// A: 0.8
// B: 0.95
// C: 1
rimDiameter = globeDiameter * 0.95;
rimHeight = (globeDiameter/2);

bottomCutoffAmount = 6;

boxWidth = 35;
boxHeight = 65;
edgeDiameter = 6;

rectangleConstruction();

module rectangleConstruction()
{
	difference()
	{
		{
			minkowski()
			{
				cube( [boxWidth, boxWidth, boxHeight] );
				sphere( edgeDiameter );
			}

		}
		{
			translate( [-1 * edgeDiameter, -1 * edgeDiameter, -1 * (edgeDiameter + 1)] ) cube( [(boxWidth + (edgeDiameter * 2)), (boxWidth + (edgeDiameter * 2)), edgeDiameter + 1] );
		}
	}
}

// Doesn't print so well
module globeConstruction()
{
	difference()
	{
		{
			union()
			{
				globe();
				rim();
			}
		}
		{
			translate( [-0.5 * globeDiameter, -0.5 * globeDiameter, -0.1] ) cube( [(globeDiameter * 1), (globeDiameter * 1), bottomCutoffAmount + 0.1] );
		}
	}
}

module rim()
{
	cylinder( d = rimDiameter, h = rimHeight );
}

module globe()
{

	translate( [0, 0, (globeDiameter/2)] ) sphere( d = globeDiameter );

}