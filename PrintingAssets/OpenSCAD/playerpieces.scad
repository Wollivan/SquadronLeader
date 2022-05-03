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


module templateStraight() {
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
                text("1", size=25);
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
        
        
        translate([tokenWidth/8,templateLength/4,-1])
            rotate([0,0,30])
                linear_extrude(tokenHeight+2)
                    text("2", size=25);
        
        
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
        
        
        translate([tokenWidth/0.9,templateLength/6,-1])
            rotate([0,0,45])
                linear_extrude(tokenHeight+2)
                    text("3", size=25);
    }
}
//altitude token
module altitudeTranslated(){
    translate([0,-60,0])
    union(){
        balls(zMod=tokenHeight, dMod=0);
        difference(){
            token();


            translate([0,0,-1])
                scale([0.56,0.56,1.5]) 
                    token();
            
            balls(zMod=0, dMod=0.25);
        }
    }
}
//plane token
module planeTranslated(){
    translate([0,-30,0])
    difference(){
        plane();

        balls(zMod=0, dMod=0.25);
    }
}


//test
//color("green") rotate([0,0,315]) translate([tokenWidth*3,0,0]) template45();


//blank token
//difference(){
//    tokenWithArc(); 
//        balls(zMod=0, dMod=0.25);
//    }





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

/*Actual models*/
translate([-tokenWidth*2,0,0]) templateStraight();
translate([tokenWidth*3,0,0]) template45();
template90();
altitudeTranslated();
planeTranslated();

/*Actual models*/



