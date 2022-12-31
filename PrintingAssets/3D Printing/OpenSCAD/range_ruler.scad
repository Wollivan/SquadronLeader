// range ruler
include <JointSCAD/JointSCAD.scad>;
include <variables.scad>;
//translate([-tokenWidth*5.5,0,0]) ruler(); //range ruler
translate([-tokenWidth*7.5,0,0]) rulerInterlocking("1"); //detachable range ruler part 1
translate([-tokenWidth*7.8,0]) rulerInterlocking("2"); //detachable range ruler part 2
translate([-tokenWidth*8.1,0,0]) rulerInterlocking("3"); //detachable range ruler part 3


module ruler() {
    difference() {
        
        
        difference() {
            // ruler
            cube([tokenWidth/4, templateLength*3,tokenHeight]);
            
            // markers
            translate([-1,templateLength,tokenHeight*0.8])
                cube([2+tokenWidth/4, 1, tokenHeight]);
            
            
            translate([-1,templateLength*2,tokenHeight*0.8])
                cube([2+tokenWidth/4, 1, tokenHeight]);      
        }
         
        
        
        //numbers
        translate([0,templateLength/2-5,0])
            linear_extrude(tokenHeight+2)
                #text("1", size=8);
        
        
        translate([0,templateLength*1.5-5,0])
            linear_extrude(tokenHeight+2)
                #text("2", size=8);
                
                
        translate([0,templateLength*2.5-5,0])
            linear_extrude(tokenHeight+2)
                #text("3", size=8);
    }
}


module rulerInterlocking(partNo) {
    doveTailY = templateLength/16;
    doveTailX = tokenWidth/4;
    difference() {
        if(partNo == "1") {
            // part 1
            difference() {
                union() {
                    cube([tokenWidth/4, templateLength-doveTailY,tokenHeight]);
                    
                    translate([0,templateLength-doveTailY,0])
                        dovetailJointB([doveTailX, doveTailY, tokenHeight], 1);
                }
                
            }
        } else if(partNo == "2") {
            // part 2
            difference() {
                union() {
                    cube([tokenWidth/4, templateLength-doveTailY,tokenHeight]);
                    
                    translate([0,templateLength-doveTailY,0])
                        dovetailJointB([doveTailX, doveTailY, tokenHeight], 1);
                    
                    translate([0,-doveTailY,0])
                        dovetailJointA([doveTailX, doveTailY, tokenHeight], 1);
                }
                
            }
        } else if(partNo == "3") {
            // part 3
            difference() {
                union() {
                    cube([tokenWidth/4, templateLength,tokenHeight]);
                    
                    translate([0,-doveTailY,0])
                        dovetailJointA([doveTailX, doveTailY, tokenHeight], 1);
                }
                
            }
        }
        
        // number
        translate([0,templateLength/2-5,0])
            linear_extrude(tokenHeight+2)
                text(partNo, size=8);
    }
}
