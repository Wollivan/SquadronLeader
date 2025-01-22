include <variables.scad>;
// board should fit in the dice section of the small box
boardWidth = 24; // dice are 12mm
boardLength = 45; // dice are 12mm
boardHeight = 2;
gap = boardLength/5;

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

module board() {
  difference() {
    cube([boardLength, boardWidth, boardHeight]);

    symbol(0.5, "icons/health.svg", gap/3);
    translate([0,-0.25,0]) symbol(0.45, "icons/defense.svg", gap*1.6);
    translate([0,-0.75,0]) symbol(0.55, "icons/attack.svg", gap*2.75);
    symbol(0.5, "icons/speed.svg", gap*4.1);



    translate([1.5, 9, -1])
      linear_extrude(boardHeight+2)
        text(" 2   3   3   4", font="RobotoMono", valign="top", size=6);
  }
}

board();
