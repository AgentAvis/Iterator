// Event created by Avis.
event_inherited()

if other = lastcol_obj { col_cooldown -- if col_cooldown <= 0 { lastcol_obj = noone } exit; } else { lastcol_obj = other col_cooldown = max_col_cooldown }

/*
av_hsp = (hsp+other.hsp)/2
av_vsp = (vsp+other.vsp)/2

new_dir = point_direction(0,0,av_hsp,av_vsp)
new_spd = point_distance(0,0,av_hsp,av_vsp)

motion_set_custom(new_dir,new_spd)
with (other) {
	motion_set_custom(other.new_dir+180,other.new_spd)	
}

*/
var _col_ang = angle_lerp(point_direction(x,y,other.x,other.y),angle_lerp(get_direction(),get_direction(other),.5),.5); //find an angle half way between the direction both objects are moving in

var _col_spd = ((get_speed()+get_speed(other))/2)*.9 //find the average speed of both objects



motion_set_custom(_col_ang+180,_col_spd) //set my direction to 180 degrees the average, and set my spd to avg spd
with (other) {
	motion_set_custom(_col_ang,_col_spd) //set other object's speed
}

/* */

if x = other.x and y = other.y {
	x += random_range(-.001,.001)	
	y += random_range(-.001,.001)
	
	other.x += random_range(-.001,.001)
	other.y += random_range(-.001,.001)
}

x -= (dcos(point_direction(x,y,other.x,other.y)))
y += (dsin(point_direction(x,y,other.x,other.y)))
	

/*
if col_cooldown <= 0 {

	//var m2 = other.mass;
	//var m1 = mass;
	//vsp = -(vsp*(m1 - m2)/(m1+m2)) + (other.vsp*2*m2/(m1+m2) )
	//hsp = -(hsp*(m1 - m2)/(m1+m2)) + (other.hsp*2*m2/(m1+m2))
	
	//other.vsp = -(other.vsp*(m1 - m2)/(m1+m2)) + (vsp*2*m2/(m1+m2) ) 
	//other.hsp = -(other.hsp*(m1 - m2)/(m1+m2)) + (hsp*2*m2/(m1+m2))


// Step event code for Object1
// This object is moving towards other


    // Calculate velocity vectors for both objects
    var v1x = hsp;
    var v1y = vsp;
    var v2x = other.hsp;
    var v2y = other.vsp;
    
    // Calculate center of mass velocity
    var cmvx = (v1x + v2x) / 2;
    var cmvy = (v1y + v2y) / 2;
    
    // Calculate relative velocity
    var rvx = v1x - v2x;
    var rvy = v1y - v2y;
    
    // Calculate dot product of relative velocity and vector between objects
    var dot = rvx * (x - other.x) + rvy * (y - other.y);
    
    // Calculate elasticity coefficient
    var e = 1; // Change this value for different levels of elasticity
    
    // Calculate impulse vector
    var impulseX = ((1 + e) * dot * (x - other.x)) / distance_squared(x, y, other.x, other.y);
    var impulseY = ((1 + e) * dot * (y - other.y)) / distance_squared(x, y, other.x, other.y);
    
    // Apply impulse to both objects
    hsp = -(impulseX*other.mass);
    vsp = -(impulseY*other.mass);
    other.hsp = impulseX*mass;
    other.vsp = impulseY*mass;

	col_cooldown = 100
	
}
	
//}
