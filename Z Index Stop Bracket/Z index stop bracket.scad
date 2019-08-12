//!OpenSCAD

union(){
  difference() {
    // Main body with cutouts
    difference() {
      // Main body
      translate([-15.5, -6, 0]){
        cube([64.3, 12, 17.6], center=false);
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
      translate([8, -2, 0]){
        cube([40.8, 12, 17.6], center=false);
      }
      // Bolt cutouts
      union(){
        translate([45.3, 0, 15.1]){
          rotate([90, 0, 0]){
            {
              $fn=64;    //set sides to 64
              cylinder(r1=1.8, r2=1.8, h=10, center=false);
            }
          }
        }
        translate([26.8, 0, 15.1]){
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
            }
          }
        }
      }
      translate([-15.5, -6, 10]){
        cube([23.5, 20, 7.6], center=false);
      }
      translate([8, -8, 10]){
        rotate([0, 330, 0]){
          cube([30, 10, 10], center=false);
        }
      }
    }

    translate([-2, -2, 0]){
      cube([10, 10, 10], center=false);
    }
  }
  // Component shelf
  union(){
    hull(){
      translate([9, -18, 0]){
        cube([37.8, 12, 1], center=false);
      }
      union(){
        translate([46.8, -17, 0]){
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
        translate([46.8, -7, 0]){
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
        cube([37.8, 3.6, 2], center=false);
      }
      union(){
        translate([46.8, -8.6, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, -8.6, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([46.8, -7, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            square([1, 1], center=false);
          }
        }
        translate([8, -7, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            square([1, 1], center=false);
          }
        }
      }
    }
    hull(){
      translate([9, -18, 1]){
        cube([37.9, 6.1, 2], center=false);
      }
      union(){
        translate([46.8, -17, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([46.8, -12.8, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, -12.8, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
        translate([9, -17, 1]){
          linear_extrude( height=2, twist=0, scale=[1, 1], center=false){
            {
              $fn=64;    //set sides to 64
              circle(r=1);
            }
          }
        }
      }
    }
  }
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
    translate([49, -4, 0]){
      {
        $fn=64;    //set sides to 64
        cylinder(r1=2, r2=2, h=17.6, center=false);
      }
    }
  }
  // Spacers
  difference() {
    union(){
      translate([25, -5.6, 1.6]){
        rotate([30, 0, 0]){
          cube([2, 8, 8], center=false);
        }
      }
      translate([44, -5.6, 1.6]){
        rotate([30, 0, 0]){
          cube([2, 8, 8], center=false);
        }
      }
      translate([44, -9.6, 8.5]){
        cube([2, 3.6, 3], center=false);
      }
      translate([25, -9.6, 8.5]){
        cube([2, 3.6, 3], center=false);
      }
    }

    translate([20, -2, 0]){
      cube([30, 10, 20], center=false);
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
}