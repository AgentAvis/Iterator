/// @arg font
function dialog_set_font() {

	font			= argument[0]
	//console_print("Font on create: "+string(font))
	draw_set_font(font)

	text_height		= string_height("I")
	linesep			= text_height * linesepmod
	option_sep		= linesep*option_sepmod
	char_width		= string_width("H");

	return font;


}
