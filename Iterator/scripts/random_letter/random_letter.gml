function random_letter() {
	var o = "_" 
	switch (irandom(26)+1) {
		case 1:  o = "q" ; break;
		case 2:  o = "w" ; break;
		case 3:  o = "e" ; break;
		case 4:  o = "r" ; break;
		case 5:  o = "t" ; break;
		case 6:  o = "y" ; break;
		case 7:  o = "u" ; break;
		case 8:  o = "i" ; break;
		case 9:  o = "o" ; break;
		case 10: o = "p" ; break;
		case 11: o = "a" ; break;
		case 12: o = "s" ; break;
		case 13: o = "d" ; break;
		case 14: o = "f" ; break;
		case 15: o = "g" ; break;
		case 16: o = "h" ; break; 
		case 17: o = "j" ; break;
		case 18: o = "k" ; break;
		case 19: o = "l" ; break;
		case 20: o = "z" ; break;
		case 21: o = "x" ; break;
		case 22: o = "c" ; break;
		case 23: o = "v" ; break;
		case 24: o = "b" ; break;
		case 25: o = "n" ; break;
		case 26: o = "m" ; break;
	}
	return o;



}
