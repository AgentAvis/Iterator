init_console()

zoom_desired_zoom = 500
desired_zoom = 0
working_zoom = 0
dconsole_zoom = 600
console_zoom = dconsole_zoom
console_status = false
pressedtimer = 0

backcolor = c_black
frontcolor = merge_color(c_black,c_white,.1)
backtextcolor = c_green
fronttextcolor = merge_color(c_lime,c_white,.6)
alpha = .9

// add_command only takes strings
// second argument is optional
// adding commands here is purely for the preview in game
//
//				 --- E X A M P L E S ---
//
//add_command("command name","argument0,argument1,argument2,")
//add_command("killall","kills everything in the room.")

#region  Commands
add_command("help","Provides info pertaining to Console.")
add_command("clear","Clears Console history");
#endregion

#region Engine Commands
add_command("freecam","Enables 360 degree camera rotation, warning: VERY unsupported.")
add_command("staticcam","Forces camera to quit moving.");
add_command("fullzoom aka fz","Allows more zoom levels.");
add_command("debug","Toggles debug mode.")
add_command("pause","Toggles global game pause.")
add_command("rn","Move to next room.")
add_command("rp","Move to previous room.")
add_command("restart","Resets the room you are in.")
add_command("quit","Exits the game.");
add_command("exit","Exits the game.");
add_command("menu","Goes to main menu.");
#endregion

#region Game Commands
add_command("tplayer","teleports the player to mouse position")
add_command("make","o[Pawn to create],[number of pawns to spawn]");


//instance_destroy()

#endregion