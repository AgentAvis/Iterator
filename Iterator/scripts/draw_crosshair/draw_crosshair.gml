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
	
	
	if !instance_exists(selected_pearl) || selected_pearl.set_orbit {
		var _nearest_pearl = instance_nearest(x,y,oPearl)
		if _nearest_pearl == selected_pearl {
			_nearest_pearl = instance_nth_nearest(x,y,oPearl,2)
		}
		if instance_exists(_nearest_pearl) {
			var _nearest_pearl_dis = point_distance(x,y,_nearest_pearl.x,_nearest_pearl.y)
			if _nearest_pearl_dis < _pickup_range {
				draw_set_alpha(cursor_alpha)
				draw_line_width(x,y,_nearest_pearl.x,_nearest_pearl.y,(.5+(sin(oDj.timestep/(oPuppet.breathing_rate/8))/2))+((1-(_nearest_pearl_dis/_pickup_range))*grasp_size))	//
				draw_set_alpha(1) 
				 if mouse_check_button_pressed(mb_left) and cooldown <= 0 {
					if !instance_exists(selected_pearl) {
						selected_pearl = _nearest_pearl
					
					} else {
						selected_pearl.orbit_target = _nearest_pearl
						selected_pearl.orbit_mode = true;
						pearl_exit()
					}
				}

			}
		}
	} else {
		
		
		
		//PEARL IS SELECTED, SHOW THAT VIA A HALO
		//draw_set_circle_precision(16)
		draw_set_alpha(cursor_alpha)
		
		var _cir_x = selected_pearl.x;
		var _cir_y = selected_pearl.y
		var _cir_r = pearl_halo_base_size+abs((selection_circle_size*(.5+sin(oDj.timestep/(oPuppet.breathing_rate/1.5))/2)));
		var _cir_b = 6;
		var _cir_a = oDj.timestep;
		var _cir_angadd = 360;
		var _cir_w = selection_circle_size/2;
		
		var _i = 0;
		repeat(_cir_b) {
			var _dir = (_i/_cir_b)*360
			var _lenx = lengthdir_x(1,_dir);
			var _leny = lengthdir_y(1,_dir);
			
			draw_line(_cir_x + (_lenx*_cir_r),_cir_y + (_leny*_cir_y),_cir_x + (_lenx*_cir_r*2),_cir_y + (_leny*_cir_y*2))
			
			_i ++
		}
		draw_circle_ext(_cir_x,_cir_y,_cir_r,_cir_b,_cir_a,_cir_angadd,_cir_w,true)
		
		draw_set_alpha(1)	
		
		if !selected_pearl.relocate_mode && !selected_pearl.set_orbit {
			//pearl is not being relocated, show the options
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

function pearl_set_orbit() {
	oCrosshair.selected_pearl.set_orbit = true;
}