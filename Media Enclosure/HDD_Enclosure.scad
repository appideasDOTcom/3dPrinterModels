/**
Enclosure for two 3.5" SATA hard drives and a Raspberry Pi
This was designed to hold this Raspberry Pi case:
https://www.thingiverse.com/thing:922740

This could be used for anything that needs two 3.5" SATA drives 
connected through USB.

- costmo
- 2018-02-19
**/

// Choose which piece to render
// 0: SATA adapater enclosure
// 1: Drive rails
// 2: Case
// 3: Case, rotated for printing
// 4: Front cover
// 5: Front cover, rotated for printing
make = 2;

$fa = 4; // minimum angle -- use for final rendering
$fs = 0.5; // minumum size -- use for final rendering

wallThickness = 1.2; // Thickness of the walls
boltHoleDiameter = 4.0; // diameter of cutouts for bolts
adapterWidth = 13.6; // the width of the SATA adapter enclosure
adapterHeight = 23.1; // height of the SATA adapter enclosure
adapterLength = 72; // length of the SATA adapter
// "support structure" sits under part of the hard drives so they slide into the case flat
supportShaveX = 3.5; // take part of the support structure off so it fits the drive without overhang
spreadY = 41.4; // distance between bolt holes on a hard drive

caseLength = 146; // overall length

railGap = 52; // distance between the walls that support the HDDs (adjust this if your drives don't fit well in the case)
railWidth = 10; // width of HDD support rails
railHeight = 15; // height of HDD support rails
caseWidth = (railWidth * 2) + railGap; // overall width
// "support structure" dimensions
supportHeightBase = 1.8; // height of the base
supportHeight = supportHeightBase + wallThickness; // height of the top
supportWidth = 8; // width
supportLength = 12; // length
leftSupportOffset = 11.5; // X coordinate

caseHeight = (supportHeightBase * 2) + 104; // overall height

// openings in the lid for the SATA adapter
cutoutWidth = 45;
cutoutLength = 77.1;
cutoutOffsetX = 5;
supportWidth = 9;
extraTop = 6.4;

wallHeight = caseHeight - (railHeight); // height of a wall piece
piFloorThickness = 3; // 
coverThickness = 2.8; // how thick to make the lid/cover

spaceBetween = 11.8; // distance between the caps of the SATA adapter 

if( make == 0 )
{
    union()
    {
        {
            sataAdapter();
        }
        {
            translate( [(adapterWidth + (wallThickness * 2)) + spaceBetween, 0, 0] )
            {
                sataAdapter();
            }
        }
        {
            translate( [(adapterWidth + (wallThickness * 2)), 0, (adapterHeight - 0.4)] )
            {
                cube( [spaceBetween, (adapterLength + (wallThickness * 2)), wallThickness] );
            }
        }
    }      
}
else if( make == 1)
{
    driveRails();
}
else if( make == 2)
{
    difference()
    {
        {
            case();
        }
        {
            frontCoverBoltHoles();
        }
    }
}
else if( make == 3)
{
    translate( [0, 0, (caseLength + wallThickness)] )
    {
        rotate( a = 270, v = [1, 0, 0] )
        {
            difference()
            {
                {
                    case();
                }
                {
                    frontCoverBoltHoles();
                }
            }
        }
    }
}
else if( make == 4)
{
    color( "green" )
    { 
        case(); 
    }
    frontCover();
}
else if( make == 5)
{
    difference()
    {
        {
            translate( [0, 0, coverThickness] )
            {
                rotate( a = 90, v = [1, 0, 0] )
                {
                    frontCover();
                }
            }
        }
        /* // uncomment for printing a short prototype
        {
            translate( [-20, -150, 0.6] )
            {
                cube( [200, 200, 200] );
            }
        }
        */
    }    
}

module frontCover()
{
    supportOffsetX = 23.5;
    supportThickness = coverThickness - 1.4;
    
    union()
    {
        {
            difference()
            {
                {
                    translate( [(-1 * leftSupportOffset), (-1 * coverThickness), 0] )
                    {
                        cube( [ (leftSupportOffset + caseWidth), coverThickness, (caseHeight + (wallThickness * 2))] );
                    }       
                }
                {
                    frontCoverBoltHoles();
                }
                {
                    adapterCutouts();
                }
                
            }
        }
        {
            translate( [supportOffsetX, (-1 * coverThickness), (caseHeight + (wallThickness * 2)) - (cutoutLength - 0.1)] )
            {
                cube( [supportWidth, supportThickness, cutoutLength] );
            }
        }
        {
            hull()
            {
                {
                    translate( [(-1 * leftSupportOffset) + 10, (-1 * coverThickness), (caseHeight + (wallThickness * 2))] )
                    {
                        cube( [(leftSupportOffset + caseWidth) - 20, coverThickness, extraTop - 1.1] );
                    }
                }
                {
                    topHull(); 
                }
            }
                    
   
            
        }
    }
    
}

