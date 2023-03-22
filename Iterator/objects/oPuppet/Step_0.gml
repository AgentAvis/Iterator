// Event created by Avis.
event_inherited()

//y = lerp(y,mouse_y,.2)
//x = lerp(x,mouse_x,.2)

dhsp = 0
dvsp = 0

//dimage_angle = 0
m = false

manual_move = true
global.focus = id;

if !instance_exists(oEditor) {
	can_move = true	
}

if manual_move and can_move {
	var _up = false;
	var _down = false;
	var _left = false;
	var _right = false;


	//if keyboard_check(vk_shift) or true {
		if keyboard_check(ord("W")) {
			dvsp = -mspd
			_up = true
			m = true;
		}
		if keyboard_check(ord("S")) {
			dvsp = mspd	
			_down = true;
			m = true;
		}
		if keyboard_check(ord("D")) {
			dhsp = mspd	
			_right = true
			m = true;
		}
		if keyboard_check(ord("A")) {
			dhsp = -mspd	
			_left = true
			m = true;
		}
	//}
	if (_up and _right) or (_down and _right)  {
		//dimage_angle = 10	
	}
	if (_up and _left) or (_down and _left) {
		//dimage_angle = -10
	}

	//image_angle = lerp(image_angle,dimage_angle,.05)
} else {
	//desired_x = x
	//desired_y = y
	desired_mouse_dis = 48
	error = 16*6
	
	mouse_dis = point_distance(x,y,mouse_x,mouse_y);
	//if (mouse_dis > (desired_mouse_dis + error )) {
		
		//I wanna move closer to the desired point	
		
		//find desired point
		desired_dir = point_direction(x,y,mouse_x,mouse_y)
		
			desired_x = lerp(desired_x,x + lengthdir_x(mouse_dis-desired_mouse_dis,desired_dir),.1)
			desired_y = lerp(desired_y,y + lengthdir_y(mouse_dis-desired_mouse_dis,desired_dir),.1)

	//}	
	
	desired_point_dis = point_distance(desired_x,desired_y,x,y)
	
	if (mouse_dis < (desired_point_dis)) {
		//d_dir = point_direction(desired_x,desired_y,x,y)
		//desired_x += lengthdir_x(1,desired_dir)
		//desired_y += lengthdir_y(1,desired_dir)	
		
	}
	
	
	dis_to_desired_point = point_distance(x,y,desired_x,desired_y)
	
	if dis_to_desired_point < error {
		hsp = lerp(hsp,0,.025)
		vsp = lerp(vsp,0,.025)
	} else {
		m = true
		hsp = lerp(hsp,lengthdir_x(clamp(mspd,0,dis_to_desired_point),desired_dir),.05)
		vsp = lerp(vsp,lengthdir_y(clamp(mspd,0,dis_to_desired_point),desired_dir),.05)
	}
}


light.x = x
light.y = y-16
if can_move { //disabled when editor is open
	if get_speed() > mspd/2 or m {
	
		image_angle = angle_lerp(image_angle,get_direction(),.1)
	
		hsp = lerp(hsp,dhsp,.3)
		vsp = lerp(vsp,dvsp,.3)
	} else {
		//image_angle = angle_lerp(image_angle,0,.1,.001)
		hsp = lerp(hsp,dhsp,.05)
		vsp = lerp(vsp,dvsp,.05)		
	}
}
x += hsp;
y += vsp;

spacing = 24

//x = clamp(mouse_x,oCan.x+(65+spacing),oCan.x+(493-spacing))
//y = clamp(mouse_y,oCan.y+(65+spacing),oCan.y+(493-spacing))


#region cart

	can_x = oCan.x+(oCan.sprite_width/2)
	can_y = oCan.y+(oCan.sprite_width/2)

	desired_angle = point_direction(can_x,can_y,x,y)

	desired_dis = clamp(point_distance(can_x,can_y,x,y),0,(oCan.sprite_width/2)-spacing)


	dcart_angle = desired_angle;

	x = can_x + lengthdir_x(desired_dis,desired_angle)
	y = can_y + lengthdir_y(desired_dis,desired_angle)

	if x > can_x + (213-spacing) { 
		x = can_x + (213-spacing)
		hsp = 0
	}

	if x < can_x - (213-spacing) { 
		x = can_x - (213-spacing)
		hsp = 0
	}

	if y > can_y + (213-spacing) { 
		y = can_y + (213-spacing)
		vsp = 0
	}

	if y < can_y - (213-spacing) { 
		y = can_y - (213-spacing)
		vsp = 0
	}

lightcolor = merge_color(c_aqua,c_orange,.25+(.5+(sin(oDj.timestep/60)/2))/2)//make_color_hsv(oDj.timestep mod 255,255,200)
light.image_blend = lightcolor
light.image_alpha = .5
oCart.image_blend = merge_color(lightcolor,c_white,.5)
oArm.image_blend = lightcolor
oCan.image_blend = lightcolor
oCan_bottom.image_blend = lightcolor
//oLighting.image_blend = lightcolor

#endregion
