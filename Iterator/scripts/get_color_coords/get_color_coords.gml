// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_color_coords(_color){
	var _hue = color_get_hue(_color);
	var _sat = color_get_saturation(_color);
	var _val = color_get_value(_color);
	
	var _angle = (((_hue/255)*360)-15) mod 360;
	var _dis = (_sat/255)*32;
	oEditor.color_picker_value = _val/255
	
	oEditor.color_x = oEditor.color_picker_x + lengthdir_x(_dis,_angle)
	oEditor.color_y = oEditor.color_picker_y + (-14) + lengthdir_y(_dis,_angle)
//y-14
}

function set_body_color(_color) {
	oPuppet.head.blend = _color;	
	oPuppet.body.blend = _color;
	oPuppet.arm1.blend = _color;
	oPuppet.arm2.blend = _color;	
}