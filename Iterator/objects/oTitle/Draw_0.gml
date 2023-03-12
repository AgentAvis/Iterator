// Event created by Avis.
event_inherited()

draw_set_font(Title_font)

var i = 0;
var _charwidth = string_width("H")

//sin(oDj.timestep/100)*5

repeat (string_length(text)+1) {
	var _tempstring = text;
	
		_tempstring = string_delete(_tempstring,i+1,string_length(text)-i)
	//_tempstring = string_delete(_tempstring,0,i)
		_tempstring = string_delete(_tempstring,1,i-1)
	//_tempstring = string_delete(_tempstring,i+1,60)
		
		diversifier = sin((oDj.timestep+(i*5))/15)
		
		text_color = make_color_hsv(((oDj.timestep+(i*5)/3)) mod 255,255,255)
	
	draw_text_outlined_ext(x+(i*_charwidth)-((string_length(text)*_charwidth)/2),y+(diversifier*4),_tempstring,text_color,text_background_color,1,1,(diversifier*10))
	
	
	i ++
}