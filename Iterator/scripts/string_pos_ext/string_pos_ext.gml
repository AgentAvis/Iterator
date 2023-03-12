/// string_pos_ext(string, char, index)
function string_pos_ext(argument0, argument1, argument2) {

	var text = argument0;
	var char = argument1;
	var index = max(0, argument2);

	for (var i=1; i<=string_length(text); i++)
	{
	    if string_char_at(text, i) == char
	    {
	        index--;
	        if index < 1 return i;
	    }
	}

	return -1;


}
