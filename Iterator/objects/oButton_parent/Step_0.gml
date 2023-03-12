// Event created by Avis.
event_inherited()


if script_execute(query) {
	if mouse_over() {
		draw_xscale = .9
		draw_yscale = .9
		if mouse_check_button_pressed(mb_any) {
			if press_argument != "NULL" {
				script_execute(press_script,press_argument)
			} else {
				script_execute(press_script)
			}	
		}
	
	} else {
		draw_xscale = 1
		draw_yscale = 1	
	}
} else {
	image_blend = c_ltgray
	draw_xscale = 1
	draw_yscale = 1
}