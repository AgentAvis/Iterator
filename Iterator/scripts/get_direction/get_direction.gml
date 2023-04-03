function get_direction() {
	if argument_count = 1 {
		return point_direction(0,0,argument[0].hsp,argument[0].vsp)	
	} else {
		return point_direction(0,0,hsp,vsp)	
	}
}


