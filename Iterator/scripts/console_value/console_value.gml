/// console_value(Console,value[n])
function console_value(argument0, argument1) {
	var c=argument0,n=argument1;

	if !is_undefined(c[? "arguments"]) {
	    var a = c[? "arguments"];
	    if c[? "count"] >= n {
	        if string_letters(a[n]) = "" { 
	            return real(a[n]);
	        } else return a[n];
	    }
	}






}
