// themed tops
include <../modules.scad>;
include <../variables.scad>;

module xwingIcon() {
    translate([0.5,0,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            rotate([0,0,-90])
              scale(0.13)
                  import("../icons/x-wing.svg", center=true);
    }
}

module plane(){
    union() {
        tokenWithArc();

        xwingIcon();
    }
}

//plane token
module xwing(hasID){
    difference(){
        plane();

        balls(zMod=0, dMod=0.25);
          rotate([0,0,45]) balls(zMod=0, dMod=0.25);
    }
}

xwing();