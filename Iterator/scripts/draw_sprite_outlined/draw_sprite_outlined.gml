/// @desc draw_text_with_outlines
/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
/// @arg xscale
/// @arg yscale
/// @arg angle
/// @arg color
/// @arg outline_color
function draw_sprite_outlined(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	//draw_sprite_outlined(sprite, subimg, x, y, xscale, yscale, ang, colour, outline_colour)
	var spr = argument0;
	var img = argument1;
	var xx = argument2;
	var yy = argument3;
	var xs = argument4;
	var ys = argument5;
	var ang = argument6;
	var col = argument7;
	var ocol = argument8;
	d3d_set_fog(true, ocol, 0, 1);
	draw_sprite_ext(spr, img, xx-xs, yy, xs, ys, ang, c_white, draw_get_alpha());
	draw_sprite_ext(spr, img, xx+xs, yy, xs, ys, ang, c_white, draw_get_alpha());
	draw_sprite_ext(spr, img, xx, yy-ys, xs, ys, ang, c_white, draw_get_alpha());
	draw_sprite_ext(spr, img, xx, yy+ys, xs, ys, ang, c_white, draw_get_alpha());
	d3d_set_fog(0, 0, 0, 0);
	draw_sprite_ext(spr, img, xx, yy, xs, ys, ang, col, 1);




}