module topHull()
{
    union()
    {
        {
            translate( [(-1 * leftSupportOffset) + 10, (-1 * coverThickness) + (coverThickness / 2), (caseHeight + (wallThickness * 2)) + extraTop - (coverThickness / 2)] )
            {
                sphere( d = coverThickness );
            }
        }
        {
            translate( [(-1 * leftSupportOffset) + 7.5 - (coverThickness / 2) + ((leftSupportOffset + caseWidth) - 15), (-1 * coverThickness), (caseHeight + (wallThickness * 2))] )
            {
                cube( [coverThickness, coverThickness, coverThickness] );
            }
        }
        {
            translate( [(-1 * leftSupportOffset) + 7.5 - (coverThickness / 2), (-1 * coverThickness), (caseHeight + (wallThickness * 2))] )
            {
                cube( [coverThickness, coverThickness, coverThickness] );
            }
        }
        {
            translate( [(-1 * leftSupportOffset) + 5 + ((leftSupportOffset + caseWidth) - 15), (-1 * coverThickness) + (coverThickness / 2), (caseHeight + (wallThickness * 2)) + extraTop - (coverThickness / 2)] )
            {
                sphere( d = coverThickness );
            }
        }
    }
}

module adapterCutouts()
{
    translate( [cutoutOffsetX, -5, (caseHeight + (wallThickness * 2)) - (cutoutLength - 0.1)] )
    {
        cube( [cutoutWidth, 10, cutoutLength] );
    }
}

module frontCoverBoltHoles()
{
    boltHoleDiameter = 3;
    
    boltLeftX = -6;
    boltTopZ = 100;
    
    boltRightX = 67.5;
    boltBottomZ = 10;
    boltOffsetY = 7;
    
    union()
    {
        {
            translate( [boltLeftX, boltOffsetY, boltTopZ] )
            {
                rotate( a = 90, v = [1, 0, 0] )
                {
                    cylinder( d = boltHoleDiameter, h = 15 );
                }
            }
        }
        {
            translate( [boltRightX, boltOffsetY, boltTopZ] )
            {
                rotate( a = 90, v = [1, 0, 0] )
                {
                    cylinder( d = boltHoleDiameter, h = 15 );
                }
            }
        }
        {
            translate( [boltLeftX, boltOffsetY, boltBottomZ] )
            {
                rotate( a = 90, v = [1, 0, 0] )
                {
                    cylinder( d = boltHoleDiameter, h = 15 );
                }
            }
        }
        {
            translate( [boltRightX, boltOffsetY, boltBottomZ] )
            {
                rotate( a = 90, v = [1, 0, 0] )
                {
                    cylinder( d = boltHoleDiameter, h = 15 );
                }
            }
        }
    }
}

