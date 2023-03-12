/// @desc draw_text_with_outlines
/// @arg x
/// @arg y
/// @arg string
/// @arg color
/// @arg outline_color
/// @arg xscale 
/// @arg yscale 
/// @arg angle
///draw_text_outlined(x, y, string, colour, outline_colour)
function draw_text_outlined_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var xx = argument0;
	var yy = argument1;
	var str = argument2;
	var xsc = argument5;
	var ysc = argument6;
	var ang = argument7;

	draw_set_colour(argument4);
	draw_text_transformed(xx-(xsc), yy, string_hash_to_newline(str),xsc,ysc,ang);
	draw_text_transformed(xx+(xsc), yy, string_hash_to_newline(str),xsc,ysc,ang);
	draw_text_transformed(xx, yy-(ysc), string_hash_to_newline(str),xsc,ysc,ang);
	draw_text_transformed(xx, yy+(ysc), string_hash_to_newline(str),xsc,ysc,ang);
	draw_set_colour(argument3);
	draw_text_transformed(xx, yy, string_hash_to_newline(str),xsc,ysc,ang);
	draw_set_colour(c_white);




}
