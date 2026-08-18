
// use <fonts/Fascinate/Fascinate-Regular.ttf>
// use <fonts/Oi/Oi-Regular.ttf>
// use <fonts/Coiny/Coiny-Regular.ttf>
// use <fonts/Chango/Chango-Regular.ttf>
// use <fonts/Fredoka_One/FredokaOne-Regular.ttf>
// use <fonts/Kavoon/Kavoon-Regular.ttf>
// use <fonts/Luckiest_Guy/LuckiestGuy-Regular.ttf>
// use <fonts/Notable/Notable-Regular.ttf>
// use <fonts/Concert_One/ConcertOne-Regular.ttf>
// use <fonts/Suez_One/SuezOne-Regular.ttf>
// use <fonts/Akaya_Telivigala/AkayaTelivigala-Regular.ttf>
// use <fonts/Righteous/Righteous-Regular.ttf>
use <fonts/Tinos/Tinos-Regular.ttf>
use <fonts/Tinos/Tinos-Bold.ttf>
use <fonts/Rokkitt/Rokkitt-VariableFont_wght.ttf>

// font = "Righteous";
// font = "Tinos:style=Bold";
font = "Rokkitt:style=Black";

magnetDiameter = 6.4;
magnetDepth = 3.2;
// font = "Oi";
// font = "Suez One";

// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

fontSize = 38;
fontHeight = 8;

lineHeightBuffer = -2;
lineHeight = fontSize + lineHeightBuffer;
lineHeightOffset = lineHeightBuffer + 7;

// alphabet_01();
alphabet_02();

module alphabet_02()
{
	translate( [0, (-1 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "WZAAE",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [15, 6, -0.1] ) 	magentCutout();
				translate( [63, 16, -0.1] ) 	magentCutout();
				translate( [86.5, 6, -0.1] ) 	magentCutout();
				translate( [146, 6, -0.1] ) 	magentCutout();
				translate( [166, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-2 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "EIIOOU",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [11, 16, -0.1] ) 	magentCutout();
				translate( [45.5, 16, -0.1] ) 	magentCutout();
				translate( [66, 16, -0.1] ) 	magentCutout();
				translate( [83.5, 16, -0.1] ) magentCutout();
				translate( [121.5, 16, -0.1] ) magentCutout();
				translate( [161.5, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-3 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "URRTT",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [9.5, 16, -0.1] ) 	magentCutout();
				translate( [46.5, 16, -0.1] ) 	magentCutout();
				translate( [84, 16, -0.1] ) 	magentCutout();
				translate( [129.5, 16, -0.1] ) 	magentCutout();
				translate( [164, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-4 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "NNSSL",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [20.5, 16, -0.1] ) 	magentCutout();
				translate( [60, 16, -0.1] ) 	magentCutout();
				translate( [87, 22, -0.1] ) 	magentCutout();
				translate( [119, 22, -0.1] ) 	magentCutout();
				translate( [152.5, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-5 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "LCCM0",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [11, 16, -0.1] ) 	magentCutout();
				translate( [37.5, 16, -0.1] ) 	magentCutout();
				translate( [75, 16, -0.1] ) 	magentCutout();
				translate( [117, 25, -0.1] ) 	magentCutout();
				translate( [160, 16, -0.1] ) 	magentCutout();
			}
		}
	}
}

module alphabet_01()
{
	translate( [0, (-1 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "ABCDE",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [11.5, 14, -0.1] ) 	magentCutout();
				translate( [49, 16, -0.1] ) 	magentCutout();
				translate( [81, 16, -0.1] ) 	magentCutout();
				translate( [144, 16, -0.1] ) 	magentCutout();
				translate( [160.5, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-2 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "FGHIJK",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [10.5, 16, -0.1] ) 	magentCutout();
				translate( [40, 16, -0.1] ) 	magentCutout();
				translate( [81.5, 16, -0.1] ) 	magentCutout();
				translate( [121, 16, -0.1] ) 	magentCutout();
				translate( [143, 16, -0.1] ) 	magentCutout();
				translate( [162.5, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-3 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "LMN  O",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [10.5, 16, -0.1] ) 	magentCutout();
				translate( [39.5, 16, -0.1] ) 	magentCutout();
				translate( [99, 16, -0.1] ) 	magentCutout();
				translate( [158, 16, -0.1] ) magentCutout();
			}
		}
	}

	translate( [0, (-4 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "PQRST",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [10.5, 16, -0.1] ) 	magentCutout();
				translate( [41, 16, -0.1] ) 	magentCutout();
				translate( [82, 16, -0.1] ) 	magentCutout();
				translate( [125, 16, -0.1] ) 	magentCutout();
				translate( [158.5, 16, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, (-5 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "U  XVY",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [10.5, 16, -0.1] ) 	magentCutout();
				translate( [87, 16, -0.1] ) 	magentCutout();
				translate( [124.5, 6, -0.1] ) 	magentCutout();
				translate( [159, 6, -0.1] ) 	magentCutout();
			}
		}
	}
}

module melaya_01() 
{
	translate( [0, (-1 * lineHeight) + lineHeightOffset, 0] )
	difference()
	{
		{
			makeText( 
				text = "MELAY",
				fontSize = fontSize,
				fontHeight = fontHeight
			);
		}
		{
			union()
			{
				translate( [12, 26, -0.1] ) 	magentCutout();
				translate( [58.5, 24, -0.1] ) 	magentCutout();
				translate( [93.5, 24, -0.1] ) 	magentCutout();
				translate( [141, 12, -0.1] ) 	magentCutout();
				translate( [169.5, 12, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, -2 * lineHeight + lineHeightOffset, 0] )
	difference()
	{
		{
				makeText( 
					text = "A01234",
					fontSize = fontSize,
					fontHeight = fontHeight
				);
		}
		{
			union()
			{
				translate( [28.5, 12, -0.1] ) 	magentCutout();
				translate( [45, 16, -0.1] ) 	magentCutout();
				translate( [81, 16, -0.1] ) 	magentCutout();
				translate( [113, 24, -0.1] ) 	magentCutout();
				translate( [142.5, 24, -0.1] ) 	magentCutout();
				translate( [171.5, 24, -0.1] ) 	magentCutout();
			}
		}
	}

	translate( [0, -3 * lineHeight + lineHeightOffset, 0] )
	difference()
	{
		{
				makeText( 
					text = "56789",
					fontSize = fontSize,
					fontHeight = fontHeight
				);
		}
		{
			union()
			{
				translate( [23.5, 12, -0.1] ) 	magentCutout();
				translate( [53.5, 12, -0.1] ) 	magentCutout();
				translate( [76, 12, -0.1] ) 	magentCutout();
				translate( [111, 9, -0.1] ) 	magentCutout();
				translate( [140.5, 21, -0.1] ) 	magentCutout();
			}
		}
	}
}




module magentCutout()
{
	cylinder( d = magnetDiameter, h = magnetDepth + 0.1 );
}


module makeText( text = "hello", fontSize = 12, fontHeight = 3 )
{
	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( text, font = font, size = (fontSize * 1) );
	}
}