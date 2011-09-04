// PRUSA Mendel  
// Parametric Wade extruder bracket based on nopheads work. Thank you mate!
// http://www.thingiverse.com/thing:3462
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

long_side = 40;
short_side = 60;
corners_diameter = 8;
corn_fn = corners_diameter*5;
height= 36;
608_dia = 22.5;
608_height = 7.2;
mounting_dist_short = 13;
mounting_dist_long = 27;
mounting_dia = m4_diameter/2;
gesamtbolzenlaenge=55;
mutternhoehe=5.5;
sechskanthoehe=5;
mutternausschnitt=16;
bolzenlaenge=50;
stegbreite=3;
Abstand=18.5;

module wadeidler() {difference(){
// Main block
union(){
translate(v=[0,0,height/2]) cube(size = [long_side,short_side-2*corners_diameter,height], center = true);
translate(v=[0,0,height/2]) cube(size = [long_side-2*corners_diameter,short_side,height], center = true);

translate(v=[(long_side/2-corners_diameter),(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
translate(v=[-(long_side/2-corners_diameter),(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
translate(v=[(long_side/2-corners_diameter),-(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
translate(v=[-(long_side/2-corners_diameter),-(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
}

// bearing cutout
translate(v=[0,0,height-20]){
	
	rotate(a=[90,0,0]) cylinder(h = gesamtbolzenlaenge+20, r=mutternausschnitt/2, center=true);
	translate(v=[0,gesamtbolzenlaenge/2-sechskanthoehe/2-608_height/2,0]){ //lagersitze
          rotate(a=[90,0,0]) cylinder(h = 608_height, r=608_dia/2,center=true);
          translate(v=[0,0,608_dia]){cube(size=[608_dia,608_height, height],center=true);
          translate(v=[0,sechskanthoehe,0])cube(size=[mutternausschnitt,sechskanthoehe+1.5],center=true);
          cube(size=[16,20,40],center=true);          
}
          translate(v=[0,-gesamtbolzenlaenge+1+2*608_height+sechskanthoehe+stegbreite,608_dia]){cube(size=[608_dia,gesamtbolzenlaenge-sechskanthoehe-stegbreite, height],center=true);}
       translate(v=[-long_side/2,-Abstand+sechskanthoehe+stegbreite,6]){ //lagersitz werkzeug
        rotate(a=[90,0,90]) cylinder(h =8, r=608_dia/2);
        translate (v=[0,-608_dia/2,0]){
        cube(size=[8,608_dia,100]);
        translate ([2,608_dia/2-5,-8]){cube(size=[9,10,100]);}
        translate ([35,-30,-30]){cube(size=[9,short_side+10,100]);}

}
}
         	}
        translate(v=[0,gesamtbolzenlaenge/2-stegbreite-608_height-2,0]){ //lagersitze
        rotate(a=[90,0,0]) cylinder(h=gesamtbolzenlaenge-608_height-sechskanthoehe-stegbreite, r=608_dia/2);}

}


}
}
use <inc/mendel_misc.inc>




translate([10,10])rotate([0,0,90])wadeidler();
%cube([98,85,0.01],center=true);

