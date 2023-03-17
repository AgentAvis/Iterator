/// console_submit(Console)
function console_submit(argument0) {
	var Console=argument0;

	if Console[? "active"] {

	    var list = Console[? "history"];
	    var sug = Console[? "suggestions"];
	    var i,sep,len,no,c;
	    sep = Console[? "sep"];
	    len = string_length(sep)-1;
	    var t;
    
	    /* Paste */
	    if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) {
    
	        var clip = clipboard_get_text();
	        clip = string_replace_all(clip,chr(10),"");
	        clip = string_replace_all(clip,chr(13),"");
	        clip = string_replace_all(clip,"#","");
	        Console[? "string"] = string_insert(clip,Console[? "string"],Console[? "string_pos"]);
	        Console[? "string_pos"] += string_length(clip);
        
	    } else
		
		
		    if keyboard_check(vk_backspace) {
				if keyboard_check_pressed(vk_anykey) or ( (pressedtimer < 0) and current_time mod 2 = 1 ) {
					if Console[? "string_pos"] > 1 then Console[? "string_pos"] -= 1;
					Console[? "string"] = string_delete(Console[? "string"],Console[? "string_pos"],1);
				}
            
	        } else 
	
	    /* String input */
	    if keyboard_check_pressed(vk_anykey) {
 
	        /* Delete */
	        if keyboard_check(vk_backspace) {
        
	            //if Console[? "string_pos"] > 1 then Console[? "string_pos"] -= 1;
	            //Console[? "string"] = string_delete(Console[? "string"],Console[? "string_pos"],1);
            
	        } else 
        
	        /* Back one position */
	        if keyboard_check_pressed(vk_left) {
        
	            if Console[? "string_pos"] > 1 then Console[? "string_pos"] -= 1;
            
	        } else 
        
	        /* Forward one position */
	        if keyboard_check_pressed(vk_right) {
        
	            Console[? "string_pos"] += 1;
            
	        } else 
        
	        /* Selected _last entered command */
	        if keyboard_check_pressed(vk_up) {
        
	            if Console[? "dir"] = 1 {
	                Console[? "dir"] = -1;
	                Console[? "select"] = 0;
	            }
	            var _last = ds_list_find_value(Console[? "history"],Console[? "select"]);
	            if !is_undefined(_last) {
	                Console[? "string"] = _last;
	                Console[? "string_pos"] = string_length(_last)+1;
	            }
	            if Console[? "select"] < ds_list_size(Console[? "history"]) then
	            Console[? "select"] += 1 else Console[? "select"] = 0;
            
	        } else 
        
	        /* Selected suggested command */
	        if keyboard_check_pressed(vk_down) {
        
	            if Console[? "dir"] = -1 {
	                Console[? "dir"] = 1;
	                Console[? "select"] = 0;
	            }
	            var sug = ds_list_find_value(Console[? "suggestions"],Console[? "select"]);
            
	            if !is_undefined(sug) {
	                sug = string_delete(sug,string_pos(sep,sug),string_length(sug));
	                Console[? "string"] = sug;
	                Console[? "string_pos"] = string_length(sug)+1;
	            }
            
	            if Console[? "select"] < ds_list_size(Console[? "suggestions"]) then
	            Console[? "select"] += 1 else Console[? "select"] = 0;
            
	        } else 
        
	        /* Insert character */
	        if !keyboard_check_pressed(vk_enter) {
        
	            Console[? "string"] = string_insert(keyboard__lastchar,Console[? "string"],Console[? "string_pos"]);
	            if keyboard__lastchar != "" then Console[? "string_pos"] += 1;
            
	        }
        
	        /* Reset _last character */
	        keyboard__lastchar = "";
	    }
    
	    /* Suggestions */
	    if keyboard_check_released(vk_anykey) {
	        if ds_exists(Console[? "text"],ds_type_list) {
        
	            var cmd = Console[? "string"];
            
	            var txt = Console[? "text"];
            
	            if ds_exists(Console[? "suggestions"],ds_type_list) {
	                var sugs = Console[? "suggestions"];
	                ds_list_clear(sugs);
	                if string_length(keyboard_string) > 0 {
	                    for(t=0;t<ds_list_size(txt);t++) {
                    
	                        var line = txt[| t];
	                        if string_copy(line,1,string_length(cmd)) = cmd {
	                            ds_list_add(sugs,line);
	                        }
                    
	                    }
	                }
	            }
	        }
	    }

	    if keyboard_check_pressed(vk_enter) && Console[? "string"] != "" {
    
	        /* Get command string */
	        var str = Console[? "string"];
        
	        /* Add to history */
	        ds_list_insert(list,0,str);
        
	        /* Split Console string */
	        no = string_count(sep,str);
	        for(i=0; i<=no; i++) {
	            c[i] = str;
	            repeat (i)
	                c[i] = string_delete(c[i],1,string_pos(sep,c[i])+len);
	            c[i] = string_delete(c[i],string_pos(sep,c[i]),string_length(c[i]));
	        }
        
	        /* Store command */
	        Console[? "command"] = c[0];
	        Console[? "arguments"] = c;
	        Console[? "count"] = no;
        
	        /* Clear keyboard string */
	        keyboard_string = "";
        
	        /* Close on submit */
	        if Console[? "close"] {
	            Console[? "active"] = false;
	            Console[? "select"] = 0;
	            instance_activate_all();
	        }
        
	        /* Preset commands */
	        if Console[? "preset"] {
	            switch(c[0]) {
	                //case "game_restart": game_restart(); break;
	                case "fullscreen": 
	                    if no = 1 then
	                    window_set_fullscreen(real(c[1])); 
	                break;
	                //case "room_restart": room_restart(); break;
	                case "room_speed": 
	                    //if no = 1 then room_speed = real(c[1]); 
	                break;
	                case "audio_stop_all": audio_stop_all(); break;
	                case "instance_create": 
	                    if object_exists(asset_get_index(c[1])) {
	                        if no = 3 then
	                        instance_create(c[2],c[3],asset_get_index(c[1]));
	                        else 
	                        instance_create(mouse_x,mouse_y,asset_get_index(c[1]));
	                    }
	                break;
	                //case "screenshot": 
	                //    if no = 1 then background_save(c[? "bg"], c[1]); 
	                //break;
	            }
	        }
        
	        /* Clear String */
	        Console[? "string"] = "";
	        Console[? "string_pos"] = 1;
        
	        show_debug_message("DEV CONSOLE - Ran command: "+c[0]);
        
	        return true;
        
	    }
	}






}
