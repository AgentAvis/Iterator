/// @desc render
var points = ik_chain_get_points(chain,true);
var point_last = array_length_1d(points)-2;
for(var i = 0; i<point_last; i+=2){
	var x1 = points[i+0];
	var y1 = points[i+1];
	var x2 = points[i+2];
	var y2 = points[i+3];
	var c = merge_colour(c_green,c_red,i/point_last);
	draw_line_colour(x1,y1,x2,y2,c,c);
	draw_circle_colour(x2,y2,2,c,c,false);
}