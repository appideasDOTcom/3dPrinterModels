// Render quality settings.
$fa = 1;
$fs = 0.1;

baseXY = 120;
baseHeight = 15;

cupXY = 100;
cupHeight = 120 - baseHeight;

wallDepth = 1.6;

insideXY = cupXY - wallDepth * 2;
insideOffset = (cupXY - insideXY) / 2;

constructed();
// fast_construction();

module fast_construction() {
	difference() {
		{
			import( "Silverware Strainer_Main Unit.stl" );
		}
		{
			union()
			{
				import( "Silverware Strainer_Cutout-01.stl" );
			}
			{
				import( "Silverware Strainer_Cutout-02.stl" );
			}
		}
	}
}

module constructed() {
	difference() {
		{
			mainUnit();
		}
		{
			union()
			{
				cutout();
			}
			{
				translate( [0, 0, 66] ) topCutout();
			}
		}
	}
}




module cutout() {

		for( cy=[0:5] ) {

			loopY = (cy * 17.2) + 2;

			translate( [2, loopY, -4.1] ) {

				for( cx=[0:5] ) {



						loopX = (cx * 17.2) + 5;
						translate( [loopX, 5, 0] ) {
							translate( [0, 0, 0] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
							translate( [0, 0, 38] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
						}
					if( cy == 0 || cy == 5 || cx == 0 || cx == 5 ) {
						translate( [loopX, 5, -5] ) {
							translate( [0, 0, 0] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
							translate( [0, 0, 38] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
						}
					}
				}
			}
		}
}

module topCutout() {

		for( cy=[0:5] ) {

			loopY = (cy * 17.2) + 2;

			translate( [2, loopY, -4.1] ) {

				for( cx=[0:5] ) {

					if( cy == 0 || cy == 5 || cx == 0 || cx == 5 ) {

						loopX = (cx * 17.2) + 5;
						translate( [loopX, 5, 0] ) {
							translate( [0, 0, 5] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
							translate( [0, 0, 38] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
						}
						translate( [loopX, 5, 0] ) {
							translate( [0, 0, 5] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
							translate( [0, 0, 38] ) scale( [0.8, 0.8, 2] ) sphere( 10 );
						}
					}
				}
			}
		}
}

module mainUnit() {
	difference() {
		{
			union() {
				// Base
				hull() {
					{
						translate( [wallDepth, wallDepth, 0] ) {
							cylinder( r=wallDepth, h=baseHeight );
						}
						translate( [baseXY - wallDepth, wallDepth, 0] ) {
							cylinder( r=wallDepth, h=baseHeight );
						}
						translate( [baseXY - wallDepth, baseXY - wallDepth, 0] ) {
							cylinder( r=wallDepth, h=baseHeight );
						}
						translate( [wallDepth, baseXY - wallDepth, 0] ) {
							cylinder( r=wallDepth, h=baseHeight );
						}
					}
					{

					}
				}

				// cup
				translate( [0, 0, baseHeight] ) {

					difference() {
						{

							hull() {
								{
									color("red") {
									translate( [wallDepth, wallDepth, 0] ) {
										cylinder( r=wallDepth, h=cupHeight );
									}
									translate( [cupXY - wallDepth, wallDepth, 0] ) {
										cylinder( r=wallDepth, h=cupHeight );
									}
									translate( [cupXY - wallDepth, cupXY - wallDepth, 0] ) {
										cylinder( r=wallDepth, h=cupHeight );
									}
									translate( [wallDepth, cupXY - wallDepth, 0] ) {
										cylinder( r=wallDepth, h=cupHeight );
									}
									}
								}
								{

								}
							}

						}
						{
							translate( [insideOffset, insideOffset, 0] ) {

								hull() {
									{
										translate( [wallDepth, wallDepth, 0] ) {
											cylinder( r=wallDepth, h=cupHeight + 1 );
										}
										translate( [cupXY - (wallDepth * 3), wallDepth, 0] ) {
											cylinder( r=wallDepth, h=cupHeight + 1 );
										}
										translate( [cupXY - (wallDepth * 3), cupXY - (wallDepth * 3), 0] ) {
											cylinder( r=wallDepth, h=cupHeight + 1 );
										}
										translate( [wallDepth, cupXY - (wallDepth * 3), 0] ) {
											cylinder( r=wallDepth, h=cupHeight + 1 );
										}
									}
									{

									}
								}
							}
						}
					}




				}
			}

		}

	}
}


