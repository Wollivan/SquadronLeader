// themed tops
include <../modules.scad>;
include <../variables.scad>;


xwing();
translate([tokenWidth+3,0,0]) ywing();
translate([tokenWidth+3,tokenWidth+3,0])falcon();
translate([0,tokenWidth*2+6,0])tieadv();
translate([0,tokenWidth+3,0])tiefighter();
module xwingIcon() {
    translate([0.5,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
              scale(0.061)
                  import("../icons/x-wing.svg", center=true);
    }
}

module ywingIcon() {
    translate([0.5,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
                translate([92,24,0])
                    scale(0.22)
                  import("../icons/y-wing.svg", center=true);
    }
}

module falconIcon() {
    translate([0.5,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
                translate([0,-1,0])
                    scale(0.048)
                  import("../icons/falcon.svg", center=true);
    }
}

module tieadvIcon() {
    translate([0.5,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
                translate([65,31.5,0])
                    scale(0.24)
                  import("../icons/tie-adv.svg", center=true);
    }
}

module tiefighterIcon() {
    translate([0.5,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
                translate([68.5,7,0])
                    scale(0.25)
                  import("../icons/tie-fighter.svg", center=true);
    }
}

module xwing(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") xwingIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}

module ywing(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") ywingIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}

module falcon(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") falconIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}

module tieadv(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") tieadvIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}
module tiefighter(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") tiefighterIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}
