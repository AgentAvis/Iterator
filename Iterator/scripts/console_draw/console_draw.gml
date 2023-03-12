/// console_draw(Console,height,bg_color1,bg_color2,text_color1,text_color2,alpha)
function console_draw(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var c,h,b1,b2,t1,t2,a;

	c = argument0;
	h = argument1;
	b1 = argument2;
	b2 = argument3;
	t1 = argument4;
	t2 = argument5;
	a = argument6;
	var scale = 1.1//round(clamp(sc,1,2));
	/* If enabled */
	//if c[? "active"] {
		draw_set_halign(fa_left);
	    /* Background */

	    //draw_background_ext(c[? "bg"],__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),1,1,0,c_white,1);

	    /* Get view width */
	    var w;
	    w = window_get_width() //surface_get_width(application_surface)*2;
    
	    /* Get line height */
	    var l,p;
	    l = string_height(string_hash_to_newline("W")) * scale; 
	    p = 8 * scale; // Padding
    
	    /*  alpha */
	    draw_set_alpha(a);
    
	    /* Command history window */
	    draw_set_color(b1);
	    draw_rectangle(0,0,w,(h+(p*2)),false);
    
	    /* Command history */
	    var ch,list = c[? "history"];
	    draw_set_color(t1);
	    for (ch=0;ch<round(h/l);ch++) {
    
	        var cmd = list[| ch];
	        if !is_undefined(cmd) {
	            draw_text_transformed(p,h-(p*2)-(ch*l),string_hash_to_newline(cmd),scale,scale,0);
	        }
    
	    }
    
	    /* Suggestions */
	    if ds_exists(c[? "suggestions"],ds_type_list)
	    && ds_list_size(c[? "suggestions"]) > 0 {
	        var s,sugs = c[? "suggestions"];
	        draw_set_color(b1);
	        draw_rectangle(0,(h+(p*4))+l,w,(h+(p*4))+l+(l*ds_list_size(sugs))+(p*2),false);
	        draw_set_color(t1);
	        for(s=0;s<ds_list_size(sugs);s++) {
	            if !is_undefined(sugs[| s]) {
	                draw_text_transformed(p,((h+(p*5))+l)+(l*s),string_hash_to_newline(sugs[| s]),scale,scale,0);
	            }
	        }
	    }
    
	    /* Submit window */
	    draw_set_color(b2);
	    draw_rectangle(0,(h+(p*2)),w,(h+(p*4))+l,false);
    
	    /* Greater than symbol */
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	    draw_set_color(t1);
	    draw_text_transformed(p,h+(p*3),string_hash_to_newline("> "),scale,scale,0);
    
	    /* Draw input */
	    draw_set_alpha(1);
	    draw_set_color(t2);
	    draw_text_transformed(p+string_width(string_hash_to_newline("> ")),h+(p*3),string_hash_to_newline(c[? "string"]),scale,scale,0);
    
	    /* Cursor alpha */
	    c[? "cursor"] += 0.1;
	  //  if c[? "cursor"] <= 1 then draw_set_alpha(1);
	    if c[? "cursor"] > 1 && c[? "cursor"] <= 2 then draw_set_alpha(0);
	    if c[? "cursor"] > 2 {
	        draw_set_alpha(1);
	        c[? "cursor"] = 0;
	    }
	
		draw_set_alpha(.5+(sin(current_time/250)/2))
		draw_set_color(merge_color(draw_get_color(),c_white,.5))
    
	    /* Draw cursor */
	    draw_text_transformed(p+string_width(string_hash_to_newline("> "))+string_width(string_hash_to_newline(string_copy(c[? "string"],1,c[? "string_pos"]-1)))*scale,h+(p*3),string_hash_to_newline("I"),scale,scale,0);

	    /* Reset alpha */
	    draw_set_alpha(1);
  
	//}






}
