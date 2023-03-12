function draw_cursor() {
	with (oCursor) {
		if state = "base" {
			sprite = sCursor
		}
		if state = "point" {
			sprite = sPointer
		}
		if state = "grab" {
			sprite = sGrab
		}


		draw_sprite_ext(sprite,0,window_mouse_get_x(),window_mouse_get_y(),scale,scale,image_angle,image_blend,image_alpha)


		//draw_self()

		/*
		if fire {
			fsprite = sNothing
			heatalpha = lerp(heatalpha,heat/30,.1)
			darkness *= .999
	
		} else {
			heatalpha = lerp(heatalpha,0,.1)	
		}

		if state = "base" { fsprite = sCursor_fire }
		if state = "point" { fsprite = sPointer_fire }
		if state = "grab" { fsprite = sPointer_fire }
		draw_sprite_ext(fsprite,frame,x,y,image_xscale,image_yscale,image_angle,c_white,heatalpha)

		image_blend = make_color_hsv(0,0,clamp(darkness,50,255))
		//draw_text(window_mouse_get_x(),window_mouse_get_y(),string(heat))
		*/
	}


}
