include <variables.scad>;
use <fonts/RobotoMono-VariableFont_wght.ttf>

$fn=100;
extra_space=4;
///// -- parameters -- /////////
// Box
wall=2;
boxLength = 102; // x
boxWidth = 84; // y
boxHeight = 32;
lidLength = boxLength+wall*2;
lidWidth = boxWidth+wall*2;
lidHeight = boxHeight*0.4;


// Small Box
smallBoxLength = 89; // x
smallBoxWidth = 64; // y
smallLidLength = smallBoxLength+wall*2;
smallLidWidth = smallBoxWidth+wall*2;

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

insert_playerX = 26;
insert_playerY = 23;

insert_diceX = 54;
insert_diceY = 30;

insert_statX = 42;
insert_statY = 80;


module insertSection(x, y, tx, ty) {
  translate([tx,ty,-1])
    cube([x,y,boxHeight+2]);
}

module insert() {
  difference() {
    shell(boxWidth-wall*2,boxLength-wall*2,box_radius_in, boxHeight/2);

    // player sections
    insertSection(insert_playerX, insert_playerY, 0, 0);
    insertSection(insert_playerX, insert_playerY, insert_playerX+wall, 0);
    insertSection(insert_playerX, insert_playerY, insert_playerX+wall, insert_playerY+wall);
    insertSection(insert_playerX, insert_playerY, 0, insert_playerY+wall);

    // dice section
    insertSection(insert_diceX, insert_diceY, 0, insert_playerY*2+wall*2);

    // stat section
    insertSection(insert_statX, insert_statY, insert_playerX*2+wall*2, 0);
  }
}


insert_diceX_small = 30; // slightly extra so there is no overlap
insert_diceY_small = 48;

insert_statX_small = 85;
insert_statY_small = 10;

module smallInsert() {
  difference() {
    shell(smallBoxWidth-wall*2,smallBoxLength-wall*2,box_radius_in, boxHeight/2);

    // player sections
    insertSection(insert_playerX, insert_playerY, 0, 0);
    insertSection(insert_playerX, insert_playerY, insert_playerX+wall, 0);
    insertSection(insert_playerX, insert_playerY, insert_playerX+wall, insert_playerY+wall);
    insertSection(insert_playerX, insert_playerY, 0, insert_playerY+wall);

    // dice section
    insertSection(insert_diceX_small, insert_diceY_small, insert_playerX*2+wall*2, 0);

    // stat section
    insertSection(insert_statX_small, insert_statY_small, 0, insert_playerY*2+wall*2);
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
module iconInsert() {
  difference() {
    scale([0.95,0.95,0.5])
      thinToken();
    translate([0,1.07, -1])
      scale(1.05) 
        linear_extrude(height = tokenHeight*2) {
            resize([0, 20, 0], auto=true)
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
  translate([len-wall*3, wid/2-10, wall/2])
    rotate([0,0,180]) 
      linear_extrude(height = wall)
        text("Rules:", font="RobotoMono", valign="top", size=6);
            
   translate([len-wall*3, wid/2, wall/2])
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

module box() {
  union(){
    boxNoInsert(boxWidth,boxLength);

    translate([wall,wall,0])
      insert();
  }
}

module lid() {
  difference() {
    shell(lidWidth,lidLength,box_radius_out, lidHeight);

    translate([wall,wall,wall])
      shell(boxWidth,boxLength,box_radius_in, lidHeight);
      lidDesign(lidWidth, lidLength);
  }
}


module smallBox() {
  union(){
    boxNoInsert(smallBoxWidth,smallBoxLength);

    translate([wall,wall,0])
      smallInsert();
  }
}

module smallLid() {
  difference() {
    shell(smallLidWidth,smallLidLength,box_radius_out, lidHeight);

    translate([wall,wall,wall])
      shell(smallBoxWidth,smallBoxLength,box_radius_in, lidHeight);
      lidDesign(smallLidWidth, smallLidLength);
  }
}




translate([0,boxWidth+10,0]) lid();
// box();
// boxNoInsert();
// insert();
// smallBox();
// translate([0,smallBoxWidth+10,0])  smallLid();

// rotate([0,180,0]) iconInsert();