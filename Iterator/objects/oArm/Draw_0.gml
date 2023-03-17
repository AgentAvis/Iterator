/// @desc render
var points = ik_chain_get_points(chain,true);
var point_last = array_length_1d(points)-2;

var _startx = 0;
var _starty = 0;

var _endx = 0;
var _endy = 0;

for(var i = 0; i<point_last; i+=2){
	var x1 = points[i+0];
	var y1 = points[i+1];
	var x2 = points[i+2];
	var y2 = points[i+3];
	//var c = merge_colour(c_green,c_red,i/point_last);
	//draw_line_colour(x1,y1,x2,y2,c,c);
	//draw_circle_colour(x2,y2,2,c,c,false);
	if i = 10 {
		
		draw_sprite_ext(sShoulder,0,x2,y2,1,1,point_direction(x1,y1,x2,y2)+180,image_blend,image_alpha)	
		_startx = x2;
		_starty = y2;
		draw_sprite(Bearing_large,0,x2,y2)
	}
	if i = 8 {
		
		draw_sprite_ext(sArm1,0,x2,y2,1,1,point_direction(x1,y1,x2,y2)+180,image_blend,image_alpha)	
		draw_sprite(Bearing_mid,0,x2,y2)
		mid_point.x = x1
		mid_point.y = y1
	}
	if i = 6 {
		
		draw_sprite_ext(sArm2,0,x2,y2,1,1,point_direction(x1,y1,x2,y2)+180,image_blend,image_alpha)	
		draw_sprite(bearing_small,0,x2,y2)
	}
	if i < 6 {
		
		draw_sprite_ext(sArm3,0,x2,y2,1,1,point_direction(x1,y1,x2,y2)+180,image_blend,image_alpha)	
		draw_sprite(bearing_tiny,0,x2,y2)
	}
	
	if i = 0 {
		_endx = x1
		_endy = y1
	}
	
	if i = 2 {
		wrist_point.x = x1
		wrist_point.y = y1	
	}
	//draw_text(x1,y1,string(i))
}

//if point_distance(_startx,_starty,_endx,_endy) < sum {
	//oPuppet.x = _endx;
	//oPuppet.y = _endy;
//}

cart.x = x
cart.y = y
cart.image_angle = cart_angle

//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,cart_angle,image_blend,image_alpha)