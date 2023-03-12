/// @arg name
/// @arg description/arguments,CommaSeperated
function add_command() {

	if argument_count > 1 {
		console_add(my_console,string(argument[0])+s+string(argument[1]))
	} else {
		console_add(my_console,string(argument[0]))
	}


}
function c_argument() {
	console_value(my_console,argument[0])
}

/// @arg command
function CMD(argument0) {
	return console_cmd(oConsole.my_console,argument0);
}

/// @arg string
function console_print(argument0) {
	var str = argument0;
	with (oConsole) {
		var list = my_console[? "history"];	
		ds_list_insert(list,0,str);
		show_debug_message(str)
	}
}
