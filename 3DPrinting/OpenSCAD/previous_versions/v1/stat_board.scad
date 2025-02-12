include <variables.scad>;

boardWidth = 45;//(tokenWidth * 2) - 2;
boardLength = 22.5;//tokenWidth - 2;
boardHeight = 4;

gap = 2;
statHeight = 2;
statWidth = (boardWidth - (gap * 5)) / 4;
healthWidth = (boardLength - (gap * 5)) / 4;
tolerance = 0.3;

board();
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


    symbol(0.5, "icons/health.svg", (gap)+0.75, boardLength/1.5-(gap/3));
    symbol(0.45, "icons/defense.svg", (gap*2)+statWidth+1.25, boardLength/1.5-(gap/3));
    symbol(0.55, "icons/attack.svg", (gap*3)+statWidth*2.05, boardLength/1.5-(gap/2));
    symbol(0.5, "icons/speed.svg", (gap*4)+statWidth*3+1.25, boardLength/1.5);
  }
}

module allTiles() {
  translate([gap+tolerance/2,-statWidth-2,0])
    union() {
      translate([0,0,0]) tile("2");
      translate([statWidth+gap,0,0]) tile("3");
      translate([statWidth*2+gap*2,0,0]) tile("3");
      translate([statWidth*3+gap*3,0,0]) tile("4");
    }
}