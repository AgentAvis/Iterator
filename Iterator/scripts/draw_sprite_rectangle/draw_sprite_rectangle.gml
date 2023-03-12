/// @desc lerp_but_with_angles
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg sprite
function draw_sprite_rectangle(argument0, argument1, argument2, argument3, argument4, argument5) {


	var x1 = argument0;
	var y1 = argument1;
	var x2 = argument2;
	var y2 = argument3;
	var spr = argument4;
	var width = sprite_get_width(spr);
	var height = sprite_get_height(spr);
	var xscale = (argument2 - argument0)/width
	var yscale = (argument3 - argument1)/height

	draw_sprite_ext(spr,argument5,x1,y1,xscale,yscale,0,c_white,1);



}
