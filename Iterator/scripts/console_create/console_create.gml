/// console_create()
function console_create() {
	var Console = ds_map_create();

	Console[? "active"] = false;
	Console[? "sep"] = ",";
	Console[? "cursor"] = 0;
	Console[? "close"] = false;
	Console[? "history"] = ds_list_create();
	Console[? "select"] = 0;
	Console[? "preset"] = false;
	Console[? "dir"] = -1;
	Console[? "string"] = "";
	Console[? "string_pos"] = 1;
	Console[? "text"] = noone;
	Console[? "suggestions"] = noone;

	return Console;






}
