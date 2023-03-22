// Event created by Avis.
event_inherited()

with (oPuppet) {
	//x = oCan.can_x
	//y = oCan.can_y
	var _dis = point_distance(x,y,oCan.can_x,oCan.can_y);
	var _len = clamp(_dis,0,.25);
	var _dir = point_direction(x,y,oCan.can_x,oCan.can_y);
	
	hsp += lengthdir_x(_len,_dir)
	vsp += lengthdir_y(_len,_dir)
	
	if _dis < 4 and get_speed()<1 {
		x = oCan.can_x
		y = oCan.can_y
		hsp = 0
		vsp = 0
	}
	
	image_angle = angle_lerp(image_angle,90,.05)
	
	can_move = false
}