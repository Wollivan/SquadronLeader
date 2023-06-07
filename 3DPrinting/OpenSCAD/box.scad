include <variables.scad>;
use <fonts/RobotoMono-VariableFont_wght.ttf>



$fn=100;
extra_space=4;
tolerance = 0.8;
///// -- parameters -- /////////
// Box
wall=2;
boxLength = 113;
boxWidth = 79;
boxHeight = 32;

lidLength = boxLength+wall*2;
lidWidth = boxWidth+wall*2;

box_radius_out=5;  // outer corner radius
box_radius_in=3;   // inner corner radius


// Create box
module box_cylinder (radius, height) {
  cylinder (r=radius,h=height);
}




module shell (width, length, radius, height) {
  difference () {
    // Outer hull
    hull () {
      translate ([radius,radius,0])
        box_cylinder(radius, height);
      translate ([radius,width-radius,0])
        box_cylinder(radius, height);
      translate ([length-radius,width-radius,0])
        box_cylinder(radius, height);
      translate ([length-radius,radius,0])
        box_cylinder(radius, height);
    }
  }
}

playerWidth = 28;
diceWidth = 58;
diceLength = 24;

healthWidth = 75;
healthLength = 23;

rulerWidth = 15;
rulerLength = 84;

module insertSection(x, y, tx, ty) {
  translate([tx,ty,-1])
    cube([x,y,boxHeight+2]);
}
module insert() {
  difference() {
    shell(boxWidth-wall*2,boxLength-wall*2,box_radius_in, tokenHeight*4);

    // player spaces
    insertSection(playerWidth, playerWidth, 0, 0);
    insertSection(playerWidth, playerWidth, playerWidth+wall, 0);
    insertSection(playerWidth, playerWidth, playerWidth+wall, playerWidth+wall);
    insertSection(playerWidth, playerWidth, 0, playerWidth+wall);

    // range ruler
    insertSection(rulerLength, rulerWidth, 0, playerWidth*2+wall*2);

    // dice/stats
    insertSection(diceLength, diceWidth, playerWidth*2+wall*2, 0);

    // health
    insertSection(healthLength, healthWidth, playerWidth*2+wall*3+diceLength, 0);
  }
}

module thinToken(){
    translate([0,0,0])
    //cube([tokenWidth,tokenWidth,tokenHeight], true); 
    rotate([0,0,135/2])
        cylinder(h=wall, d=tokenWidth, $fn=8); 
}

module tokenIcon() {
  difference() {
    thinToken();
    translate([0,1.07, -1])
                linear_extrude(height = tokenHeight*2) {
                    resize([0, 20, 0], auto=true)
            // rotate([0,0,-90])
                        import("icons/plane-model.svg", center=true);
                }
  }
}

module lidDesign() {
  translate([lidLength/1.25, lidWidth/1.6,-wall/2])
    tokenIcon();
  translate([wall*2, 10.5+wall*3, -0.1])
      linear_extrude(height = wall/2)
          mirror([0, 1, 0])
              text("Squadron", valign="bottom", font="RobotoMono");
  translate([wall*2, 12.5+wall*3, -0.1])
      linear_extrude(height = wall/2)
          mirror([0, 1, 0])
              text("Leader", valign="top");

  translate([wall*2, lidWidth-10, -0.1])
      linear_extrude(height = wall/2)
          mirror([0, 1, 0])
              text("A Game by Tim Smith", font="RobotoMono", valign="top", size=6);

}

module boxNoInsert() {
  difference() {
    shell(boxWidth,boxLength,box_radius_out, boxHeight);

    translate([wall,wall,wall])
      shell(boxWidth-wall*2,boxLength-wall*2,box_radius_in, boxHeight);
  }
}

module box() {
  union(){
    boxNoInsert();

    translate([wall,wall,0])
      insert();
  }
}



module lid() {
  difference() {
    shell(lidWidth,lidLength,box_radius_out, boxHeight*0.3);

    translate([wall,wall,wall])
      shell(boxWidth,boxLength,box_radius_in, boxHeight*0.3);
      lidDesign();
  }
}

translate([0,boxWidth+10,0]) lid();
box();
// boxNoInsert();
// insert();