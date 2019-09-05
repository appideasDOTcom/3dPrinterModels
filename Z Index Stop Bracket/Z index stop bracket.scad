//!OpenSCAD

// This code originated in blockscad3D, and I haven't taken the time to refactor it to be easier to manipulate other than to
//   add a few variables to the top to adjust the output more easily (without changing code)

// Add length to the arm, making the limit switch further away from the center
extraLength = 0;
// extraLength = 5;

// Add some girth to the arm to make it less likely to break
extraThickness = 0;
// extraThickness = 1;

// Add height to the shelf risers to hold the unit in place more firmly
// extraShelfHeight = 0;
extraShelfHeight = 0.6;

// Add some space to the valley between the shelf risers for tolerance
// extraGulfWidth = 0;
extraGulfWidth = 0.2;

// Whether or not the nut trap should be rendered
renderNutTrap = true;

// Determine the side of the piece that contains the nut trap. Set to false for "left"
nutTrapRight = true;

// Turn bolt cutouts into a module so they can be reused
module boltCutouts()
{
      // Bolt cutouts
      union(){
        translate([(45.3 + extraLength), 0, 15.1]){
          rotate([90, 0, 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=1.8, r2=1.8, h=10, center=false);
            }
          }
        }
        translate([(26.8 + extraLength), 0, 15.1]){
          rotate([90, 0, 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=1.8, r2=1.8, h=10, center=false);
            }
          }
        }
        translate([-10, 10, 5]){
          rotate([90, 0, 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=2.1, r2=2.1, h=20, center=false);

              if( renderNutTrap )
              {
                if( nutTrapRight )
                {
                  nutTrap( 16 );
                }
                else
                {
                  nutTrap( 2.5 );
                }
              }
            }
          }
        }
      }
}

module nutTrap( wallOffset )
{
  translate( [0, 0, (wallOffset - 1.5)] )
  {
    cylinder(h = 4.5, r = 4.1, $fn=6);
  }
}

// Create an "S" shaped curve for model strength on what would otherwise be a corner
module essCurve( d, h )
{
  xDimension = d;
  yDimension = d;
  zDimension = h;

  difference()
    {
      {
        translate( [(-1 * (xDimension / 2)), (-1 * (yDimension / 2)), 0] )
        {
          cube( [xDimension, yDimension, zDimension] );
        }
      }
      {
        translate( [ 0, 0, -1 ] )
        {
          cube( [xDimension, yDimension, (zDimension + 2)] );

          translate( [0, (-1 * yDimension), 0] )
          {
            cube( [xDimension, yDimension, (zDimension + 2)] );
          }
          translate( [(-1 * xDimension), 0, 0] )
          {
            cube( [xDimension, yDimension, (zDimension + 2)] );
          }

          linear_extrude( height=(zDimension + 2), twist=0, scale=[1, 1], center=false)
          {
            $fn=64;    //set sides to 64
            circle(r=(xDimension / 2));
          }
          
        }

      }
    
  }
}

union(){
  difference() {
    // Main body with cutouts
    difference() {
      // Main body
      translate([-15.5, -6, 0]){
        cube([(64.3 + extraLength), 12, 17.6], center=false);
      }

      // Rod cutout
      union(){
        {
          $fn=64;    //set sides to 64
          cylinder(r1=4, r2=4, h=17.6, center=false);
        }
        translate([-15.5, -3, 0]){
        cube([15.5, 6, 17.6], center=false);
        }
      }
      // Inside cutout
      translate([8, (-2 + extraThickness), 0]){
        cube([(40.8 + extraLength), 12, 17.6], center=false);
      }
      
      boltCutouts();

      translate([-15.5, -6, 10]){
        cube([23.5, 20, 7.6], center=false);
      }
      translate([8, -8, 10]){
        rotate([0, 330, 0]){
          cube([30, 10, 10], center=false);
        }
      }
    }

    translate([-2, (-2 + extraThickness), 0]){
      cube([10, 10, 10], center=false);
    }
  }

