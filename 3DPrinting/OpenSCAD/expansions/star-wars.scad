// themed tops
include <../modules.scad>;
include <../variables.scad>;


xwing();
// ywing();
// tieadv();
// tiefighter();
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

        xwingIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}
module ywing(hasID){
    difference(){
        union() {
        tokenWithArc();

        ywingIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}
module tieadv(hasID){
    difference(){
        union() {
        tokenWithArc();

        tieadvIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}
module tiefighter(hasID){
    difference(){
        union() {
        tokenWithArc();

        tiefighterIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}
