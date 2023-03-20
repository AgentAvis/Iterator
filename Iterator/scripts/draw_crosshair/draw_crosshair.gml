// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_crosshair(){
	var _sprite = sprite_index;
	var _pickup_range = 120;
	grasp_size = 7
	selection_circle_size = 5
	pearl_halo_base_size = 4
	cursor_alpha = (.5+((.5+(cos((oDj.timestep)/(oPuppet.breathing_rate/8))/2))/2))/2
	
	draw_self()
	
	
	if !instance_exists(selected_pearl) {
		var _nearest_pearl = instance_nearest(x,y,oPearl)
		if instance_exists(_nearest_pearl) {
			var _nearest_pearl_dis = point_distance(x,y,_nearest_pearl.x,_nearest_pearl.y)
			if _nearest_pearl_dis < _pickup_range {
				//with (_nearest_pearl) {
					draw_set_alpha(cursor_alpha)
					draw_line_width(x,y,_nearest_pearl.x,_nearest_pearl.y,(.5+(sin(oDj.timestep/(oPuppet.breathing_rate/8))/2))+((1-(_nearest_pearl_dis/_pickup_range))*grasp_size))	//
					draw_set_alpha(1) 
					if mouse_check_button_pressed(mb_left) and cooldown <= 0 {
						selected_pearl = _nearest_pearl;	
					}
				//}
			}
		}
	} else {
		if !selected_pearl.relocate_mode {
			//PEARL IS SELECTED, SHOW THAT VIA A HALO
			//draw_set_circle_precision(16)
			draw_set_alpha(cursor_alpha)
			draw_circle_ext(selected_pearl.x,selected_pearl.y,pearl_halo_base_size+abs((selection_circle_size*(.5+sin(oDj.timestep/(oPuppet.breathing_rate/1.5))/2))),6,oDj.timestep,360,selection_circle_size/2,true)
			draw_set_alpha(1)	
		
			show_options(selected_pearl)
		}
	}
	//draw_line(x,y,0,0)
	
	//draw_sprite_ext()
}

function pearl_new_pearl() {
	oCrosshair.selected_pearl = instance_create(mouse_x,mouse_y,oPearl)
	oCrosshair.selected_pearl.program = "null"
	pearl_enter_relocate_mode()
	//pearl_exit()
}

function pearl_exit() {
	oCrosshair.cooldown = 30
	oCrosshair.selected_pearl = noone;
}

function pearl_enter_relocate_mode() {
	oCrosshair.selected_pearl.relocate_mode = true;	
}