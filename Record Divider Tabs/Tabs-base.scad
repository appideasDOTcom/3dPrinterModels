// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

letter = "a";
font = "Open-Sans:style=Bold";

depth = 0.8;
length= 142;
height = 60;
roundness = 4;
letterHeight = 3.0;

armStretch = 3;
// armStretch = 5;
// armStretch = 9;

letterOffsetX = -13;
// letterOffsetX = -18;
// letterOffsetX = -19.5;

letterOffsetY = 4;
// letterOffsetY = 4.7;

construct();




module construct() {
	difference() {
		{
			union() {
				mainBody();
				color( "green" ) translate( [letterOffsetX, letterOffsetY, 0] ) makeText( text = letter, fontSize = 16, fontHeight = letterHeight );
				translate( [(-1*armStretch), 5, 0] ) linear_extrude( height = (letterHeight/1.5) ) square( size = [armStretch, 8] );
				// #translate( [-11.45, 11, 0] ) linear_extrude( height = (letterHeight/1.5) ) square( size = [3, 8] );
			}
		}
		{
			middleCutout();
		}
	}
}


module mainBody() {
	translate( [roundness, roundness, 0] ){
		linear_extrude( height = depth ) offset( r = roundness ) square( size = [length - (roundness*2), height - (roundness*2)] );
	}
}

module middleCutout() {
	translate( [(length/3) - (length/4) + (roundness*1.25), (height/2) - (height/4) - (roundness*1.25), -1] ) {
		linear_extrude( height = (depth+2) ) offset( r = roundness ) square( size = [length/1.33, height/1.5] );
	}
}

module makeText( text = "hello", fontSize = 12, fontHeight = 3 )
{
	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( text, font = font, size = (fontSize*1) );
	}
}