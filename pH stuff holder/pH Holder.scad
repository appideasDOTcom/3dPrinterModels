
$fa = 1;
$fs = 0.1;

constructedUnit();

meterCutoutXDimension = 31;
meterCutoutYDimension = 15;
meterCutoutZDimension = 25;

wallThickness = 2.4;
floorDepth = 2;

meterXDimension = meterCutoutXDimension + (wallThickness * 2);
meterYDimension = meterCutoutYDimension + (wallThickness * 2);
meterZDimension = meterCutoutZDimension + floorDepth;

cornerDiameter = 4;

bottleCutoutDiameter = 52;
bottleCutoutZDimension = meterCutoutZDimension;

bottleDiameter = bottleCutoutDiameter + (wallThickness * 2);
bottleZDimension = bottleCutoutZDimension + floorDepth;


module constructedUnit()
{
	union()
	{
		translate( [0, -1 * (meterYDimension/2), 0] ) pHMeterHolder();
		translate( [meterXDimension + (bottleDiameter/2) - wallThickness, 0, 0] ) bottleHolder();
		translate( [meterXDimension + (bottleDiameter * 1.5) - (wallThickness * 2), 0, 0] ) bottleHolder();
		translate( [meterXDimension + (bottleDiameter/2) - (wallThickness * 1.5), 0, 0] ) bottleConnector();
	}
}


module bottleConnector()
{
	difference()
	{
		{
			translate( [bottleDiameter/2, 0, 0] ) cylinder( d = bottleDiameter, h = floorDepth );
		}
		{
			union()
			{
				translate( [0, 0, -0.1] )
				{
					translate( [bottleDiameter/2, bottleDiameter/1.16, 0] ) cylinder( d = bottleDiameter, h = floorDepth + 0.2 );
					translate( [bottleDiameter/2, -1 * (bottleDiameter/1.16), 0] ) cylinder( d = bottleDiameter, h = floorDepth + 0.2 );
				}
			}
		}
	}
}



module bottleHolder()
{
	difference()
	{
		{
			cylinder( d = bottleDiameter, h = bottleZDimension  );
		}
		{
			translate( [0, 0, floorDepth] )
			{
				cylinder( d = bottleCutoutDiameter, h = bottleCutoutZDimension + 0.1  );
			}
		}
	}
}



module pHMeterHolder()
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
						translate( [(cornerDiameter/2), (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h =  meterZDimension);
						translate( [(cornerDiameter/2), meterYDimension - (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h =  meterZDimension);
						translate( [meterXDimension - (cornerDiameter/2), meterYDimension - (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h =  meterZDimension);
						translate( [meterXDimension - (cornerDiameter/2), (cornerDiameter/2), 0] ) cylinder( d = cornerDiameter, h =  meterZDimension);
					}
				}
			}

		}
		{
			translate( [wallThickness, wallThickness, floorDepth] )
			{
				cube( [meterCutoutXDimension, meterCutoutYDimension, meterCutoutZDimension + 0.1] );
			}
		}
	}
}

