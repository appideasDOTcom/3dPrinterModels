// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;



insert_lowerDiameter = 8;
insert_lowerHeight = 11;

arm_height = 3.5;
arm_length = 34.0;
arm_width = 5;

insert_upperDiameter = 12.4;
insert_upperHeight = 2 + arm_height;
opening_thickness = 2;

fin_thickness = 1.5;
fin_height = 8;

platter_diameter = 330.5;


difference()
{
	mainUnit();
	platter();
}


module platter()
{
	translate( [(platter_diameter/2) - 15, (platter_diameter/2) - 35, -0.1] ) cylinder( d = platter_diameter, h = 10 );
}

module mainUnit()
{
	rotate( [0, 0, 45] )
	difference()
	{
		{
			union()
			{
				cylinder( d = insert_upperDiameter, h = insert_upperHeight );
				translate( [0, 0, insert_upperHeight] ) cylinder( d = insert_lowerDiameter, h = insert_lowerHeight );
				translate( [0, -1 * (arm_width/2), 0] ) cube( [arm_length, arm_width, arm_height] );
				rotate( [0, 0, 225] ) translate( [-1 * (fin_thickness/2), 0, 0] ) cube( [fin_thickness, (insert_upperDiameter/2), fin_height + opening_thickness] );
			}
		}
		{
				translate( [0, 0, opening_thickness] ) cylinder( d = insert_lowerDiameter - opening_thickness - 1, h = insert_lowerHeight + insert_upperHeight );
				translate( [0, -1 * (arm_width/2), 0] )
				{
					translate( [0, (opening_thickness/2), (opening_thickness/2)] ) cube( [arm_length * 2, arm_width - opening_thickness, arm_height] );
				}
				rotate( [0, 0, 45] ) translate( [-1 * (fin_thickness/2), 0, opening_thickness] ) cube( [fin_thickness, insert_upperDiameter, fin_height] );

		}
	}
}

