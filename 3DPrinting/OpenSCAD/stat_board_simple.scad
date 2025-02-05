include <variables.scad>;
// board should fit in the dice section of the small box
boardWidth = 24; // dice are 12mm
boardLength = 45; // dice are 12mm
boardHeight = 2;
gap = boardLength/5;
config2334 = ["2", "3", "3", "4"];
config2343 = ["2", "3", "4", "3"];
config2433 = ["2", "4", "3", "3"];
config3234 = ["3", "2", "3", "4"];
config3243 = ["3", "2", "4", "3"];
config3324 = ["3", "3", "2", "4"];
config3342 = ["3", "3", "4", "2"];
config3423 = ["3", "4", "2", "3"];
config3432 = ["3", "4", "3", "2"];
config4233 = ["4", "2", "3", "3"];
config4323 = ["4", "3", "2", "3"];
config4332 = ["4", "3", "3", "2"];

module roundedCube(width, length, radius, height) {
  hull () {
    translate ([radius,radius,0])
      cylinder (r=radius,h=height);
    translate ([radius,width-radius,0])
      cylinder (r=radius,h=height);
    translate ([length-radius,width-radius,0])
      cylinder (r=radius,h=height);
    translate ([length-radius,radius,0])
      cylinder (r=radius,h=height);
  }
}


module number(val, x) {
  translate([x, 9, -1])
    linear_extrude(boardHeight+2)
      text(val, font="RobotoMono", valign="top", size=6);
}

module symbol(s, path, x) {
  translate([x,boardWidth-10,-1])
      linear_extrude(height = boardHeight+2) {
          scale(s)
              import(path);
      }
}

module board(stats) {
  difference() {
    roundedCube(boardWidth, boardLength, 5, boardHeight);

    symbol(0.5, "icons/health.svg", 2.25);
    translate([0,-0.25,0]) symbol(0.45, "icons/defense.svg", 13.75);
    translate([0,-0.75,0]) symbol(0.55, "icons/attack.svg", 23.75);
    symbol(0.5, "icons/speed.svg", 35.75);


    number(stats[0], 3.75);
    number(stats[1], 14.75);
    number(stats[2], 25.75);
    number(stats[3], 36.75);

    // translate([1.5, 9, -1])
    //   linear_extrude(boardHeight+2)
    //     text(order, font="RobotoMono", valign="top", size=6);
  }
}

board(config2334);
// board(config2343);
// board(config2433);
// board(config3234);
// board(config3243);
// board(config3324);
// board(config3342);
// board(config3423);
// board(config3432);
// board(config4233);
// board(config4323);
// board(config4332);
