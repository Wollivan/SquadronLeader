// range ruler
include <JointSCAD/JointSCAD.scad>;
include <variables.scad>;
// translate([-tokenWidth*5.5,0,0]) rulerWhole(); //range ruler
// translate([0,0,0]) rulerInterlocking("1"); //detachable range ruler part 1
// translate([10,0,0]) rulerInterlocking("2"); //detachable range ruler part 2
// translate([20,0,0]) rulerInterlocking("3"); //detachable range ruler part 3
interlocking();

jointDepth = 5;
tolerance = 0.4;

module jointPiece() {
    translate([(tokenWidth/4)/4,0,0])
        cube([(tokenWidth/4)/2, jointDepth, tokenHeight]);
}
module jointPieceMissing() {
    translate([(tokenWidth/4)/4,0,0])
        cube([(tokenWidth/4)/2, jointDepth, tokenHeight]);
}

module missingNo(partNo) {
    translate([1,templateLength/2-5,-1])
            linear_extrude(tokenHeight+2)
                text(partNo, size=6);
}
module interlocking() {
    rangeOne();
    translate([15,0,0]) rangeTwo();
    translate([30,0,0]) rangeThree();
}

module rangeOne() {
    difference() {
        union() {
            cube([tokenWidth/4, templateLength,tokenHeight]);
            
            translate([0,templateLength,0])
                jointPiece();
        }
        missingNo("1");
    }
}

module rangeTwo() {
    difference() {
        union() {
            cube([tokenWidth/4, templateLength,tokenHeight]);
            
            translate([0,templateLength,0])
                jointPiece();
        }
        jointPieceMissing();

        missingNo("2");
    }
}

module rangeThree() {
    difference() {
        cube([tokenWidth/4, templateLength,tokenHeight]);
            
        jointPieceMissing();

        missingNo("3");
    }
}
module rulerInterlocking(partNo) {
    difference() {
        if(partNo == "1") {
            // part 1
            difference() {
                union() {
                    cube([tokenWidth/4, templateLength,tokenHeight]);
                    
                    translate([0,templateLength,0])
                        jointPiece();
                }
                
            }
        } else if(partNo == "2") {
            // part 2
            difference() {
                union() {
                    cube([tokenWidth/4, templateLength,tokenHeight]);
                    
                    translate([0,templateLength,0])
                        jointPiece();
                }
                jointPiece();
            }
        } else if(partNo == "3") {
            // part 3
            difference() {
                cube([tokenWidth/4, templateLength,tokenHeight]);
                    
                
                jointPiece();
            }
        }
        
        // number
        translate([1,templateLength/2-5,-1])
            linear_extrude(tokenHeight+2)
                text(partNo, size=6);
    }
}



module rulerWhole() {
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
        translate([1,templateLength/2-5,0])
            linear_extrude(tokenHeight+2)
                text("1", size=6);
        
        
        translate([1,templateLength*1.5-5,0])
            linear_extrude(tokenHeight+2)
                text("2", size=6);
                
                
        translate([1,templateLength*2.5-5,0])
            linear_extrude(tokenHeight+2)
                text("3", size=6);
    }
}