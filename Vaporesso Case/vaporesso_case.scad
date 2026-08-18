
$fa = 1;
$fs = 0.1;

// height = 35;
height = 73;
top = 77;

diff = top - height;

wallThickness = 1.8;
floorHeight = 1.2;
// floorHeight = 4;

usbCutoutWidth = 12;
usbCutoutHeight = 8.3;

screenCutoutWidth = 10;
screenCutoutHeight = 37;
screenCutoutZOffset = 19.5;

airCutoutWidth = 12;
airCutoutHeight = 6;
airCutoutZOffset = 62.1;

buttonCutoutWidth = 15;
buttonCutoutHeight = 10.5;
buttonCutoutZOffset = 50.3;

adjusterCutoutWidth = 15;
adjusterCutoutHeight = 6;
adjusterCutoutZOffset = 65.7;
//66.4


body();
// innerShape();



// #cube( [21.6, 30.7, 10] );

module body() {
	difference()
	{
		{
			union()
			{
				linear_extrude( height = height + floorHeight ) offset( r = wallThickness ) innerShape();
			}
		}
		{
			union()
			{
				translate( [0, 0, floorHeight] ) linear_extrude( height = height + 10 ) innerShape();
				translate( [4.8, 30.6, floorHeight] ) cube( [usbCutoutWidth, wallThickness + 2, usbCutoutHeight] );
				translate( [5.8, 30.6, screenCutoutZOffset + floorHeight] ) cube( [screenCutoutWidth, wallThickness + 2, screenCutoutHeight] );
				translate( [4.8, 30.6, airCutoutZOffset + floorHeight] ) cube( [airCutoutWidth, wallThickness + 2, airCutoutHeight] );
				translate( [4.8, (-2 * wallThickness) + 0.1, airCutoutZOffset + floorHeight] ) cube( [airCutoutWidth, wallThickness + 2, airCutoutHeight] );

				translate( [21, 8.0, buttonCutoutZOffset + floorHeight] )
				{
					// cube( [wallThickness + 2, buttonCutoutWidth, buttonCutoutHeight] );
					hull()
					{
						{

						}
						{
							union()
							{
								translate( [0, (buttonCutoutHeight/2), (buttonCutoutHeight/2)] ) rotate( [0, 90, 0] ) cylinder( d = buttonCutoutHeight, h = wallThickness + 2 );
								translate( [0, buttonCutoutWidth - (buttonCutoutHeight/2), (buttonCutoutHeight/2)] ) rotate( [0, 90, 0] ) cylinder( d = buttonCutoutHeight, h = wallThickness + 2 );
							}
						}
					}
				}
				translate( [-1 * wallThickness - 1, 8.0, adjusterCutoutZOffset + floorHeight] )
				{
					hull()
					{
						{

						}
						{
							union()
							{
								translate( [0, 0, 0] ) rotate( [0, 90, 0] ) cylinder( d = adjusterCutoutHeight, h = wallThickness + 2 );
								translate( [0, adjusterCutoutWidth, 0] ) rotate( [0, 90, 0] ) cylinder( d = adjusterCutoutHeight, h = wallThickness + 2 );
							}
						}
					}
				}

				// dadFloor();
				// momFloor();
				calebFloor();
			}
		}
	}
}

module innerShape() {

	// Too large, but would be great for something like a cupholder
	// scale( [1.108, 1.2202, 1] ) import( "vaporesso_shape.svg" );

	// Shape-fitting
	import( "vaporesso_shape.svg" );
	translate( [21.6, 0, 0] ) mirror( [1, 0, 0] ) import( "vaporesso_shape.svg" );
	translate( [0, 30.8, 0] ) mirror( [0, 1, 0] ) import( "vaporesso_shape.svg" );
	translate( [21.6, 30.8, 0] ) mirror( [0, 1, 0] ) mirror( [1, 0, 0] ) import( "vaporesso_shape.svg" );
	translate( [0.004, 12, 0] ) square( [3, 6] );
	translate( [18.592, 12, 0] ) square( [3, 6] );
}

module dadFloor() {
	translate( [3.2, 1.6, -1] ) mirror( [0, 1, 0] ) rotate( [0, 0, -90] ) makeText( "DAD", 14 );
}

module calebFloor() {
	translate( [3.2, 1.6, -1] ) mirror( [0, 1, 0] ) rotate( [0, 0, -90] ) makeText( "CAO", 14 );
}

module momFloor() {
	translate( [3.2, 1.6, -1] ) mirror( [0, 1, 0] ) rotate( [0, 0, -90] ) makeText( "DRE", 14 );
}

module makeText( input, fontSize )
{
	// use <fonts/BigShoulderStencilText-ExtraBold.ttf>
	font = "Big Shoulders Stencil Text:style=ExtraBold";
	fontHeight = floorHeight + 2;


	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( input, font = font, size = (fontSize * 1) );
	}
}