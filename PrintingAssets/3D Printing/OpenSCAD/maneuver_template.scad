// mode templates
include <variables.scad>;

translate([-tokenWidth*2,0,0]) templateStraight(); // Straight Template
translate([tokenWidth*3,0,0]) template45(); // Bank Template
template90(); // Turn Template
//translate([-tokenWidth*4.5,0,0]) 
//singleManeuver(); // All in one maneuver template

module templateStraight() {
    difference(){
        cube([tokenWidth,templateLength,tokenHeight]);
        
        translate([tokenWidth/2,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth/2,templateLength+templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        translate([tokenWidth/2,templateLength/2,-1])
            linear_extrude(tokenHeight+2)
                scale(1.5)
                    rotate([0,0,90])
                        import("icons/speed_one.svg", center=true);
        
        
//        this just shows that the notches are exactly one token apart
//        translate([tokenWidth*1.35,tokenWidth*1.5,-1])
//            scale([1,1,1.5])
//                #token();
    }
}

module template45() {
    difference(){
        translate([-templateLength,0,0])
            rotate_extrude(angle = 45)
                translate([templateLength, 0, 0])
                square(size = [tokenWidth, tokenHeight]);
        
        
        translate([tokenWidth/2,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([-templateLength * sin(45/360)-(tokenWidth/1.6),-templateGapOffset+templateLength * cos(45/360)-tokenWidth/4,-1])
            rotate([0,0,135/2])
                    cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth/4.5,templateLength/2.2,-1])
            rotate([0,0,30])
                linear_extrude(tokenHeight+2)
                scale(1.5)
                    rotate([0,0,90])
                        import("icons/speed_two.svg", center=true);
        
        
    }
    
}

module template90() {
    difference(){
        translate([0,0,0])
            rotate_extrude(angle = 90)
                translate([templateLength/3, 0, 0])
                square(size = [tokenWidth, tokenHeight]);
        
        
        translate([tokenWidth*1.5,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([-templateGapOffset,templateLength/2,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth*1,templateLength/2.7,-1])
            rotate([0,0,45])
                linear_extrude(tokenHeight+2)
                scale(1.5)
                    rotate([0,0,90])
                        import("icons/speed.svg", center=true);
    }
}


// single maneuver template
module singleManeuver() {
    difference(){
        union() {
            translate([tokenWidth,0,0]) templateStraight();
            translate([tokenWidth,0,0]) template45();
            template90();
        }
        
        //scale([1,1,0.3]) translate([tokenWidth*1.3,tokenWidth*1.5,tokenWidth/2]) plane();

    //numbers
        
        translate([tokenWidth*1.5,templateLength/1.175,-1])
            linear_extrude(height = tokenHeight+2) {
                scale(0.75)
                rotate([0,0,90])
                import("icons/speed_one.svg", center=true);
            }
        
        translate([tokenWidth/1.15,templateLength/1.45,-1])
            rotate([0,0,45])
                linear_extrude(height = tokenHeight+2) {
                    scale(0.75)
                    rotate([0,0,90])
                    import("icons/speed_two.svg", center=true);
                }
            
        translate([tokenWidth/1.75,templateLength/2.0,-1])
            rotate([0,0,90])
                linear_extrude(height = tokenHeight+2) {
                    scale(0.75)
                    rotate([0,0,90])
                    import("icons/speed.svg", center=true);
                }
        
        translate([tokenWidth*1.45,tokenWidth*0.8,-1])
        rotate([0,0,90])
        linear_extrude(height = tokenHeight+2) {
            scale(0.065)
                import("icons/plane-model.svg", center=true);
        }
        
        
        // guide lines top v1
        translate([0,0,tokenHeight-1])
        rotate_extrude(angle = 90)
                translate([templateLength/3+tokenWidth-1, 0, 0])
                    square(size = [0.5, 2]);
        
        translate([-tokenWidth*2-1,0,tokenHeight-1])
            rotate_extrude(angle = 45)
                translate([templateLength+tokenWidth-0.25, 0, 0])
                square(size = [0.5, 2]);
        
        // guide lines bottom v1
        translate([0,0,-1])
        rotate_extrude(angle = 90)
                translate([templateLength/3+tokenWidth-1, 0, 0])
                    square(size = [0.5, 2]);
        
        translate([-tokenWidth*2-1,0,-1])
            rotate_extrude(angle = 45)
                translate([templateLength+tokenWidth-0.25, 0, 0])
                square(size = [0.5, 2]);
                
                

    }
    
}

            