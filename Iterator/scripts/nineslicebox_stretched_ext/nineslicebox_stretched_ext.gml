/// @desc nineslicebox_stretched(sprite, x1, y1, x2, y2);
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg color
/// @arg alpha
function nineslicebox_stretched_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {



	var _size = sprite_get_width(argument0) / 3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _color = argument5;
	var _alpha = argument6;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	var _columns = _w div _size;
	var _rows = _h div _size;


	//CORNERS
	//Top left
	draw_sprite_part_ext(argument0,0, 0,0,_size,_size, _x1,_y1,1,1,_color,_alpha);

	//Top right
	draw_sprite_part_ext(argument0,0,_size * 2,0,_size,_size,_x1 + _w - _size,_y1,1,1,_color,_alpha);

	//Bottom Left
	draw_sprite_part_ext(argument0,0,0,_size * 2,_size,_size,_x1,_y1+_h-_size,1,1,_color,_alpha);

	//Bottom Right
	draw_sprite_part_ext(argument0,0,_size * 2, _size*2, _size, _size, _x1 + _w - _size,_y1 + _h - _size,1,1,_color,_alpha);


	//EDGES
	//Left Edge
	draw_sprite_part_ext(argument0,0,0,_size,_size,1,_x1,_y1 + _size, 1, _h - (_size * 2), _color,1);
	//Right edge
	draw_sprite_part_ext(argument0,0,_size*2,_size,_size,1,_x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), _color,_alpha);
	//Top Edge
	draw_sprite_part_ext(argument0,0,_size,0,1,_size,_x1 + _size,_y1,_w - (_size * 2),1,_color,1);
	//Bottom Edge
	draw_sprite_part_ext(argument0,0,_size,_size*2,1,_size,_x1 + _size, _y1 + _h - (_size), _w - (_size * 2), 1, _color,_alpha);




	//MIDDLE
	draw_sprite_part_ext(argument0,0,_size,_size,1,1,_x1 + _size, _y1 + _size, _w - (_size * 2), _h - (_size*2),_color,_alpha);





}
