
#region Zooming code

if can_zoom && !oConsole.console_status { //if  and room != rMenu and can_zoom {
	//if keyboard_check(vk_shift) {
	if true { //disable zoom
		if keyboard_check_pressed(vk_up) {// mouse_wheel_down() {
			scroll_level += 1
		}
		if keyboard_check_pressed(vk_down) {//mouse_wheel_up() {
			scroll_level -= 1
		}
	}
	//}
	if global.fullzoom {
		scroll_level = clamp(scroll_level,-3,5)
	} else {
		//scroll_level = clamp(scroll_level,2,4)
		if mode = 3 {
		scroll_level = 0
		}
		if window_get_width()>1920 {
			scroll_level = clamp(scroll_level,2,5)		
		} else {
			scroll_level = clamp(scroll_level,1,4)	
		}
	}
	rscroll_level = round(scroll_level)
	if global.pause {
		//rscroll_level = 5	
	}
	
	
	if rscroll_level = -3 { zoom_level = 16 }	
	if rscroll_level = -2 { zoom_level = 8 }	
	if rscroll_level = -1 { zoom_level = 4 }	
	if rscroll_level = 0 { zoom_level = 2 }	
	if rscroll_level = 1 { zoom_level = 1 }
	if rscroll_level = 2 { zoom_level = 1/2 }
	if rscroll_level = 3  { zoom_level = 1/4 }
	if rscroll_level = 4 { zoom_level = 1/8 }
	if rscroll_level = 5 { zoom_level = 1/16 }
	if rscroll_level = 6 { zoom_level = 1/32 }	

	
}

if mode = 3 {
	//zoom_level = 1	
	if window_get_width()>1080 {
		//console_print("window_get_width: "+string(window_get_width()))
		//zoom_level = .5
	}
}

//Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//Set the rate of interpolation
var rate = zoom_lerp_rate;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);
true_zoom_level = new_w/default_zoom_width



#endregion

#region Surface/window resize code
if (default_zoom_width != window_get_width()) or (default_zoom_height != window_get_height()) {
	default_zoom_width = window_get_width()
	default_zoom_height = window_get_height()
}
if window_has_focus() {
	//if (surface_get_width(application_surface)!= window_get_width()) or (surface_get_height(application_surface) != window_get_height()) {
	surface_resize( application_surface, window_get_width(), window_get_height());
	if zoom_level < 1 {
		surface_resize( application_surface, window_get_width()*(zoom_level), window_get_height()*(zoom_level));
	}
}

display_set_gui_size(window_get_width(), window_get_height())
#endregion



