// Event created by Avis.
event_inherited()




x += hsp
y += vsp

hsp *= .995
vsp *= .995
//

if mouse_check_button(mb_left) {
	motion_add_custom(point_direction(x,y,mouse_x,mouse_y),.2)	
}

keep_in_room(4)