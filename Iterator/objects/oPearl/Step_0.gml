// Event created by Avis.
event_inherited()

functional_drag = drag




if relocate_mode = true {
	var _dis = point_distance(x,y,oCrosshair.x,oCrosshair.y)
	motion_add_custom(point_direction(x,y,oCrosshair.x,oCrosshair.y),clamp(_dis,0,mspd)/2)	
	functional_drag = .99
	if _dis < 16 {
		functional_drag = .8	
	}
	if mouse_check_button_pressed(mb_left) {
		pearl_exit()	
		relocate_mode = false
		if point_distance(x,y,oCrosshair.x,oCrosshair.y) < 16 {
			//hsp = 0
			//vsp = 0
		}
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