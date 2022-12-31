// modules
include <variables.scad>;

module token(){
    translate([0,0,0])
    //cube([tokenWidth,tokenWidth,tokenHeight], true); 
    rotate([0,0,135/2])
        cylinder(h=tokenHeight, d=tokenWidth, $fn=8); 
}

module tokenWithArc(){
    difference(){
        token();
        
        //weird z +1 and +2 height because its centered and this ensures no very thin line consufing the printer
        translate([tokenWidth/3,tokenWidth/3,tokenHeight-arcWidth/2+1]) 
            rotate([0,0,135/3])
                cube([tokenWidth,arcWidth,arcWidth+2], center=true);
        
        
        translate([tokenWidth/3,-tokenWidth/3,tokenHeight-arcWidth/2+1]) 
            rotate([0,0,-135/3])
                cube([tokenWidth,arcWidth,arcWidth+2], center=true);
            
        
        translate([tokenWidth/2.6,tokenWidth/8,tokenHeight-arcWidth/2+1]) 
            cube([tokenWidth/2,arcWidth,arcWidth+2], center=true);
        
        
        translate([tokenWidth/2.6,-tokenWidth/8,tokenHeight-arcWidth/2+1]) 
            cube([tokenWidth/2,arcWidth,arcWidth+2], center=true);
    }
}

module balls(zMod, dMod) {
    //they used to be procedurally generated but now there are only four, this was easier
//    for (n=[0:4])
//            rotate ([0,0,(n-1)*360/5])
//                translate([tokenWidth/2-wallWidth,tokenWidth/4,zMod])
//                    sphere(d=wallWidth/2+dMod, $fn=25);
    
    translate([tokenWidth/4,tokenWidth/4,zMod])
        sphere(d=wallWidth/2+dMod, $fn=25);
    translate([-tokenWidth/4,tokenWidth/4,zMod])
        sphere(d=wallWidth/2+dMod, $fn=25);
    translate([-tokenWidth/4,-tokenWidth/4,zMod])
        sphere(d=wallWidth/2+dMod, $fn=25);
    translate([tokenWidth/4,-tokenWidth/4,zMod])
        sphere(d=wallWidth/2+dMod, $fn=25);
}





module plane(){
    color("green") tokenWithArc();
    
    translate([0.5,1,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            scale(0.065)
                import("icons/plane-model.svg", center=true);
    }
}