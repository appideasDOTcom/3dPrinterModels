
use <fonts/Fascinate/Fascinate-Regular.ttf>
use <fonts/Oi/Oi-Regular.ttf>
use <fonts/Coiny/Coiny-Regular.ttf>
use <fonts/Chango/Chango-Regular.ttf>
use <fonts/Fredoka_One/FredokaOne-Regular.ttf>
use <fonts/Kavoon/Kavoon-Regular.ttf>
use <fonts/Luckiest_Guy/LuckiestGuy-Regular.ttf>
use <fonts/Notable/Notable-Regular.ttf>
use <fonts/Concert_One/ConcertOne-Regular.ttf>
use <fonts/Suez_One/SuezOne-Regular.ttf>
use <fonts/Akaya_Telivigala/AkayaTelivigala-Regular.ttf>
use <fonts/Righteous/Righteous-Regular.ttf>
use <fonts/Tinos/Tinos-Regular.ttf>
use <fonts/Tinos/Tinos-Bold.ttf>
use <fonts/Rokkitt/Rokkitt-VariableFont_wght.ttf>
use <fonts/Bungee/Bungee-Regular.ttf>
use <fonts/Bungee_Inline/BungeeInline-Regular.ttf>
use <fonts/Alfa_Slab_One/AlfaSlabOne-Regular.ttf>
use <fonts/banana-brick/BBrick.ttf>

// font = "Righteous";
// font = "Tinos:style=Bold";
// font = "Rokkitt:style=Black";
// font = "AlfaSlabOne";
font = "Banana Brick";

// magnetDiameter = 8.5;
magnetDiameter = 0;
// magnetDepth = 3.2;
magnetDepth = 0;
// font = "Oi";
// font = "Suez One";

// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

// fontSize = 52;
fontSize = 28;
// fontHeight = 7;
fontHeight = 12;

textMidpoint = 12.5;
indentXOffset = 2.5;
indentYOffset = 5;
indentDiameter= 3;
indentZOffset = 3.5;

lineHeight = fontSize + 10;

loopThickness = 6;
hookThickness = 4;

first_O();
// 2.2mm from letter to the left
translate( [27, 0, 0] ) S();

// makeText( 
// 	text = "ABCDEFGHIJK",
// 	fontSize = 20,
// 	fontHeight = 5
// );

// translate( [0, -30, 0] )
// makeText( 
// 	text = "LMNOPQRSTU",
// 	fontSize = 20,
// 	fontHeight = 5
// );

// translate( [0, -60, 0] )
// makeText( 
// 	text = "VWXYZ",
// 	fontSize = 20,
// 	fontHeight = 5
// );

module indent()
{
	hull()
	{
		{

		}
		{
			translate( [0, textMidpoint, (fontHeight/2)] )
			{
				translate( [0, indentYOffset, 0] ) sphere( d = indentDiameter );
				translate( [0, -1 * indentYOffset, 0] ) sphere( d = indentDiameter );

				translate( [-1 * indentXOffset, 2 * indentYOffset, indentZOffset] ) sphere( d = indentDiameter );
				translate( [-1 * indentXOffset, 2 * indentYOffset, -1 * indentZOffset] ) sphere( d = indentDiameter );

				translate( [-1 * indentXOffset, -2 * indentYOffset, indentZOffset] ) sphere( d = indentDiameter );
				translate( [-1 * indentXOffset, -2 * indentYOffset, -1 * indentZOffset] ) sphere( d = indentDiameter );
			}
		}
	}


	// #rotate( [-90, 0, 0] ) cylinder( d = 4, h = 25 );
}

module first_O()
{
	difference()
	{
		{
			makeText( 
				text = "O",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			// #translate( [indentXOffset + (indentDiameter/2) - 0.4, 0, 0] ) indent();
			translate( [23.5, 0, fontHeight] ) rotate( [0, 180, 0] ) indent();
		}
	}

	translate( [23.66, textMidpoint + (loopThickness/2), fontHeight/2] ) rotate( [90, 0, 0] )
	{
		loop();
	}


}

module S()
{
	difference()
	{
		{
			union()
			{
				{
					makeText( 
						text = "S",
						fontSize = fontSize,
						fontHeight = fontHeight
					);
				}
				translate( [-1.0, 0, fontHeight] ) rotate( [0, 180, 0] ) indent();
			}
		}
		{

			translate( [-3.3, textMidpoint + (loopThickness/2), fontHeight/2] ) rotate( [90, 0, 0] )
			{
				loopCoutout();
			}

		}
	}


}

module loopCoutout()
{
	translate( [0, 0, -1] )
	difference()
	{
		{
			cylinder( d = fontHeight, h = loopThickness + 2 );
		}
		{
			translate( [0, 0, 0-0.1] ) cylinder( d = fontHeight - 5, h = loopThickness + 2.2 );
		}
	}
}

module loop()
{
	difference()
	{
		{
			cylinder( d = fontHeight - 1.5, h = loopThickness );
		}
		{
			translate( [0, 0, -0.1] ) cylinder( d = fontHeight - 4, h = loopThickness + 0.2 );
		}
	}
}

module hook()
{
	// cylinder( d = fontHeight - 1.5, h = hookThickness );

	difference()
	{
		{
			cylinder( d = fontHeight - 1.5, h = hookThickness );
		}
		{
			translate( [0, 0, -0.1] ) cylinder( d = fontHeight - 4, h = hookThickness + 0.2 );
		}
	}
}




// translate( [0, -1 * lineHeight, 0] )
// difference()
// {
// 	{
// 			makeText( 
// 				text = "AYA1",
// 				fontSize = fontSize,
// 				fontHeight = fontHeight
// 			);
// 	}
// 	{
// 		union()
// 		{
// 			translate( [33.5, 30, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [66, 32, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [121.5, 32, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [171, 32, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 		}
// 	}
// }


// translate( [0, -2 * lineHeight, 0] )
// difference()
// {
// 	{
// 		makeText( 
// 			text = "23456",
// 			fontSize = fontSize,
// 			fontHeight = fontHeight
// 		);
// 	}
// 	{
// 		union()
// 		{
// 			translate( [27, 36, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [61.2, 36, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [95.7, 13, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [134, 13, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [169.8, 13, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 		}
// 	}
// }

// translate( [0, -3 * lineHeight, 0] )
// difference()
// {
// 	{
// 		makeText( 
// 			text = "789",
// 			fontSize = fontSize,
// 			fontHeight = fontHeight
// 		);
// 	}
// 	{
// 		union()
// 		{
// 			translate( [18, 42, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [63.5, 13, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 			translate( [77.8, 32, -0.1] ) cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
// 		}
// 	}
// }


module makeText( text = "hello", fontSize = 12, fontHeight = 3 )
{
	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( text, font = font, size = (fontSize * 1) );
	}
}