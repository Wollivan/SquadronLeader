// stat board
include <variables.scad>;

translate([tokenWidth*4.5,0,0]) statBoard();//Stat board
//translate([tokenWidth*5,-20,0]) numberStatToken("4", true);
translate([tokenWidth*4.85,-5,0]) numberStatToken("4", true);
translate([tokenWidth*5.45,-5,0]) numberStatToken("3", true);
translate([tokenWidth*6.05,-5,0]) numberStatToken("3", true);
translate([tokenWidth*6.67,-5,0]) numberStatToken("2", true);
translate([tokenWidth*4.85,30,0]) healthPeg();
//translate([tokenWidth*5,40,0]) planeIDToken("A");

module statBoard(hasID){
	difference(){
		//board
		if(hasID){
			cube([boardHeight,boardWidth,statHeight]);
		}else{
			cube([boardHeight-4.5,boardWidth,statHeight]);
		}
		
		boardOffset = hasID ? 0 : -4.5;
		translate([boardOffset,0,0])
		union(){
			//ID hole
			if(hasID){
				translate([2.4,boardWidth/2,statHeight])
				planeIDToken();
			}
				
			//token gaps
			translate([tokenRadSm+tokenSpace+4.5,0,0])
			for(i=[0:3]){
				translate([i*((tokenRadSm*2)+tokenSpace),0,0])
				baseStatToken(true);
			}
		
			//peg holes
			translate([13.6,boardWidth-2.5,0])
			for(j=[0:3]){
				translate([j*pegSpace,0,statHeight+1])
				rotate([180,0,0])
				cylinder(h=(statHeight*2),r=pegHoleRad+0.5,$fn=35);
			}
			
			//peg path vertical
			translate([13.5,boardWidth-2.7,statHeight/2])
			cube([((.5)+pegSpace)*2.9,.6,statHeight/2]);
			//peg path horizontal
			translate([13.3,15,statHeight/2])
			cube([.6,5,statHeight/2]);
			
			//icons
			translate([0,boardWidth/1.75,0])
			union(){
				translate([13.5,0,0])
				linear_extrude(height = statHeight) {
					scale(0.75)
					import("icons/health.svg", center=true);
				}
				translate([29.5,0,0])
				linear_extrude(height = statHeight) {
					scale(0.75)
					rotate([0,0,90])
					import("icons/defense.svg", center=true);
				}
				translate([44.9,0,0])
				linear_extrude(height = statHeight) {
					scale(0.80)
					import("icons/attack.svg", center=true);
				}
				translate([60.5,0,0])
				linear_extrude(height = statHeight) {
					scale(0.75)
					rotate([0,0,90])
					import("icons/speed.svg", center=true);
				}
			}
		}
	}					
}

module healthPeg(){
	union(){
		//cylinder(h=7,r=1.6,$fn=35);
        translate([0,-pegHoleRad*2,0])
            cube([pegHoleRad*2,pegHoleRad*6,statHeight]);
        translate([-pegHoleRad*2,0,0])
            cube([pegHoleRad*6,pegHoleRad*2,statHeight]);
		translate([pegHoleRad,pegHoleRad,statHeight])
            cylinder(h=(statHeight+.01),r=pegHoleRad,$fn=35);
	}
}

module baseStatToken(isMold){
	difference(){
		//base token
		rotate([0,0,22.45])
		cylinder(h=1.8,r=tokenRad,$fn=8);
			
        // lock notch no longer needed
//		//lock notch
//		translate([-tokenRad,tokenRad/1.7,0])
//		if(isMold){
//			cube([tokenRad*2,tokenRad/7.5,statHeight/2.5]);
//		}else{
//			cube([tokenRad*2,tokenRad/7.5,statHeight/2]);
//		}
	}
}

module numberStatToken(number,isCutOut){
	difference(){
		baseStatToken();
		
		//number/dot placement
		if(number){
			if(isCutOut){
				translate([0,0,0])
				rotate([0,0,90])
				linear_extrude(statHeight)
				text(number,tokenRad,halign="center",valign="center",font="Verdana:style=Bold");
			}else{				
				translate([0,0,(statHeight-numberHeight)])
				rotate([0,0,90])
				linear_extrude(numberHeight)
				text(number,tokenRad,halign="center",valign="center",font="Verdana:style=Bold");
			}
		}
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