  // Component shelf
  union(){
    hull(){
      translate([9, -18, 0]){
        cube([(37.8 + extraLength), 12, 1], center=false);
      }
      union(){
        translate([(46.8 + extraLength), -17, 0]){
          linear_extrude( height=1, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, -17, 0]){
          linear_extrude( height=1, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([(46.8 + extraLength), -7, 0]){
          linear_extrude( height=1, twist=0, scale=[1, 1], center=false){
            square([1, 1], center=false);
          }
        }
        translate([8, -7, 0]){
          linear_extrude( height=1, twist=0, scale=[1, 1], center=false){
            square([1, 1], center=false);
          }
        }
      }
    }
    hull(){
      translate([9, -9.6, 1]){
        cube([(37.8 + extraLength), 3.6, (2 + extraShelfHeight)], center=false);
      }
      union(){
        translate([(46.8 + extraLength), -8.6, 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, -8.6, 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([(46.8 + extraLength), -7, 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            square([1, 1], center=false);
          }
        }
        translate([8, -7, 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            square([1, 1], center=false);
          }
        }
      }
    }
    hull(){
      translate([9, -18, 1]){
        cube([(37.9 + extraLength), (6.1 - extraGulfWidth), (2 + extraShelfHeight)], center=false);
      }
      union(){
        translate([(46.8 + extraLength), -17, 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([(46.8 + extraLength), (-12.8 - extraGulfWidth), 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, (-12.8 - extraGulfWidth), 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, -17, 1]){
          linear_extrude( height=(2 + extraShelfHeight), twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
      }
    }
  }

  difference()
  {
    {
        // Endcaps
        union(){
          translate([-15.5, 4.5, 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=1.5, r2=1.5, h=10, center=false);
            }
          }
          translate([-15.5, -4.5, 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=1.5, r2=1.5, h=10, center=false);
            }
          }
          translate([(49 + extraLength), (-4 + (extraThickness/2)), 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=(2 + (extraThickness/2)), r2=(2 + (extraThickness/2)), h=17.6, center=false);
            }
          }
        }
    }
    {
      boltCutouts();
    }
  }
  




  // Spacers
  difference() {
    union(){
      translate([(25 + extraLength), -5.6, 1.6]){
        rotate([30, 0, 0]){
          cube([2, 8, 8], center=false);
        }
      }
      translate([(44 + extraLength), -5.6, 1.6]){
        rotate([30, 0, 0]){
          cube([2, 8, 8], center=false);
        }
      }
      translate([(44 + extraLength), -9.6, 8.5]){
        cube([2, 3.6, 3], center=false);
      }
      translate([(25 + extraLength), -9.6, 8.5]){
        cube([2, 3.6, 3], center=false);
      }
    }

    translate([20, -2, 0]){
      cube([(30 + extraLength), 10, 20], center=false);
    }
  }
  // Rounded top of rod holder
  difference() {
    translate([0, 0, 0]){
      {
        $fn=64;    //set sides to 64
        cylinder(r1=6.4, r2=6.4, h=10, center=false);
      }
    }

    union(){
      translate([0, 0, 0]){
        {
          $fn=64;    //set sides to 64
          cylinder(r1=4, r2=4, h=10, center=false);
        }
      }
      translate([-4, -16, 0]){
        cube([10, 10, 10], center=false);
      }
    }
    translate([-15.5, -3, 0]){
      cube([15.5, 6, 17.6], center=false);
    }
  }

  // Add curves to the kneck for better strength
  translate( [9.0, (1 + extraThickness), 0] )
  {
    essCurve( d = 6, h = 10 );
  }

  translate( [5.5, -8.5, 0] )
  {
    rotate( [0, 0, 180] )
    {
      essCurve( d = 5, h = (3 + extraShelfHeight) );
    }
  }


 


}

