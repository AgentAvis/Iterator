// Event created by Avis.
event_inherited()

if (!surface_exists(surface)) { 
	surface = surface_create(128, 128); //whatever size of picker sprite
	surface_set_target(surface);
	draw_clear_alpha(c_black, 0);
	draw_sprite_ext(sColor_picker,2,sprite_get_width(sColor_picker)/2,sprite_get_height(sColor_picker)/2,image_xscale,image_yscale,image_angle,merge_color(c_black,c_white,oEditor.color_picker_value),image_alpha);
	surface_reset_target();
} else {
	surface_set_target(surface);
	draw_clear_alpha(c_black, 0);
	draw_sprite_ext(sColor_picker,2,sprite_get_width(sColor_picker)/2,sprite_get_height(sColor_picker)/2,image_xscale,image_yscale,image_angle,merge_color(c_black,c_white,oEditor.color_picker_value),image_alpha);
	surface_reset_target();
}

	//draw_surface(surface,0,0);

if oEditor.collect_color {
	var Gui_X = mouse_x-(oEditor.x+(oEditor.color_picker_xoff))+64-21;
	var Gui_Y = mouse_y-oEditor.y+64-8;

	var My_Color = surface_getpixel(surface,Gui_X,Gui_Y);
	//draw_circle(Gui_X,Gui_Y,20,true)
	//draw_point_color(Gui_X,Gui_Y,c_black)
	oEditor.selected_col = My_Color;
	oEditor.collect_color = false
	
	if oEditor.color_picker_target = oPuppet { 
		set_body_color(oEditor.selected_col)
		
		
	}
}
/*
		//if oEditor.collect_color {
			oEditor.selected_col = draw_getpixel(device_mouse_x(0),device_mouse_y(0))	
			oEditor.collect_color = false
		//}