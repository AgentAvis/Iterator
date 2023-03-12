/// console_toggle(Console)
function console_toggle(argument0) {
	var c=argument0;

	/* Clear keyboard string */
	keyboard_string = "";

	/* Enable */
	if !c[? "active"] {
    
	    var sfc_w = surface_get_width(application_surface);
	    var sfc_h = surface_get_height(application_surface);
		bg = sDj
	    c[? "bg"] = bg;
    
	    keyboard_string = "";
	    c[? "active"] = true;

	} else {
    
	    instance_activate_all();
	    /* Disable */
	    c[? "active"] = false;
	    c[? "select"] = 0;
	    c[? "string"] = "";
	    c[? "string_pos"] = 1;

	}







}
