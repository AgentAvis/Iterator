if !instance_exists(global.focus) { mode = 1 }

if instance_exists(global.focus) { mode = 2 target = global.focus }
mouse_lerp_mag = 0;

if room = rMenu { mode = 3}

if mode = 1 {
	//setup other movement related stuff
	rspd = mspd * true_zoom_level //regular speed 
	if keyboard_check(vk_shift)		{ rspd *=	 2 }
	if keyboard_check(vk_control)	{ rspd *=	.5 }
	var _dhsp = 0;
	var _dvsp = 0;
	var m	  = false;
	
	if !oConsole.console_status {
		if keyboard_check(ord("W")){ _dvsp -= rspd	m = true	} //if keyboard_check(vk_up)	+ keyboard_check(ord("W")){ _dvsp -= rspd	m = true	} 
		if keyboard_check(ord("S")){ _dvsp += rspd	m = true	}//if keyboard_check(vk_down)	+ keyboard_check(ord("S")){ _dvsp += rspd	m = true	} 
		if keyboard_check(ord("A")){ _dhsp -= rspd	m = true	} //if keyboard_check(vk_left)  + keyboard_check(ord("A")){ _dhsp -= rspd	m = true	} 
		if keyboard_check(ord("D")){ _dhsp += rspd	m = true	}	//if keyboard_check(vk_right) + keyboard_check(ord("D")){ _dhsp += rspd	m = true	}	
	}
	
	if m {
		tarx += _dhsp
		tary += _dvsp
	}
	/*
	if input_up or keyboard_check(vk_up) { tary -= rspd } 
	if input_down or keyboard_check(vk_down) { tary += rspd } 
	if input_left or keyboard_check(vk_left) { tarx -= rspd } 
	if input_right or keyboard_check(vk_right) { tarx += rspd }
	*/
	//}
}


if mode = 2 {
	if instance_exists(target) {
		tarx = target.x
		tary = target.y
	} else {
		mode = 1
	}
}
	
if mode = 3 {
	tarx = room_width/2
	tary = room_height/2
	
}

if room = rGame {
	//global.focus = oCan_cam
}



#region mouselerp/move actual camera x/y code code
if !global.staticcam {
	if mouselerp {
		x = lerp(lerp(x,tarx,lerpspeed),mouse_x,mouse_lerp_mag)
		y = lerp(lerp(y,tary,lerpspeed),mouse_y,mouse_lerp_mag)
	} else {
		x = lerp(x,tarx,lerpspeed)
		y = lerp(y,tary,lerpspeed)
	}
}
#endregion

//Get target view size. size is halved so the view will focus around its center
var vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
var vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

#region room clamp inside code
offset = 0
if global.camera_clamp_in_room {
	x = clamp(x,
	0+(camera_get_view_width(view_camera[0])/2) + offset,
	room_width-(camera_get_view_width(view_camera[0])/2) - offset,
	)

	y = clamp(y,
	0+(camera_get_view_height(view_camera[0])/2) + offset,
	room_height-(camera_get_view_height(view_camera[0])/2) - offset,
	)
}

#endregion

camera_set_view_pos(view_camera[0], x - vpos_w, y - vpos_h);