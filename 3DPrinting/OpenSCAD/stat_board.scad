// stat board
include <variables.scad>;

// translate([0,0,0]) statBoard();//Stat board
translate([0,-6,0]) numberStatToken("4");
translate([11,-6,0]) numberStatToken("3");
translate([22,-6,0]) numberStatToken("3");
translate([33,-6,0]) numberStatToken("2");
translate([44,-8,0]) healthPeg();
//translate([tokenWidth*5,40,0]) planeIDToken("A");


module blankBoard() {
    union() {
        translate([tokenWidth/6,tokenWidth/2-1,0])
            scale([1,1,1])
                rotate([0,0,22.45])
                    cylinder(h=statHeight, d=tokenWidth, $fn=8, center=false);
        
        cube([boardHeight, tokenWidth-2, statHeight]);
        
        translate([boardHeight-tokenWidth/6,tokenWidth/2-1,0])
            scale([1,1,1])
                rotate([0,0,22.45])
                    cylinder(h=statHeight, d=tokenWidth, $fn=8, center=false);
    }
}

module statBoard() {
    difference() {
        blankBoard();
        // STILL NEED TO ADD BACK ID HOLE
        
        // stat peg holes
        translate([-6,0,0])
            union() {
                translate([0,boardWidth/5,0])
                    union() {
                        translate([tokenWidth/4,0,statHeight+1])
                            rotate([180,0,0])
                                cylinder(h=(statHeight*2),r=pegHoleRad+0.1,$fn=35);
                        
                        translate([tokenWidth/4*3,0,statHeight+1])
                            rotate([180,0,0])
                                cylinder(h=(statHeight*2),r=pegHoleRad+0.1,$fn=35);
                        
                        translate([tokenWidth/4*5,0,statHeight+1])
                            rotate([180,0,0])
                                cylinder(h=(statHeight*2),r=pegHoleRad+0.1,$fn=35);
                        
                        translate([tokenWidth/4*7,0,statHeight+1])
                            rotate([180,0,0])
                                cylinder(h=(statHeight*2),r=pegHoleRad+0.1,$fn=35);
                    }
            
                union() {
                    //health peg holes
                    translate([tokenWidth/4,boardWidth-4.5,0])
                        for(j=[0:3]){
                            translate([j*pegSpace,0,statHeight+1])
                                rotate([180,0,0])
                                    cylinder(h=(statHeight*2),r=pegHoleRad+0.1,$fn=35);
                        }
                    
                    //health peg path vertical
                    translate([tokenWidth/4.2,boardWidth-4.75,statHeight/2])
                        cube([((.5)+pegSpace)*2.9,.6,statHeight/2+1]);
                    //health peg path horizontal
                    translate([tokenWidth/4.2,17,statHeight/2])
                        cube([.6,5,statHeight/2+1]);
                
                }   
                
                //icons
                translate([0,tokenWidth/1.75,-1])
                    union(){
                        translate([tokenWidth/4,0,0])
                            linear_extrude(height = statHeight+2) {
                                scale(0.6)
                                    import("icons/health.svg", center=true);
                        }
                        translate([tokenWidth/4*3,-0.5,0])
                            linear_extrude(height = statHeight+2) {
                                scale(0.6)
                                rotate([0,0,90])
                                import("icons/defense.svg", center=true);
                        }
                        translate([tokenWidth/4*5,-1,0])
                            linear_extrude(height = statHeight+2) {
                                scale(0.7)
                                import("icons/attack.svg", center=true);
                        }
                        translate([tokenWidth/4*7,0.5,0])
                            linear_extrude(height = statHeight+2) {
                                scale(0.6)
                                rotate([0,0,90])
                                import("icons/speed.svg", center=true);
                        }
                    }
            }
        
        
    }
}

module peg() {
    cylinder(h=(statHeight+.01),r=pegHoleRad,$fn=35);
}

module healthPeg(){
	union(){
		//cylinder(h=7,r=1.6,$fn=35);
        translate([0,-pegHoleRad*2,0])
            cube([pegHoleRad*2,pegHoleRad*6,statHeight]);

        translate([-pegHoleRad*2,0,0])
            cube([pegHoleRad*6,pegHoleRad*2,statHeight]);

		translate([pegHoleRad,pegHoleRad,statHeight])
            peg();
	}
}

module baseStatToken(isMold){
	rotate([0,0,22.45])
		cylinder(h=1.8,r=tokenRad,$fn=8);
			
}

module numberStatToken(number){
    union() {
        difference(){
            baseStatToken();
            
            //number/dot placement
            if(number){
                translate([0,0,statHeight/2])
                rotate([0,180,0])
                    linear_extrude(statHeight)
                        text(number,tokenRad,halign="center",valign="center",font="Verdana:style=Bold");
                
            }
        }
        
		translate([0,0,statHeight])
            peg();
    }
}

module dottedStatToken(number){
	union(){
		baseStatToken();
		
		translate([0,0,statHeight*.9])
		if(number=="2"){
			translate([-tokenRadSm/3,-tokenRadSm/3,0])
			for(i=[0:1]){
				translate([(tokenRadSm/1.5)*i,(tokenRadSm/1.5)*i,0])
				sphere(d=statHeight,$fn=24);
			}
		}else if(number=="3"){
			translate([-tokenRadSm/2,-tokenRadSm/2,0])
			for(i=[0:2]){
				translate([(tokenRadSm/2)*i,(tokenRadSm/2)*i,0])
				sphere(d=statHeight,$fn=24);
			}		
		}else if(number=="4"){
			translate([-tokenRadSm/3,-tokenRadSm/3,0])
			for(i=[0:1]){
				translate([(tokenRadSm/1.5)*i,(tokenRadSm/1.5)*i,0])
				sphere(d=statHeight,$fn=24);
                //cylinder(h=2, d=statHeight)
			}
			translate([-tokenRadSm/3,tokenRadSm/3,0])
			for(i=[0:1]){
				translate([(tokenRadSm/1.5)*i,(-tokenRadSm/1.5)*i,0])
				sphere(d=statHeight,$fn=24);
			}
		}
	}
}


module planeIDToken(theID){
	union(){
		translate([0,0,-statHeight/2])
		cube([2.5,2.5,statHeight+.01],center=true);
		
		difference(){
			cylinder(h=statHeight,r=4,$fn=50);
			
			translate([0,0,(statHeight-numberHeight)])
			rotate([0,0,180])
			linear_extrude(numberHeight)
			text(theID,5,halign="center",valign="center",font="Verdana:style=Bold");
		}
	}
}