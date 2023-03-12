function draw_text_f() {

	/// @function		draw_text_f(x, y, string, width, seperation)
	/// @description	Draws text with special formatting
	/// @arg			x         
	/// @arg			y         
	/// @arg			string    
	/// @arg			seperation
	/// @arg			width 

	var _x =			argument[0];
	var _y =			argument[1];
	var _string =		argument[2];
	var _seperation =	argument[3];
	var _width =		argument[4];
	var char_w =		string_width("H")

	/* Script body goes here */



	var i = 0;

	//console_print("b4")


	//draw_set_alpha(1)
	//draw_line(_x,_y,mouse_x,mouse_y)
	repeat (string_length(_string)) {
		//draw_set_color(
		//make_color_hsv( ( (i/string_length(_string)*255) +(oDj.timestep))  mod 255,255,255
		//))
	
		var xspace = (char_w*i)
		var yspace = 0;
		if xspace > _width {
			yspace = floor(xspace / _width)
			xspace -= yspace * _width
		}
		//console_print("yspace: "+string(yspace))
		draw_text(_x+xspace,_y+(yspace*string_height("I")),string_char_at(_string,i+1)) //+sin(i+(oDj.timestep/8))
		//draw_point(_x+(char_w*i),_y)
	
		//console_print(string(i))
		i++
	}
	//console_print("string_length(_string): "+string(string_length(_string)))

	//console_print("after")


}
