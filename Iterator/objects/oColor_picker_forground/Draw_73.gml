// Event created by Avis.
event_inherited()

if instance_exists(oEditor) {
	if oEditor.color_picker {
		

		
		
		draw_sprite_ext(sColor_picker,2,oEditor.color_picker_x,oEditor.color_picker_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)



		gpu_set_blendmode_ext( bm_inv_dest_colour, bm_inv_src_alpha );
		draw_sprite_ext(sColor_cursor,1,oEditor.color_x,oEditor.color_y,1,1,0,c_white,1)
		if oEditor.draw_color_cursor {
			
			draw_sprite_ext(sColor_cursor,0,mouse_x,mouse_y,1,1,0,c_white,1)
			
		}
		gpu_set_blendmode(bm_normal)
		
		draw_sprite_ext(sColor_picker,1,oEditor.color_picker_x,oEditor.color_picker_y,image_xscale,image_yscale,image_angle,oEditor.selected_col,image_alpha)
		

	}
}