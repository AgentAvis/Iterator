if room = rInit {
	room_goto_next()	
}

timestep += global.timescale

if keyboard_check_pressed(ord("R")) {
	room_restart()	
}





















