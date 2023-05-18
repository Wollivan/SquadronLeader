include <variables.scad>;

boardWidth = (tokenWidth * 2) - 2;
boardLength = tokenWidth - 2;
boardHeight = 3;

gap = 2;
statHeight = 1.5;
statWidth = (boardWidth - (gap * 5)) / 4;
tolerance = 0.4;

board();
translate([gap+tolerance/2,-statWidth-2,0])
allTiles();

module tile(number) {
  difference() {
    cube([statWidth-tolerance, statWidth-tolerance, statHeight]);
    
    translate([statWidth/4-tolerance/1.5,statWidth/5,-1])
    linear_extrude(statHeight+2)
      text(number,statWidth/2,font="Verdana:style=Bold");
  }
}
module hole(x) {
  translate([x,gap,statHeight])
    cube([statWidth, statWidth, statHeight*2]);

  translate([x+statWidth/4,gap+statWidth/4,-1])
    cube([statWidth/2, statWidth/2, boardHeight+2]);
}
module symbol(s, path, x, z) {
  translate([x,z-gap,-1])
      linear_extrude(height = boardHeight+2) {
          scale(s)
              import(path);
      }
}

module board() {
  difference() {
    cube([boardWidth, boardLength, boardHeight]);


    hole(gap);
    hole(gap*2+statWidth);
    hole(gap*3+statWidth*2);
    hole(gap*4+statWidth*3);


    symbol(0.6, "icons/health.svg", gap+0.5, boardLength/1.5-(gap/3));
    symbol(0.55, "icons/defense.svg", (gap*2)+statWidth+1, boardLength/1.5-(gap/3));
    symbol(0.65, "icons/attack.svg", (gap*3)+statWidth*2, boardLength/1.5-(gap/2));
    symbol(0.6, "icons/speed.svg", (gap*4)+statWidth*3+1.25, boardLength/1.5);
  }
}

module allTiles() {
  tile("2");
  translate([statWidth+gap,0,0]) tile("3");
  translate([(statWidth+gap)*2,0,0]) tile("3");
  translate([(statWidth+gap)*3,0,0]) tile("4");
}