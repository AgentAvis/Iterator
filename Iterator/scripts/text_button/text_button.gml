/// @arg x
/// @arg y
/// @arg string
/// @arg defcolor
/// @arg hovercolor
/// @arg clickcolor
function text_button(argument0, argument1, argument2, argument3, argument4, argument5) {

	draw_set_halign(fa_left)


	ret = false

	var mousex = device_mouse_x_to_gui(0);
	var mousey = device_mouse_y_to_gui(0);

	var xxx1 = argument0;
	var yyy1 = argument1;
	var ssstring = argument2;
	var defcolor = argument3;
	var hovercolor = argument4;
	var clickcolor = argument5;

	var ssstringwidth = string_width(ssstring);
	var ssstringheight = string_height(ssstring);

	var button_color = defcolor;
	
	//draw_circle_color(mousex,mousey,10,c_green,c_green,true)

	if point_in_rectangle(mousex,mousey,xxx1,yyy1,xxx1+(ssstringwidth),yyy1+(ssstringheight)) {
		button_color = hovercolor
		cursor_state("point")
		if mouse_check_button(mb_left) {
			button_color = clickcolor	
		}
		if mouse_check_button_released(mb_left) {
			ret = true	
		}
	}
	//draw_rectangle(xxx1,yyy1,xxx1+(ssstringwidth),yyy1+(ssstringheight),false)
	draw_text_outlined(xxx1 ,yyy1 ,ssstring,button_color,c_black)

	if ret = true { return true; }




}
