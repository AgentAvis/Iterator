// Event created by Avis.
event_inherited()

y = mouse_y
x = mouse_x

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
	}

	if x < can_x - (213-spacing) { 
		x = can_x - (213-spacing)
	}

	if y > can_y + (213-spacing) { 
		y = can_y + (213-spacing)
	}

	if y < can_y - (213-spacing) { 
		y = can_y - (213-spacing)
	}

	

#endregion