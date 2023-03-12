function string_is_real(argument0) {
	// string_is_real(string)
	var s = argument0;
	var n = string_length(string_digits(s));
	return n > 0 && n == string_length(s) - (string_ord_at(s, 1) == ord("-")) - (string_pos(".", s) != 0);


}
