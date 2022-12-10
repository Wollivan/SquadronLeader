// tokens
include <modules.scad>;
include <variables.scad>;

//plane token
module playerPiece(hasID){
    translate([0,-tokenWidth/2,0])
    difference(){
        plane();

        balls(zMod=0, dMod=0.25);
            rotate([0,0,45]) balls(zMod=0, dMod=0.25);
		
		if(hasID){
			translate([-4.7,8.2,tokenHeight+.05])
				planeIDToken();
		}
    }
}

//altitude token
module altitude(){
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

playerPiece(); // Altitude Token
altitude(); // Plane Token