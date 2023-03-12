function get_speed() {
	if argument_count = 1 {
		return point_distance(0,0,argument[0].hsp,argument[0].vsp)	
	} else {
		return point_distance(0,0,hsp,vsp)	
	}




}
