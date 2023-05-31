include <variables.scad>;
include <modules.scad>;

tolerance = 0.1;
poleDia = 3 + tolerance;
poleDiaLarge = 6 + tolerance;

module xWingHole(dia) {
  translate([0,0,tokenHeight/2])
    cylinder(d=dia, h=tokenHeight/2);
}

module struts(dia, mod) {
  translate([0,0,tokenHeight])
  difference() {
  difference() {
    cylinder(d=dia*2, h=tokenHeight/2);
    cylinder(d=dia, h=tokenHeight/2);
  }
  rotate([0,0,45])
    cube([tokenWidth, dia/mod, tokenHeight], true);

  rotate([0,0,-45])
    cube([tokenWidth, dia/mod, tokenHeight], true);
  }
}

module tokenWithXWingHole() {
  union() {
    difference() {
      tokenWithArc();

      xWingHole(poleDia);
    }
    struts(poleDia, 3.1);
  }
}

module largeTokenWithXWingHole() {
  union() {
    difference() {
      largeTokenWithArc();

      xWingHole(poleDiaLarge);
    }
    struts(poleDiaLarge, 2.55);
  }
}

tokenWithXWingHole();
// largeTokenWithXWingHole();