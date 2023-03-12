// Event created by Avis.
event_inherited()

var i = 0;
repeat (image_number) {
	
	draw_sprite_ext(sprite_index,i,x+(sin((oDj.timestep/60)+i*10)*1),y+(sin((oDj.timestep/60)+i*10)*1),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	
	i ++
}





