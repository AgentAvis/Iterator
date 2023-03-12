
#region  Toggle code
if keyboard_check_pressed(192)  { console_status = !console_status console_toggle(my_console) io_clear() }
#endregion

#region Scroll code
if console_status = true {
	if mouse_wheel_up() { zoom_desired_zoom += 15  }
	if mouse_wheel_down() { zoom_desired_zoom -= 15  }
	desired_zoom = lerp(desired_zoom,zoom_desired_zoom,.35)
} else {
	desired_zoom = -100
	zoom_desired_zoom = clamp(zoom_desired_zoom,10,1000)	
}
working_zoom = lerp(working_zoom,desired_zoom,.2)

#endregion

/*****************************
* If a command has been submitted...
*****************************/

var list = my_console[? "history"];
var str = "";

if keyboard_check_pressed(vk_anykey) {
	pressedtimer = 15	
}
pressedtimer --
if console_submit(my_console) {
	/*
	
	-=-=-=- T H I S   I S   W H E R E   Y O U   P U T   C O M M A N D S -=-=-=-
	
		Example:
	if CMD(command_name) or CMD(other_command_name('optional')) {
	
		//put your code here!
		
		repeat (c_argument(1)) {
			oTest.x = c_argument(2)
		}
	
	}
	
	
	*/
	
	
	#region 
	if CMD("freecam") {
		global.freecam = !global.freecam	
	}
	if CMD("help") {
		ds_list_clear(list);
		var str = "";
		str = "------=====HELP======------"
		ds_list_insert(list,0,str);
		str = " Type in a command followed by a coma and your arguments. seperate arguments with commas "
		ds_list_insert(list,0,str);
		str = " example: command_name,argument0,argument1 "
		ds_list_insert(list,0,str);
		
		command_list = my_console[? "text"]
		repeatno = ds_list_size(command_list); 
		str = string(repeatno)
		while (repeatno > 0) {
			temp_string = command_list[| repeatno];
			repeatno --;
			str = temp_string
			ds_list_insert(list,0,str);			
		}
	}
	if CMD("clear") {
		ds_list_clear(list);
	} 
	
	
	#endregion
	
	#region Engine
	if CMD("cursorvis"){
		if instance_exists(global.focus) {
			oCursor.visible = !oCursor.visible;
		} else {
			console_print("No focused object to teleport.")
		}
	}
	if CMD("fullzoom") or CMD("fulzoom") or CMD("fz") {
		global.fullzoom = !global.fullzoom
	}
	if CMD("quit") or CMD("exit") {
		game_end();
	}
	if CMD("pause") or CMD("Pause") or CMD("II")  {
		pause = !pause
	}
	if CMD("menu") {
		room_goto(rMenu)
	}
	if CMD("rn") {
		if room_exists(room_next(room)) { room_goto_next() }  else {
			console_print("No next room to go to.")
		}
	}
	if CMD("rp") {
		ded = false
		if room_exists(room_previous(room)) {
			if room_previous(room) = rInit {
				ded = true
			} else {
				room_goto_previous() 
			}
		} else {
			ded = true
		}
		if ded {
			str = "No previous room to go to."
			console_print("No previous room to go to.")
		}
	}
	if CMD("restart") {
		room_restart() 
	}
	if CMD("debug") {
		global.debug = !global.debug
	}
	if CMD("staticcam") {
		oCamera.staticcam = !oCamera.staticcam
		str = "staticcam = " + string(oCamera.staticcam)
		ds_list_insert(list,0,str);
	} 
	
	
	
	#endregion
	
	#region Game
	
	if CMD("tplayer") or CMD("tpl") {
		if instance_exists(global.focus) {
			global.focus.x = mouse_x
			global.focus.y = mouse_y
		} else {
			console_print("No focused object to teleport.")
		}
	}
	if CMD("unfoc") {
		if instance_exists(global.focus) { global.focus = noone console_print("Focus object set to noone") } else {
			console_print("FAILED: No focus object exists!")	
		}
		
	}
	if CMD("make") {
		makeobject = c_argument(1)//console_value(my_console,1);
		makenumber = round(real(c_argument(2)))
		makemouse_x = mouse_x
		makemouse_y = mouse_y
	}
	
	
	
	
	
	#endregion
	

}

#region Instance Creation code
repeat (2) {
	if makenumber > 0 {
		makenumber --;
		if object_exists(asset_get_index(makeobject)) {
			instance_create_depth(makemouse_x,makemouse_y,depth,asset_get_index(makeobject))
		} else {
			makenumber = 0
		}
	}
}
#endregion