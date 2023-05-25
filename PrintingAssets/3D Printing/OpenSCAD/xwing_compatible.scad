include <variables.scad>;
include <modules.scad>;

tolerance = 0.1;
poleDia = 3 + tolerance;
poleDiaLarge = 6 + tolerance;

module xWingHole(dia) {
  translate([0,0,tokenHeight/2])
    #cylinder(d=dia, h=tokenHeight/2);
}


module tokenWithXWingHole() {
  difference() {
    tokenWithArc();

    xWingHole(poleDia);
  }
}

module largeTokenWithXWingHole() {
  difference() {
    largeTokenWithArc();

    xWingHole(poleDiaLarge);
  }
}

// tokenWithXWingHole();
largeTokenWithXWingHole();