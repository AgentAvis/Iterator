// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keep_in_room(_spacing){
	var _can_x = oCan.x+(oCan.sprite_width/2)
	var _can_y = oCan.y+(oCan.sprite_width/2)

	var _desired_angle = point_direction(_can_x,_can_y,x,y);
	
	var _max_dis = (oCan.sprite_width/2)-_spacing;

	var _current_dis = point_distance(_can_x,_can_y,x,y)
	
	var _desired_dis = clamp(_current_dis,0,_max_dis);


	dcart_angle = _desired_angle;
	var _ox = x;
	var _oy = y;

	x = _can_x + lengthdir_x(_desired_dis,_desired_angle)
	y = _can_y + lengthdir_y(_desired_dis,_desired_angle)
	
	var _adjusted = false;
	
	if x > _can_x + (213-_spacing) { 
		x = _can_x + (213-_spacing)
		hsp = -(hsp/2)
		_adjusted = true;
	}

	if x < _can_x - (213-_spacing) { 
		x = _can_x - (213-_spacing)
		hsp = -(hsp/2)
		_adjusted = true;
	}

	if y > _can_y + (213-_spacing) { 
		y = _can_y + (213-_spacing)
		vsp = -(vsp/2)
		_adjusted = true;
	}

	if y < _can_y - (213-_spacing) { 
		y = _can_y - (213-_spacing)
		vsp = -(vsp/2)
		_adjusted = true;
	}
	if !_adjusted {
		if _current_dis > _max_dis {
			var _tspd = get_speed();
			var _tdir = point_direction(x,y,_can_x,_can_y);
			
			motion_set_custom(_tdir,_tspd/2)
			
		}
	}
}

function keep_in_room_simple(_spacing) {
	var _can_x = oCan.x+(oCan.sprite_width/2)
	var _can_y = oCan.y+(oCan.sprite_width/2)

	var _desired_angle = point_direction(_can_x,_can_y,x,y);
	
	var _max_dis = (oCan.sprite_width/2)-_spacing;

	var _current_dis = point_distance(_can_x,_can_y,x,y)
	
	var _desired_dis = clamp(_current_dis,0,_max_dis);


	dcart_angle = _desired_angle;
	var _ox = x;
	var _oy = y;

	x = _can_x + lengthdir_x(_desired_dis,_desired_angle)
	y = _can_y + lengthdir_y(_desired_dis,_desired_angle)
	

	
	if x > _can_x + (213-_spacing) { 
		x = _can_x + (213-_spacing)
	}

	if x < _can_x - (213-_spacing) { 
		x = _can_x - (213-_spacing)
	}

	if y > _can_y + (213-_spacing) { 
		y = _can_y + (213-_spacing)
	}

	if y < _can_y - (213-_spacing) { 
		y = _can_y - (213-_spacing)
	}
}