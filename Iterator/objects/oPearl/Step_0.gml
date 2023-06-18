// Event created by Avis.
event_inherited()

var _pickup_range = 120;
cursor_alpha = (.5+((.5+(cos((oDj.timestep)/(oPuppet.breathing_rate/8))/2))/2))/2
grasp_size = 7

if !relocate_mode && !orbit_mode{
	drag = 0.995
}
	

motion_set_custom(get_direction(),get_speed()*drag)




//drags pearl towards cursor, maintaining motion once selected pearl is released 
if relocate_mode = true {
	
	var _dis = point_distance(x,y,oCrosshair.x,oCrosshair.y)
	motion_add_custom(point_direction(x,y,oCrosshair.x,oCrosshair.y),clamp(_dis,0,mspd))	
	
	if _dis < 16 {
			drag = 0.9
	}
	
	if mouse_check_button_pressed(mb_left) {
		pearl_exit()	
		relocate_mode = false
	}
}

if set_orbit = true {
	if mouse_check_button_pressed(mb_right) {
		pearl_exit();
		set_orbit = false;
	}
	}

if orbit_mode{
	orbit_angle += orbit_speed
	if orbit_angle >= 360 {orbit_angle -= 360}
	target_x = lengthdir_x(orbit_dis, orbit_angle) + orbit_target.x
	target_y = lengthdir_y(orbit_dis, orbit_angle) + orbit_target.y
	
	var _dis = point_distance(x,y,target_x,target_y)
	motion_add_custom(point_direction(x,y,target_x,target_y),clamp(_dis,0,mspd))

	if _dis < 16 {
		drag = 0.9
	}
	if relocate_mode{
		orbit_mode = false
	}
}




col_cooldown --	

x += hsp
y += vsp

//hsp *= functional_drag
//vsp *= functional_drag
//

//if mouse_check_button(mb_left) {
//	motion_add_custom(point_direction(x,y,mouse_x,mouse_y),.2)	
//}

keep_in_room(1)

//if program = "pearl_creator" {
//	//pearl gen code	
//}