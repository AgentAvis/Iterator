// Event created by Avis.
event_inherited()

if surface_exists(light_surf) {
	surface_set_target(light_surf)
		draw_clear_alpha(c_black,1);
			//gpu_set_blendmode_ext(bm_zero,bm_one) //lights?
			gpu_set_blendmode(bm_add)
			
			draw_set_alpha(.52) 
			draw_set_color(image_blend)
			draw_rectangle(0,0,512,512,false)
			draw_set_alpha(1)
			
			with (oLight) {
				draw_self()	
			}
	
		
	surface_reset_target()
	
	
	
	gpu_set_blendmode_ext(bm_zero, bm_src_color);
	draw_surface(light_surf,0,0)
	gpu_set_blendmode(bm_normal)	

} else {
	light_surf = surface_create(512,512)	
}