module case()
{
    difference()
    {
        {
            union()
            {
                { // bottom floor
                    cube( [caseWidth, (caseLength + wallThickness), wallThickness] );
                }
                { // left retainer rail
                    difference()
                    {
                        {
                            union()
                            {
                                {
                                    translate( [0, 0, wallThickness] )
                                    {
                                        // shave 1 mm off of one rail so the drives fit better
                                        cube( [(railWidth - 1), caseLength, railHeight] );
                                    }
                                }
                                {
                                    translate( [(-1 * leftSupportOffset), 0, 0] )
                                    {
                                        cube( [leftSupportOffset, (caseLength + wallThickness), (wallHeight + railHeight + (wallThickness * 2))] );
                                    }
                                }
                            }
                        }
                        {
                            translate( [130, 0, -20] )
                            {
                                rotate( a = 90, v = [0, 0, 1] )
                                {
                                    fanGrillCutouts();
                                }
                            }
                        }
                    }
                }
                { // right retainer rail
                    difference()
                    {
                        {
                            union()
                            {
                                {
                                    translate( [(railGap + railWidth), 0, wallThickness] )
                                    {
                                        cube( [railWidth, (caseLength + wallThickness), railHeight] );
                                    }
                                }
                                {
                                    translate( [(railGap + railWidth), 0, (wallThickness + railHeight)] )
                                    {
                                        cube( [railWidth, (caseLength + wallThickness), (wallHeight + wallThickness)] );
                                    }
                                }
                            }
                        }
                        {
                            fanGrillCutouts();
                        }
                               
                    }

                }
                {
                    // support for far side under drives
                    translate( [(railWidth + 5), (caseLength - supportLength), wallThickness] )
                    {
                        driveSupport();
                    }
                    translate( [(caseWidth - (railWidth + (supportWidth + 5))), (caseLength - supportLength), wallThickness] )
                    {
                        driveSupport();
                    }
                }
                { // back wall
                    difference()
                    {
                        {
                            translate( [0, caseLength, wallThickness] )
                            {
                                cube( [(caseWidth - piFloorThickness), wallThickness, caseHeight] );
                            }
                        }
                        {
                            fanGrillCutouts();
                        }
                        { // make a hole through which wires may pass for a fan
                            translate( [6, (caseLength + 5), 90] )
                            {
                                rotate( a = 90, v = [1, 0, 0] )
                                {
                                    cylinder( d = 4, h = 15 );
                                }
                            }
                        }
                    }

                }
                { // top
                    difference()
                    {
                        {
                            translate( [0, 0, (caseHeight + wallThickness)] )
                            {
                                cube( [(caseWidth - piFloorThickness), (caseLength + wallThickness), wallThickness] );
                            }
                        }
                        { // make a hole through which wires may pass for a fan
                            translate( [6, 73, 100] )
                            {
                                cylinder( d = 4, h = 15 );
                            }
                        }
                    }
                }
            } // end union
        }
      {
        piBottomBoltCutouts();
      }  
      
  } // end difference


 }
 
 module fanGrillCutouts()
 {
    holeDiameter = 3;
    openingDiameter = 7;
     
    farX = 66.8;
    nearX = farX - 40;
     
    holeTopZ = 95;
    holeBottomZ = holeTopZ - 40;
     
    translate( [-1.6, 0, 0] )
    {
        translate( [farX, (caseLength + 5), holeTopZ] )
        {
            rotate( a = 90, v = [1, 0, 0] )
            {
                cylinder( d = holeDiameter, h = 30 );
            }
        }
        translate( [nearX, (caseLength + 5), holeTopZ] )
        {
            rotate( a = 90, v = [1, 0, 0] )
            {
                cylinder( d = holeDiameter, h = 30 );
            }
        }
        translate( [farX, (caseLength + 5), holeBottomZ] )
        {
            rotate( a = 90, v = [1, 0, 0] )
            {
                cylinder( d = holeDiameter, h = 30 );
            }
        }
        translate( [nearX, (caseLength + 5), holeBottomZ] )
        {
            rotate( a = 90, v = [1, 0, 0] )
            {
                cylinder( d = holeDiameter, h = 30 );
            }
        }
        
        xGap = 9;
        baseZ = holeBottomZ + 6.2; //46;
        baseX = 60;
        
        for( i = [0:3])
        {
            currentZ = baseZ + (xGap * i);
            
            for( j = [0:3] )
            {
                currentX = baseX - (xGap * j);
                translate( [currentX, (caseLength + 5), currentZ] )
                {
                    rotate( a = 90, v = [1, 0, 0] )
                    {
                        cylinder( d = openingDiameter, h = 30 );
                    }
                }
                
            }
        }
    }
    
    
 } // end case()
 
 module piBottom()
 {
    //translate( [caseWidth - piFloorThickness, 96.3, (caseHeight + (wallThickness * 2))] )
    translate( [-11.5, 0, (caseHeight + (wallThickness * 2))] )
    {
        rotate( a = 0, v = [0, 0, 1] )
        {
            import( "pi-case_bottom.stl" );
        }
    }
 }
 
 module piBottomBoltCutouts()
 {
    holeDiameter = 3;
    translate( [-7, 12.8, 95.4] )
    {
        rotate( a = 0, v = [0, 1, 0] )
        {
            cylinder( d = holeDiameter, h = 30 );
        }
    }
    translate( [-7, 87.8, 95.4] )
    {
        rotate( a = 0, v = [0, 1, 0] )
        {
            cylinder( d = holeDiameter, h = 30 );
        }
    }
    translate( [caseWidth - 4, 12.8, 95.4] )
    {
        rotate( a = 0, v = [0, 1, 0] )
        {
            cylinder( d = holeDiameter, h = 30 );
        }
    }
    translate( [caseWidth - 4, 87.8, 95.4] )
    {
        rotate( a = 0, v = [0, 1, 0] )
        {
            cylinder( d = holeDiameter, h = 30 );
        }
    }
 }
 
