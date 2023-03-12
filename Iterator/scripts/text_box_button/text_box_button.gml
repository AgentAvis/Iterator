/// @arg x
/// @arg y
/// @arg string
function text_box_button(argument0, argument1, argument2) {

	draw_set_font(font_menu)

	var ret = false;

	stringx = argument0
	stringy = argument1
	c_string = argument2
	var pushed = false;

	draw_set_color(c_white)

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)

	var frontcol = c_white//make_color_hex("#4E46B1");
	var backcol = c_black;

	//draw_set_valign(fa_top)

	extraspace = 6

	sep = string_height_ext("H",0,256)*.75
	ww = 256

	//draw_set_color(c_orange)
	//draw_line(argument0,argument1,argument0+ww,argument1)

	c_string_width = string_width_ext(c_string,sep,ww)
	c_string_height = string_height_ext(c_string,sep,ww)

	hsw = c_string_width/2
	hsh = (c_string_height/2)

	yoff = sep*(3/12)

	//draw_text(window_mouse_get_x(),window_mouse_get_y(),"Cursor Rite hear")


	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),stringx-extraspace-hsw,stringy-extraspace-hsh+yoff,stringx+hsw+extraspace,stringy+hsh+extraspace+yoff) {
		//extraspace = 1.5
		//draw_set_color(c_green)
		if mouse_check_button_pressed(mb_left) { ret = true }
		//draw_circle(stringx,stringy,100,false)
		pushed = true
		cursor_state("point")
	} else {
		pushed = false
		draw_set_color(c_black)	
	}

	//draw_set_color(backcol)
	//draw_rectangle(extraspace+1+stringx+hsw,extraspace+1+stringy+hsh+yoff,stringx-hsw-1-extraspace,stringy-hsh-1-extraspace+yoff,false)
	//nineslicebox(sMenuNineSlice,extraspace+1+stringx+hsw,extraspace+1+stringy+hsh+yoff,stringx-hsw-1-extraspace,stringy-hsh-1-extraspace+yoff)
	//draw_button(extraspace+1+stringx+hsw,extraspace+1+stringy+hsh,stringx-hsw-1-extraspace,stringy-hsh-1-extraspace,pushed)

	draw_set_color(frontcol)
	if pushed { draw_set_color(merge_color(frontcol,c_black,.25)) }
	//draw_rectangle(extraspace+stringx+hsw,extraspace+stringy+hsh+yoff,stringx-hsw-extraspace,stringy-hsh-extraspace+yoff,false)

	//draw_sprite(sPressE,0,stringx,stringy+hsh+extraspace+1)

	nineslicebox_stretched_ext(sMenuNineSlice,stringx-extraspace-hsw,stringy-extraspace-hsh+yoff,stringx+hsw+extraspace,stringy+hsh+extraspace+yoff,draw_get_color(),1)


	draw_set_color(c_white)
	//draw_text_outlined
	draw_text_ext(stringx ,stringy,c_string,sep,ww)
	//draw_text_ext(stringx ,stringy,c_string,sep,ww)
	//draw_line(stringx,stringy,mouse_x,mouse_y)
	//draw_rectangle(stringx-extraspace-hsw,stringy-extraspace-hsh,stringx+hsw+extraspace,stringy+hsh+extraspace,false)

	return ret;



}
