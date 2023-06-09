$fn=100;
wheelWidth = 10;
wheelDia = 20;

sideSize = wheelDia*1.1;

axelDia= wheelDia/3;
axelLength = wheelWidth*4+(wheelWidth/2);

textHeight = 5;

magnetDia = 5;
magnetHeight = 5;

sideNum = 5;
axelSides = 10;

springLength = wheelDia*0.8; // determined empirically
springWidth = 1.2; // determined arbitrarily, adjust for feel
springOffset = axelDia/2*sin(2*360/10); // determined with magic


// output
// sideWAxel();
// translate([0,sideSize+10,0]) sideWHole();
translate([0,-sideSize-10,0]) wheel();
// translate([0,0,wheelWidth]) wheel(); // test

// axelTest();



module axel(mod){
  rotate([0,0,18])
    cylinder(h=axelLength, d=axelDia, $fn=axelSides);
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

module numbers() {
    rotate([0,0,36])
        for (n=[0:sideNum-1])
        rotate ([0,0,(n-1)*360/sideNum])
            translate([wheelDia/3,-wheelWidth/2.6,wheelWidth*0.79])
                rotate([0,90,0])
                    linear_extrude(4)
                        text(str(n), size=8);
}

module wheel() {
  rotate([0,0,-53]) // used just to determine where the arrow should go
      union() {
          difference(){
            cylinder($fn=100, h=wheelWidth, d=wheelDia);

            translate([0,0,-1])
            cylinder(h=wheelWidth+2, d=axelDia*2);
              

          }
          springs();
          numbers();
      }
}

module side () {
  tran = sideSize/3.5;
    difference () {
        // Outer hull
        hull () {
            translate ([tran,tran,0])
              cylinder (r=5,h=wheelWidth);

            translate ([-tran,tran,0])
              cylinder (r=5,h=wheelWidth);


            translate ([tran,-tran,0])
              cylinder (r=5,h=wheelWidth);
            translate ([-tran,-tran,0])
              cylinder (r=5,h=wheelWidth);


            // translate ([wheelWidth,box_width-wheelWidth,0])
            //   box_outer_cylinder();
            // translate ([box_length-wheelWidth,box_width-wheelWidth,0])
            //   box_outer_cylinder();
            // translate ([box_length-wheelWidth,wheelWidth,0])
            //   box_outer_cylinder();
        }
        // arrow
        translate([0,-sideSize/2+1,wheelWidth/2-1])
          rotate([90,0,0]) rotate([0,0,90])
              cylinder($fn=3, h=2, r=3);
    }
}

module sideold(){
        difference(){
          translate([-sideSize/2,-sideSize/2,0])
            cube([sideSize,sideSize,wheelWidth]);
                
            // arrow
            translate([0,-sideSize/2+1,wheelWidth/2-1])
                rotate([90,0,0]) rotate([0,0,90])
                    cylinder($fn=3, h=2, r=3);
            
        }
}

//Side #1
module sideWAxel() {
  union() {
      side();

      translate([0,0,wheelWidth])
      axel();
  }
}

//Side #2
module sideWHole() {
      difference() {
          side();
          translate([0,0,wheelWidth/2])
              axel();
      }
}









//Test only the axis fit before wasting plastic on the whole thing
module axelTest() {
  union() {
    difference(){
      cylinder(d=sideSize/1.75, h=wheelWidth);
          
      translate([0,0,-1])
        cylinder(d=sideSize/2, h=wheelWidth+2);
    }

    intersection(){
      cylinder(d=sideSize/1.75, h=wheelWidth);
      
      springs();
    }
  }
  // translate([0,15,0])
    scale([1,1,0.3])
    rotate([0,0,0])
    axel();
}