module driveSupport()
{
    difference()
    {
        {
            cube( [supportWidth, supportLength, supportHeight] );
        }
        {
            rotate( a = 23, v = [1, 0, 0] )
            {
                translate( [-0.1, 0, 0] )
                {
                    cube( [(supportWidth + 0.2), (supportWidth + 1), supportHeight] );
                }
            }
        }
    }
    
    
            
}


module driveRails()
{
    railGap = 2;
    railGapHeight = 10;
    boltHoleExtraX = 11.3; // straight version, allowing for hard drives to be oriented the same way
    //boltHoleExtraX = 0; // parametric version - requires drives to be attached in a different orientation
    
    union()
    {
        {
            oneDriveRail();
        }
        {
            translate( [(-1 * railGap), 0, 0 ] )
            {
                cube( [railGap, (spreadY + 10), railGapHeight] );
            }
        }
        {
            translate( [(-1 * (railGap + boltHoleExtraX)), 0, wallThickness ] )
            {
                rotate( a = 180, v = [0, 1, 0] )
                {
                    oneDriveRail();
                }
            }
        }
        {
            translate( [(-1 * (boltHoleExtraX + railGap)), 0, 0] )
            {
                cube( [boltHoleExtraX, (spreadY + 10), wallThickness] );
            }
        }
    }
    
    
                        
}

module oneDriveRail()
{
    difference()
    {
        {
            cube( [(adapterWidth + (wallThickness * 2)) - supportShaveX, (spreadY + 10), wallThickness] );
        }
        {
            //translate( [(((adapterWidth + (wallThickness * 2)) - supportShaveX) / 2), 5, -0.1 ] )
            translate( [6.8, 5, -0.1 ] )
            {
                cylinder( d = boltHoleDiameter, h = wallThickness + 0.2);
                translate( [0, spreadY, 0] )
                {
                    cylinder( d = boltHoleDiameter, h = wallThickness + 0.2);
                }
            }

        }
    }
}

module sataAdapter()
{
    // cutout for the power adapter
    powerDiameter = 10.4;
    powerOffsetY = (powerDiameter / 2) + wallThickness + 0.6;
    powerOffsetX = ((adapterWidth + (wallThickness * 2)) / 2);
    
    // cutout for the USB cable
    usbOffsetX = wallThickness + 0.6;
    usbOffsetY = 29.7;
    usbWidth = 19;
    usbHeight = 9;
    
    // boltHoleOffsetX = (adapterWidth + wallThickness - 5.6);
    boltHoleOffsetX = (wallThickness + 5.6);
    boltHoleOffsetY = (adapterLength + (wallThickness * 2));
    boltHoleOffsetZ = wallThickness + 51.5;
    
    difference()
    {
        { // The outer structure
            union()
            {
                {
                    cube( [(adapterWidth + (wallThickness * 2)), (adapterLength + (wallThickness * 2)), (adapterHeight + wallThickness)] );
                }
                { // extend the wall to make a hole that can bolt into a hard drive
                    /*
                    translate( [0, boltHoleOffsetY - wallThickness, 0] )
                    {
                        cube( [(adapterWidth + (wallThickness * 2)) - supportShaveX, wallThickness, boltHoleOffsetZ + 10] );
                    }
                    */
                }
            }
        }
        { // Cutout for the SATA-USB adapter
    
            translate( [wallThickness, wallThickness, wallThickness] )
            {
                cube( [adapterWidth, adapterLength, (adapterHeight + 0.1)] );
            }
        }
        { // Cutout for power adapter
            translate( [powerOffsetX, powerOffsetY, -0.1] )
            {
                cylinder( d = powerDiameter, h = (wallThickness + 0.2) );
            }
        }
        { // cutout for USB cable
            translate( [usbOffsetX, usbOffsetY, -0.1] )
            {
                cube( [usbHeight, usbWidth, (wallThickness + 0.2)] );
            }
        }
        { // a cutout to bolt into the hard drive
            translate( [boltHoleOffsetX, boltHoleOffsetY + 0.1, boltHoleOffsetZ] )
            {
                rotate( a = 90, v = [1, 0, 0] )
                {
                    cylinder( d = boltHoleDiameter, h = (wallThickness + 0.2) );
                }
            }
        }
    }
}
