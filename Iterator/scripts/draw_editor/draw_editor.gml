// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_editor(){
	
	sprite_index = oEditor
	frame_change = false
	if (oDj.timestep mod 300) = 0 and false {
		editor_index ++	
		frame_change = true;
		color_picker = false
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
	
	draw_color_cursor = false
	var _click = mouse_check_button_pressed(mb_left);
	var _clicking = mouse_check_button(mb_left);
	
	if color_picker {
		//draw_sprite_ext(sColor_picker,0,x-spr_wid,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)	
		sprite_index = sColor_picker_mask //set the sprite to the current menu's button image
		
		var _i = 0;
		repeat (image_number) {
			var color = c_white;
			image_index = _i //check collision against the right frame, in a loop.
			
			var _temp_wid = sprite_get_width(sColor_picker)
			color_picker_xoff = 2+(((-spr_wid)+(_temp_wid/2)));
			var _xoff = color_picker_xoff;
			var _yoff = 0;
			color_picker_x = x+2+(((-spr_wid)+(_temp_wid/2)));
			color_picker_y = y;
			var _sc = 1;
			x += _xoff;
			y += _yoff;
			if _i = 2 or _i = 3 or _i = 4  { // am I a valid button
				color = c_ltgray; //I am, make me gray if i'm not hovered over
				if collision_point(mouse_x,mouse_y,self,true,false) { //am I being hovered over
					color = c_white //make me white, the mouse is over me
					if _i = 2 {
						draw_color_cursor = true
						if _clicking {
							color_x = mouse_x;
							color_y = mouse_y;
							collect_color = true;
						}
					}
					//_yoff = 1;
				}
			}
			draw_sprite_ext(sColor_picker,_i,x,y,_sc,_sc,image_angle,color,image_alpha) //draw the button
			x -= _xoff;
			y -= _yoff;			
			_i ++;
		}
		
	}
	
	oPuppet.robe_trans_alpha = 1
	
	if editor_index = 0 {
		oPuppet.robe_trans_alpha = 0
		//we are on the puppet body editor screen
		Puppet_frame_x = x+48+spr_wid
		Puppet_frame_y = y+57+spr_wid
		
		sprite_index = sEditor_body_mask //set the sprite to the current menu's button image
		
		var _i = 0;
		repeat (image_number) {
			var color = c_white;
			image_index = _i //check collision against the right frame, in a loop.
			var _xoff = 0;
			var _yoff = 0;
			var _sc = 1;
			
			if _i = 1 {
				color = oPuppet.body.blend	
			}
			if _i = 0 or _i = 2 or _i = 3 { // am I a valid button
				color = c_dkgray; //I am, make me gray if i'm not hovered over
				if collision_point(mouse_x,mouse_y,self,true,false) { //am I being hovered over
					color = c_white //make me white, the mouse is over me
					if _i = 0 and _click{
						//color picker menu button
						color_picker = !color_picker
						color_picker_target = oPuppet
					}

					//_yoff = 1;
				}
			}
			draw_sprite_ext(sEditor_body,_i,x+_xoff,y+_yoff,_sc,_sc,image_angle,color,image_alpha) //draw the button
			
			_i ++;
		}
		
	}
	
	if image_index = 1 {
		//we are on the puppet antenna editor screen
		Puppet_frame_x = x+63+spr_wid
		Puppet_frame_y = y+57+spr_wid
	}
	if image_index = 2 {
		//we are on the puppet face marking editor screen
		Puppet_frame_x = x+48+spr_wid
		Puppet_frame_y = y+69+spr_wid
	}	
	if image_index = 3 {
		//we are on the puppet robe editor screen
		Puppet_frame_x = x+34+spr_wid
		Puppet_frame_y = y+91+spr_wid
	}		
	
	
	
	
	
}