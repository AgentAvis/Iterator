/// console_add(Console,suggestion/help string)
function console_add(argument0, argument1) {
	var c=argument0,str=argument1;

	var list;
	if !ds_exists(c[? "text"],ds_type_list) {
	    list = ds_list_create();
	} else list = c[? "text"];

	ds_list_add(list,str);

	c[? "text"] = list;

	if !ds_exists(c[? "suggestions"],ds_type_list) {
	    c[? "suggestions"] = ds_list_create();
	}






}
