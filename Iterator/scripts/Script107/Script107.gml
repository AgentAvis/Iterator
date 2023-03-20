// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function show_options(_pearl){
	var option;
	
	if _pearl.program = "null" {
		option[0] = 
			{
			    mytext : "Relocate",
			    set_script : pearl_enter_relocate_mode
			};
		option[1] = 
			{
			    mytext : "Exit",
			    set_script : pearl_exit
			};
	}	
	
	if _pearl.program = "pearl_creator" {
		option[0] = 
			{
			    mytext : "Create new pearl",
			    set_script : pearl_new_pearl
			};
		option[1] = 
			{
			    mytext : "Relocate",
			    set_script : pearl_enter_relocate_mode
			};
		option[2] = 
			{
			    mytext : "Exit",
			    set_script : pearl_exit
			};
	}
	
	
	vspacing = 10;
	var _i = 0;
	repeat (array_length(option)) {
		draw_set_font(font_Zepto)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		
		
		var _ww = string_width(option[_i].mytext);
		var _tempalpha = .5;
		var _hover_xoffset = 0;
		if point_in_rectangle(oCrosshair.x,oCrosshair.y,_pearl.x,_pearl.y+(_i*vspacing),_pearl.x+_ww,_pearl.y+((_i+1)*vspacing)) {
			_tempalpha = 1
			var _jump_out_amt = 5;
			_hover_xoffset = _jump_out_amt//(_jump_out_amt/2)+(((.5+(cos((oDj.timestep)/(oPuppet.breathing_rate))/2)))*_jump_out_amt)
			if mouse_check_button_pressed(mb_left) {
				script_execute(option[_i].set_script)	
			}
		}
		
		draw_set_alpha(_tempalpha)
		draw_text(_pearl.x+_hover_xoffset,_pearl.y+(_i*vspacing),option[_i].mytext)
		draw_set_alpha(1)
		_i ++
	}
}