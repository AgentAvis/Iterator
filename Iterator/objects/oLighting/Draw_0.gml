// Event created by Avis.
event_inherited()

if surface_exists(light_surf) {
	surface_set_target(light_surf)
		draw_clear_alpha(c_black,1);
			//gpu_set_blendmode_ext(bm_zero,bm_one) //lights?
			
			
			draw_set_alpha(.2) 
			draw_set_color(c_white)
			draw_rectangle(0,0,512,512,false)
			draw_set_alpha(1)
			
			gpu_set_blendmode(bm_add)
			with (oLight) {
				
				draw_self()	
				//draw_line(x,y,mouse_x,mouse_y)
			}
			lightxoff = -5+(-7)
			lightyoff = 4
			with (oPearl) {
				draw_sprite_ext(sGlyph_S,icon_symbol,x+other.lightxoff,y+other.lightyoff,image_xscale,image_yscale,0,c_white,image_alpha)	
			}
			
			with (oPuppet) {
				if can_move {
					gpu_set_blendmode(bm_add)
					draw_set_color(c_white)
					draw_set_alpha(1)
					draw_set_alpha(.25)
				
					halox = x
					haloy = y-16
				
					radius1 = 24+abs(8+(sin(oDj.timestep/30)*8))
					thickness1 = abs(8+(sin(oDj.timestep/60)*6))
				
					draw_circle_ext(halox,haloy,radius1,30,0,360,thickness1,true)
				
					pointamt = 16
					pointsize = 2
					point_dis_out = radius1+thickness1+2
					point_ang_off = oDj.timestep/4
				
					var _i = 0;
					repeat(pointamt) {
						draw_set_circle_precision(2)
						var _dir =point_ang_off + ( (_i/pointamt)*360);
						var _x = halox+lengthdir_x(point_dis_out,_dir); 
						var _y = haloy+lengthdir_y(point_dis_out,_dir); 
					
						draw_circle(_x,_y,pointsize,false)
					
						_i ++		
					}
				
					radius2 = radius1 + thickness1 + 8
					thickness2 = 2
					draw_circle_ext(halox,haloy,radius2,40,0,360,thickness2,true)
								
					pointamt = 32
					pointsize = 2
					point_dis_out = radius2+thickness2+4
					point_ang_off = oDj.timestep
				
					var _i = 0;
					repeat(pointamt) {
						draw_set_circle_precision(2)
						var _dir =point_ang_off + ( (_i/pointamt)*360);
						var _x = halox+lengthdir_x(point_dis_out,_dir); 
						var _y = haloy+lengthdir_y(point_dis_out,_dir); 
					
						draw_circle(_x,_y,pointsize,false)
					
						_i ++		
					}
					draw_set_alpha(1)
				
			
					//gpu_set_blendmode(bm_subtract)
					//draw_set_color(c_white)
					//draw_circle(x,y,24,false)
				
					gpu_set_blendmode(bm_add)
				}
			}	
			
			//draw_sprite_ext(sEditor,0,mouse_x,mouse_y,1,1,0,c_white,1)
			with (oEditor) {
				draw_editor()	
			}
			
			with (oCrosshair) {
				draw_crosshair()	
			}

	surface_reset_target()
	
	with (oPuppet) {
		
	}
	
	gpu_set_blendmode_ext(bm_zero, bm_src_color);
	draw_surface(light_surf,0,0)
	gpu_set_blendmode(bm_normal)	

} else {
	light_surf = surface_create(512,512)	
}

