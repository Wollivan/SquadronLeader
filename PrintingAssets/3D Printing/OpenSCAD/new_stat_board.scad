include <variables.scad>;

boardWidth = 45;//(tokenWidth * 2) - 2;
boardLength = 22.5;//tokenWidth - 2;
boardHeight = 4;

gap = 2;
statHeight = 2;
statWidth = (boardWidth - (gap * 5)) / 5;
healthWidth = (boardLength - (gap * 5)) / 4;
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

module healthHole(x) {
  translate([gap,x,statHeight])
    cube([healthWidth, healthWidth, statHeight*2]);

  translate([healthWidth/4+gap,x+healthWidth/4,-1])
    cube([healthWidth/2, healthWidth/2, boardHeight+2]);
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


    hole(gap*5);
    hole(gap*6+statWidth);
    hole(gap*7+statWidth*2);
    hole(gap*8+statWidth*3);

    healthHole(gap);
    healthHole(gap*2+healthWidth);
    healthHole(gap*3+healthWidth*2);
    healthHole(gap*4+healthWidth*3);


    symbol(0.5, "icons/health.svg", (gap*4.5)+0.75, boardLength/1.5-(gap/3));
    symbol(0.45, "icons/defense.svg", (gap*5.5)+statWidth+1.25, boardLength/1.5-(gap/3));
    symbol(0.55, "icons/attack.svg", (gap*6.5)+statWidth*2.05, boardLength/1.5-(gap/2));
    symbol(0.5, "icons/speed.svg", (gap*7.5)+statWidth*3+1.25, boardLength/1.5);
  }
}

module allTiles() {
  translate([0, healthWidth/2,0]) scale([0.45,0.45,1]) tile("");
  translate([statWidth+gap/2,0,0]) tile("2");
  translate([(statWidth+gap/2)*2,0,0]) tile("3");
  translate([(statWidth+gap/2)*3,0,0]) tile("3");
  translate([(statWidth+gap/2)*4,0,0]) tile("4");
}