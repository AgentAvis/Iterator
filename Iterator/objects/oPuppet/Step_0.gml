// Event created by Avis.
event_inherited()

//y = lerp(y,mouse_y,.2)
//x = lerp(x,mouse_x,.2)

dhsp = 0
dvsp = 0

if keyboard_check(vk_up) or keyboard_check(ord("W")) {
	dvsp = -mspd	
}
if keyboard_check(vk_down) or keyboard_check(ord("S")) {
	dvsp = mspd	
}
if keyboard_check(vk_right) or keyboard_check(ord("D")) {
	dhsp = mspd	
}
if keyboard_check(vk_left) or keyboard_check(ord("A")) {
	dhsp = -mspd	
}
hsp = lerp(hsp,dhsp,.2)
vsp = lerp(vsp,dvsp,.2)

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

	

#endregion
