// WIP
// bomber model
include <variables.scad>;

difference(){
        scale([2,2,1])
            plane();

        balls(zMod=0, dMod=0.25);
        
    rotate([0,0,-90])
    translate([-tokenWidth/2,tokenWidth/1.5,-1])
        scale([1,1,2])
    templateStraight();
    
    
    rotate([0,0,-90])
    translate([-tokenWidth/2,tokenWidth/1.5,-1])
        scale([1,1,2])
    #templateStraight();
}
