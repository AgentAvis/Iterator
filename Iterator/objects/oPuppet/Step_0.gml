// Event created by Avis.
event_inherited()

//y = lerp(y,mouse_y,.2)
//x = lerp(x,mouse_x,.2)

dhsp = 0
dvsp = 0

dimage_angle = 0

var _up = false;
var _down = false;
var _left = false;
var _right = false;

light.x = x
light.y = y

m = false

if keyboard_check(vk_up) or keyboard_check(ord("W")) {
	dvsp = -mspd
	_up = true
	m = true;
}
if keyboard_check(vk_down) or keyboard_check(ord("S")) {
	dvsp = mspd	
	_down = true;
	m = true;
}
if keyboard_check(vk_right) or keyboard_check(ord("D")) {
	dhsp = mspd	
	_right = true
	m = true;
}
if keyboard_check(vk_left) or keyboard_check(ord("A")) {
	dhsp = -mspd	
	_left = true
	m = true;
}

if (_up and _right) or (_down and _right)  {
	dimage_angle = 10	
}
if (_up and _left) or (_down and _left) {
	dimage_angle = -10
}

image_angle = lerp(image_angle,dimage_angle,.05)



if m {
	hsp = lerp(hsp,dhsp,.3)
	vsp = lerp(vsp,dvsp,.3)
} else {
	hsp = lerp(hsp,dhsp,.05)
	vsp = lerp(vsp,dvsp,.05)		
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

lightcolor = make_color_hsv(oDj.timestep mod 255,255,200)
light.image_blend = c_white
oLighting.image_blend = lightcolor

#endregion
