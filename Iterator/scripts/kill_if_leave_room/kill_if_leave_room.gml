function kill_if_leave_room() {
	if (x > room_width) or (y > room_height) or (x < 0) or (y < 0) { instance_destroy() }


}
