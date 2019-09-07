//!OpenSCAD

include <Nema motor mounting bracket.scad>
include <Module- Generic baseplates.scad>

renderCornerBase();




module renderCornerBase()
{
    translate( [-1 * (thickness + 4.2), internalNutTrapDistance, height/2] )
    {
        rotate( [0, 90, 0] )
        {
            cornerBase();
        }
    }
}


    

    






