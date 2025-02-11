include <variables.scad>;
include <modules.scad>;
use <fonts/RobotoMono-VariableFont_wght.ttf>

$fn=100;
///// -- parameters -- /////////
wall=2;
boxHeight = 27;
lidHeight = boxHeight*0.4;
boxLength = 89; // x
boxWidth = 65; // y
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


module insertSection(x, y, tx, ty) {
  translate([tx,ty,-1])
    cube([x,y,boxHeight+2]);
}

insert_playerX = 53;
insert_playerY = 53;

insert_diceX = 30; // slightly extra so there is no overlap
insert_diceY = 53;

insert_rulerX = 85;
insert_rulerY = 6;

module insert() {
  difference() {
    shell(boxWidth-wall*2, boxLength-wall*2,box_radius_in, (tokenWidth/4)*2.5+wall); // previous height was boxHeight/2 but now its specific to the range ruler stack

    // player sections
    insertSection(insert_playerX, insert_playerY, 0, 0);

    // dice section
    insertSection(insert_diceX, insert_diceY, insert_playerX+wall, 0);

    // ruler section
    insertSection(insert_rulerX, insert_rulerY, 0, insert_playerY+wall);

    // shorter space between player and dice
    translate([0,0,boxHeight/2+1])
    insertSection(insert_playerX+wall+insert_diceX, insert_playerY, 0, 0);

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

module lidDesign(wid, len) {
  translate([len/1.25, wid/1.6,-wall/2])
    tokenIcon();
  translate([wall*2, 10.5+wall*3, -0.1])
      linear_extrude(height = wall/2)
          mirror([0, 1, 0])
              text("Squadron", valign="bottom", font="RobotoMono");
  translate([wall*2, 12.5+wall*3, -0.1])
      linear_extrude(height = wall/2)
          mirror([0, 1, 0])
              text("Leader", valign="top");
  translate([wall*2, wid-10, -0.1])
    linear_extrude(height = wall/2)
      mirror([0, 1, 0])
        text("Wollivan Games", font="RobotoMono", valign="top", size=5.5);


  // rules
  translate([len-wall*3, wid/4-10, wall/2])
    rotate([0,0,180]) 
      linear_extrude(height = wall)
        text("Rules:", font="RobotoMono", valign="top", size=6);
            
   translate([len-wall*3, wid/4, wall/2])
    rotate([0,0,180]) 
      linear_extrude(height = wall)
        text("sl.wollivan.dev", font="RobotoMono", valign="top", size=6);
}

module boxNoInsert(wid,len) {
  difference() {
    shell(wid,len,box_radius_out, boxHeight);

    translate([wall,wall,wall])
      shell(wid-wall*2,len-wall*2,box_radius_in, boxHeight);
  }
}

module indents() {
  translate([tokenWidth/2+wall/2,tokenWidth/2+wall/2,wall])
    scale([1.05,1.05,1])
      token();
  translate([tokenWidth+tokenWidth/2+wall/2,tokenWidth/2+wall/2,wall])
    scale([1.05,1.05,1])
      token();
  translate([tokenWidth/2+wall/2,tokenWidth*1.5+wall/2,wall])
    scale([1.05,1.05,1])
      token();
  translate([tokenWidth*1.5+wall/2,tokenWidth*1.5+wall/2,wall])
    scale([1.05,1.05,1])
      token();
}

module box() {
  union(){
    difference() {
      boxNoInsert(boxWidth, boxLength);

      translate([1.5,1.5,-1])
        indents();
    }

    translate([wall,wall,0])
      insert();
  }
}

module lid() {
  difference() {
    shell(lidWidth, lidLength, box_radius_out, lidHeight);

    translate([wall,wall,wall])
      shell(boxWidth, boxLength,box_radius_in, lidHeight);
      lidDesign(lidWidth, lidLength);
  }
}

box();
// translate([0, boxWidth+10,0])  lid();
