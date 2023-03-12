/// @desc draw_text_with_outlines
/// @arg x
/// @arg y
/// @arg string
/// @arg color
/// @arg outline_color
/// @arg alpha
///draw_text_outlined(x, y, string, colour, outline_colour)
function draw_text_outlined_alpha(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx = argument0;
	var yy = argument1;
	var str = argument2;
	var _alpha = argument5;
	draw_set_colour(argument4);
	draw_set_alpha(_alpha)
	draw_text(xx-1, yy, string_hash_to_newline(str));
	draw_text(xx+1, yy, string_hash_to_newline(str));
	draw_text(xx, yy-1, string_hash_to_newline(str));
	draw_text(xx, yy+1, string_hash_to_newline(str));

	draw_set_colour(argument3);
	draw_text(xx, yy, string_hash_to_newline(str));

	draw_set_colour(c_white);
	draw_set_alpha(1)



}
