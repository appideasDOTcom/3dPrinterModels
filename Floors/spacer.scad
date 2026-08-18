// Minimum render angle
$fa = 1;
// Minimum render size
$fs = 0.1;

w = 50;
h = 40;
d = 0.8;

handleWidth = (w - 16);
handleHeight = 4;
handleDepth = 1.2;
handleOffset = 4;

construction();

module construction() {
	union() {
		{
			mainUnit();
		}
		{
			handle();
		}
	}
}

module mainUnit() {
	hull() {
		{

		}
		{
			union() {
				translate( [handleDepth/2, handleDepth/2, 0] ) cylinder( r=handleDepth/2, h=d );
				translate( [(handleDepth/2) + (w - handleDepth), handleDepth/2, 0] ) cylinder( r=handleDepth/2, h=d );
				translate( [handleDepth/2, handleDepth/2  + (h - handleDepth), 0] ) cylinder( r=handleDepth/2, h=d );
				translate( [(handleDepth/2) + (w - handleDepth), handleDepth/2  + (h - handleDepth), 0] ) cylinder( r=handleDepth/2, h=d );
			}
		}
	}
}


module handle() {
	// add the handle
	translate( [(w/2) - (handleWidth/2), handleOffset, 0] )
	{
		hull()
		{
			{

			}
			{
				union() {
					translate( [0, handleDepth/2, handleHeight/2] ) cylinder( r=handleDepth/2, h=handleHeight, center=true );
					translate( [handleWidth, handleDepth/2, handleHeight/2] ) cylinder( r=handleDepth/2, h=handleHeight, center=true );
				}
			}

		}

	}
}

