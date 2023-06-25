$fn=100;
wheelWidth = 8;
wheelDia = 16;
sideWidth = wheelWidth/2;

sideSize = wheelDia;

axelDia= wheelDia/3;
axelLength = wheelWidth*5;

magnetDia = 5;
magnetHeight = 5;

sideNum = 5;
axelSides = 10;

springLength = wheelDia*0.8; // determined empirically
springWidth = 1.2; // determined arbitrarily, adjust for feel
springOffset = axelDia/2*sin(2*360/10); // determined with magic

// test();
wheelSet();
// rotate([0,0,360/10]) axel();
// sides();


module axel(mod){
  union() {
      rotate([0,0,18])
        cylinder(h=axelLength+1, d=axelDia, $fn=axelSides);
      translate([-axelDia/2, -axelDia/2,0])
        cube([axelDia/2, axelDia/2, sideWidth]);

      translate([-axelDia/2, -axelDia/2,1+axelLength-sideWidth])
        cube([axelDia/2, axelDia/2, sideWidth]);
  }
}

module springs(){
  translate([-springLength/2,springOffset,0])
    cube([springLength,springWidth,wheelWidth]);

  rotate([0,0,36*4])
    translate([-springLength/2,springOffset,0])
      cube([springLength,springWidth,wheelWidth]);

  rotate([0,0,36*7])
    translate([-springLength/2,springOffset,0])
      cube([springLength,springWidth,wheelWidth]);
}

module numbers(icon, yMod, zMod) {
  // numbers
  rotate([0,0,35])
    for (n=[1:sideNum-1])
      rotate ([0,0,(n)*360/sideNum])
        translate([wheelDia/2.75,-wheelWidth/2.5,wheelWidth*0.82])
          rotate([0,90,0])
            linear_extrude(2.5)
              text(str(n), size=7);

   // symbol
  rotate ([0,0,36])
    translate([wheelDia/2.75,-wheelWidth*yMod,wheelWidth*zMod])
      rotate([0,90,0])
        linear_extrude(2.5)
          scale(0.4) import(icon);                
}

module wheel(icon, yMod, zMod) {
  rotate([0,0,-53]) // used just to determine where the arrow should go
    union() {
      difference(){
        cylinder($fn=100, h=wheelWidth, d=wheelDia);

        translate([0,0,-1])
          cylinder(h=wheelWidth+2, d=axelDia*2);
      }

      springs();

      numbers(icon, yMod, zMod);
    }
}

module sideNoHole () {
  tran = sideSize/3.5;
  difference () {
    hull () {
      translate ([tran,tran,0])
        cylinder (r=5,h=sideWidth);
      translate ([-tran,tran,0])
        cylinder (r=5,h=sideWidth);
      translate ([0,-tran,0])
        cylinder (r=5,h=sideWidth);
      // translate ([-tran,-tran,0])
      //   cylinder (r=5,h=sideWidth);
    }
    // arrow
    translate([0,-sideSize/2,wheelWidth/2-1])
      rotate([90,0,0]) rotate([0,0,90])
        cylinder($fn=3, h=2, r=3);

  }
}

module sideOne() {
  difference(){
    sideNoHole();

    // axel hole (obviously)
    translate([0,0,0])
      axel();
  }
}

module sideTwo() {
  difference(){
    sideNoHole();

    // axel hole (obviously)
    rotate([0,0,90])

      axel();
  }
}

module sides() {
  translate([sideSize+10,sideSize,0]) sideOne();
  translate([0,sideSize,0]) sideTwo();
}
module health() {
  wheel("icons/health.svg",0.375, 0.86);
}

module defense() {
  wheel("icons/defense.svg",0.4, 0.87);
}
module attack() {
  wheel("icons/attack.svg",0.4, 0.865);
}
module speed() {
  wheel("icons/speed.svg",0.35, 0.85);
}
module wheelSet() {
  translate([0,0,0]) health();
  translate([wheelDia+5,0,0]) defense();
  translate([wheelDia+5,wheelDia+5,0]) attack();
  translate([0,wheelDia+5,0]) speed();
}




module test() {
  axel();
  side();
  translate([0,0,sideWidth]) health();
  translate([0,0,sideWidth+wheelWidth]) defense();
  translate([0,0,sideWidth+wheelWidth*2]) attack();
  translate([0,0,sideWidth+wheelWidth*3]) speed();
  translate([0,0,1+sideWidth+wheelWidth*4]) side();

}
