// Event created by Avis.
event_inherited()



var _dis = point_distance (x,y,oPuppet.x,oPuppet.y);
var _dir = point_direction(x,y,oPuppet.x,oPuppet.y);

//if _dis > 32 {
	shsp = lengthdir_x(clamp(_dis,0,5),_dir)
	svsp = lengthdir_y(clamp(_dis,0,5),_dir)
//} else {
	//hsp *= .999
	//vsp *= .999
//}

x += shsp
y += svsp
//x += (xprevious-x)
//y += (yprevious-y)