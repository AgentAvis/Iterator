///instance_place_ext(x,y,instance,xscale,yscale)
/// @arg x
/// @arg y
/// @arg instance
/// @arg xscale
/// @arg yscale
function instance_place_ext(argument0, argument1, argument2, argument3, argument4) {
	var X = argument0;
	var Y = argument1;
	var Instance = argument2;
	var Xscale = argument3;
	var Yscale = argument4;

	he = sprite_get_height(sprite_index)
	we = sprite_get_width(sprite_index)
	return collision_rectangle(bbox_right-(we*Xscale),bbox_top+(he*Yscale),bbox_left+(we*Xscale),bbox_bottom-(he*Yscale),Instance,false,true);

	//return collision_rectangle(x,y,)

}
