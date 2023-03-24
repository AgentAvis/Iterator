// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_editor(){
	
	sprite_index = oEditor
	frame_change = false
	if (oDj.timestep mod 300) = 0 {
		editor_index ++	
		frame_change = true;
	}
	editor_index = 0
	
	if frame_change {
		image_xscale = 0
		//image_xscale_speed = -1
	}
	target_image_xscale = 1
	
	spd_image_xscale = lerp(spd_image_xscale,(target_image_xscale-image_xscale)*.25,.2);
	
	image_xscale += spd_image_xscale
	
	draw_sprite_ext(sEditor,editor_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	if editor_index = 0 {
		//we are on the puppet body editor screen
		Puppet_frame_x = x+48
		Puppet_frame_y = y+57
		
		sprite_index = sEditor_body //set the sprite to the current menu's button image
		
		var _i = 0;
		repeat (image_number) {
			var color = c_white;
			image_index = _i //check collision against the right frame, in a loop.
			var _xoff = 0;
			var _yoff = 0;
			
			if _i = 0 or _i = 2 or _i = 3 { // am I a valid button
				color = c_dkgray; //I am, make me gray if i'm not hovered over
				if collision_point(mouse_x,mouse_y,self,true,false) { //am I being hovered over
					color = c_white //make me white, the mouse is over me
					//_yoff = 1;
				}
			}
			draw_sprite_ext(sprite_index,_i,x+_xoff,y+_yoff,image_xscale,image_yscale,image_angle,color,image_alpha) //draw the button
			
			_i ++;
		}
		
	}
	
	if image_index = 1 {
		//we are on the puppet antenna editor screen
		Puppet_frame_x = x+63
		Puppet_frame_y = y+57
	}
	if image_index = 2 {
		//we are on the puppet face marking editor screen
		Puppet_frame_x = x+48
		Puppet_frame_y = y+69
	}	
	if image_index = 3 {
		//we are on the puppet robe editor screen
		Puppet_frame_x = x+34
		Puppet_frame_y = y+91
	}		
	
	
	
	
	
}