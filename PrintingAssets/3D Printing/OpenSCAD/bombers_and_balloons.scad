// bomb icon - <a href="https://www.flaticon.com/free-icons/atomic-bomb" title="atomic bomb icons">Atomic bomb icons created by Freepik - Flaticon</a>
// balloon icon - <a href="https://www.flaticon.com/free-icons/hot-air-balloon" title="hot air balloon icons">Hot air balloon icons created by Freepik - Flaticon</a>
include <variables.scad>;
include <modules.scad>;


module bomberBase() {
    scale([2.4,2.4,1])
        planeSansForwardArc();
}

module templateGuides() {
    translate([tokenWidth, 0, 0])
        token();
    translate([-tokenWidth, 0, 0])
        token();
}

module bomber() {
    union() {
        bomberBase();

        templateGuides();
    }
}

module bombIcon() {
    translate([0.5,1,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            scale(0.075)
                import("icons/bomb.svg", center=true);
    }
}

module bomb() {
    union(){
        token();

        bombIcon();
    }
}

module balloonIcon() {
    translate([0.5,1,tokenHeight])
        linear_extrude(height = tokenHeight/4) {
            scale(0.1)
                import("icons/balloon.svg", center=true);
    }
}

module balloon() {
    scale([2,2,1])
        union(){
            token();

            balloonIcon();
        }
}

bomber();
// bomb();
// balloon();
