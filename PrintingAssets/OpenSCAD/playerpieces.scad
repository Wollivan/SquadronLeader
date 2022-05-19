//include jointSCAD for the range ruler
include <JointSCAD/JointSCAD.scad>;

// Outputs

translate([-tokenWidth*2,0,0]) templateStraight("1"); // Straight Template
translate([tokenWidth*3,0,0]) template45("2"); // Bank Template
template90("3"); // Turn Template
altitudeTranslated(); // Altitude Token
planeTranslated(); // Plane Token
translate([-tokenWidth*4.5,0,0]) singleManeuver(); // All in one maneuver template
translate([-tokenWidth*5.5,0,0]) ruler("solid"); //range ruler
translate([-tokenWidth*6.5,0,0]) ruler("bendable"); //bendable range ruler
translate([-tokenWidth*7.5,0,0]) rulerParts("1"); //detachable range ruler part 1
translate([-tokenWidth*8,0,0]) rulerParts("2"); //detachable range ruler part 2
translate([-tokenWidth*8.5,0,0]) rulerParts("3"); //detachable range ruler part 3


// Begin Code
tokenHeight = 4;
tokenWidth = 26;
wallWidth = 6;
$fn = 100;

arcWidth = 1;

templateGapOffset = tokenWidth/6;
templateLength = tokenWidth*3;

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
                import("plane-model.svg", center=true);
    }
}


module templateStraight(theNum) {
    difference(){
        cube([tokenWidth,templateLength,tokenHeight]);
        
        translate([tokenWidth/2,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth/2,templateLength+templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        translate([tokenWidth/7,templateLength/3,-1])
            linear_extrude(tokenHeight+2)
                text(theNum, size=25);
        
        /* removed because this is no longer how they are executed
        //barrel roll notches
        translate([tokenWidth*1.35,tokenWidth/1.7,-1])
            scale([1,1,1.5])
                token();
        
        translate([tokenWidth*1.35,tokenWidth*2.42,-1])
            scale([1,1,1.5])
                token();
        */
        
//        this just shows that the notches are exactly one token apart
//        translate([tokenWidth*1.35,tokenWidth*1.5,-1])
//            scale([1,1,1.5])
//                #token();
    }
}
/*
guess = 0.02; //i need someone cleverer than me to work out the calculations for the 45 degree template
module template45old() {
    difference(){
        translate([-templateLength,0,0])
            rotate_extrude(angle = 45)
                translate([templateLength, 0, 0])
                square(size = [tokenWidth, tokenHeight]);
        
        
        translate([tokenWidth/2,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
//        translate([-templateGapOffset/1.25+tokenWidth,templateGapOffset/1.25+tokenWidth*2.45,-1])
//        translate([-templateLength/4+templateGapOffset/2,templateLength-tokenWidth/2+templateGapOffset/2,-1])
        translate([-templateGapOffset+guess*tokenWidth-tokenWidth/2,templateLength-tokenWidth/2.5+guess,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
    }
}
*/

module template45(theNum) {
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
        
        
        translate([tokenWidth/8,templateLength/4,-1])
            rotate([0,0,30])
                linear_extrude(tokenHeight+2)
                    text(theNum, size=25);
        
        
    }
    
}

module template90(theNum) {
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
        
        
        translate([tokenWidth/0.9,templateLength/6,-1])
            rotate([0,0,45])
                linear_extrude(tokenHeight+2)
                    text(theNum, size=25);
    }
}
//altitude token
module altitudeTranslated(){
    translate([0,-tokenWidth*1.7,0])
    union(){
        balls(zMod=tokenHeight, dMod=0);
        difference(){
            token();


            translate([0,0,-1])
                scale([0.56,0.56,1.5]) 
                    token();
            
            balls(zMod=0, dMod=0.25);
            rotate([0,0,45]) balls(zMod=0, dMod=0.25);
        }
    }
}
//plane token
module planeTranslated(){
    translate([0,-tokenWidth/2,0])
    difference(){
        plane();

        balls(zMod=0, dMod=0.25);
            rotate([0,0,45]) balls(zMod=0, dMod=0.25);
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
    
        translate([tokenWidth*1.33,templateLength/1.35,-1])
            linear_extrude(tokenHeight+2)
                text("1", size=10);
        
        translate([tokenWidth/1.1,templateLength/1.6,-1])
            rotate([0,0,45])
                linear_extrude(tokenHeight+2)
                    text("2", size=10);
        translate([tokenWidth/1.4,templateLength/2.25,-1])
            rotate([0,0,90])
                linear_extrude(tokenHeight+2)
                    text("3", size=10);
        
        translate([tokenWidth*1.45,tokenWidth*0.8,tokenHeight-0.9])
        rotate([0,0,90])
        linear_extrude(height = tokenHeight/4) {
            scale(0.065)
                import("plane-model.svg", center=true);
        }
        
        /* removed because this is no longer how they are executed
        //barrel roll notches
        translate([tokenWidth+tokenWidth*1.35,tokenWidth/1.7,-1])
            scale([1,1,1.5])
                token();
        
        translate([tokenWidth+tokenWidth*1.35,tokenWidth*2.42,-1])
            scale([1,1,1.5])
                token();
        */
    }
    
}


// printable range ruler
module ruler(type) {
    difference() {
        
        
        if(type == "bendable") {
            difference() {
                // ruler
                cube([tokenWidth/4, templateLength*3,tokenHeight]);
                
                //bendable parts
                translate([-1,templateLength,1])
                    cube([2+tokenWidth/4, 1, tokenHeight]);


                translate([-1,templateLength*2,-1])
                    cube([2+tokenWidth/4, 1, tokenHeight]);
            }
        } else if(type == "solid") {
            difference() {
                // ruler
                cube([tokenWidth/4, templateLength*3,tokenHeight]);
                
                // markers
                translate([-1,templateLength,tokenHeight*0.8])
                    cube([2+tokenWidth/4, 1, tokenHeight]);
                
                
                translate([-1,templateLength*2,tokenHeight*0.8])
                    cube([2+tokenWidth/4, 1, tokenHeight]);      
            }
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


module rulerParts(partNo) {
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



//test
//color("green") rotate([0,0,315]) translate([tokenWidth*3,0,0]) template45();


//blank token
//difference(){
//    tokenWithArc(); 
//        balls(zMod=0, dMod=0.25);
//    }




// WIP
//bomber model
//difference(){
//        scale([2,2,1])
//            plane();
//
//        balls(zMod=0, dMod=0.25);
//        
//    rotate([0,0,-90])
//    translate([-tokenWidth/2,tokenWidth/1.5,-1])
//        scale([1,1,2])
//    templateStraight();
//    
//    
//    rotate([0,0,-90])
//    translate([-tokenWidth/2,tokenWidth/1.5,-1])
//        scale([1,1,2])
//    #templateStraight();
//    }
