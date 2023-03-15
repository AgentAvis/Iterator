/// @desc update
//x = xstart+lengthdir_x(200,current_time*0.1);
//y = ystart+lengthdir_y(200,current_time*0.1);

ik_chain_tug_forward(chain,oPuppet.x,oPuppet.y);
ik_chain_tug_backward(chain,x,y);

#region cart

	can_x = oCan.x+(oCan.sprite_width/2)
	can_y = oCan.y+(oCan.sprite_width/2)

	if point_distance(x,y,oPuppet.x,oPuppet.y) > oCan.sprite_width/2 or d_desired_angle = 0 {	
		d_desired_angle = point_direction(can_x,can_y,oPuppet.x,oPuppet.y)
	}
	//desired_angle = angle_lerp(desired_angle,d_desired_angle,.005)
	var _diff = angle_difference(d_desired_angle, desired_angle);
	
	if _diff < 5 {
		_diff = 0	
	}
	
	angle_speed = clamp(lerp(angle_speed,_diff,.1),-1,1);
	//desired_angle += clamp(_diff,-1,1);
	desired_angle += angle_speed;
	
	desired_dis = oCan.sprite_width/2


	dcart_angle = desired_angle;
	

	x = can_x + lengthdir_x(desired_dis,desired_angle)
	y = can_y + lengthdir_y(desired_dis,desired_angle)

	if x > can_x + (213) { 
		x = can_x + (213)
		dcart_angle = 0
	}

	if x < can_x - (213) { 
		x = can_x - (213)
		dcart_angle = 180
	}

	if y > can_y + (213) { 
		y = can_y + (213)
		dcart_angle = 270
	}

	if y < can_y - (213) { 
		y = can_y - (213)
		dcart_angle = 90
	}
	cart_angle = angle_lerp(cart_angle,dcart_angle,.3)

#endregion