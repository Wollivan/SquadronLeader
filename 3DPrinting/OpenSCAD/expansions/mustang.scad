// themed tops
include <../modules.scad>;
include <../variables.scad>;


b24();

module mustangIcon() {
    translate([0.3,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
              scale(0.075)
                  import("../icons/mustang.svg", center=true);
    }
}

module b24Icon() {
    translate([0.3,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
              scale(0.075)
                  import("../icons/b-24.svg", center=true);
    }
}

module mustang(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") mustangIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}

module b24(hasID){
    difference(){
        union() {
        tokenWithArc();

        color("grey") mustangIcon();
    }

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}