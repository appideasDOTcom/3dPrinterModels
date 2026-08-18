/**
 * A way to test the fit of nut and bolt print measurements
 *
 * 2019-09-03: costmo
 * https://github.com/appideasDOTcom/3dPrinterModels
 * https://appideas.com/blog
**/

// Render quality settings.
$fa = 3;
$fs = 0.2;

baseXDimension = 30;
baseYDimension = 30;
baseHeight = 1.0;

nutTrapHeight = 3;
nutTrapWidth = 1.6;


base();


module base()
{
    cube( [baseXDimension, baseYDimension, baseHeight] );
}

module m4()
{

}

module m5()
{

}

module makeText( input, fontSize, fontHeight )
{
	font = "monaco";

	linear_extrude( height = fontHeight, twist = 0, center = false )
	{
		text( input, font = font, size = (fontSize * 1) );
	}
}

