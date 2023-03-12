function time_and_date() {

	var _ret = "";

	var _hour = current_hour;

	var amorpm = "AM";

	switch (date_get_weekday(date_current_datetime())) {
	    case 0:
	        _ret += "Sunday "
	        break;
	    case 1:
	        _ret += "Monday "
	        break;		
	    case 2:
	        _ret += "Tuesday "
	        break;		
	    case 3:
	        _ret += "Wednesday "
	        break;
	    case 4:
	        _ret += "Thursday "
	        break;		
	    case 5:
	        _ret += "Friday "
	        break;		
	    case 6:
	        _ret += "Saturday "
	        break;				
	    default:
	        _ret += "Someday "
	        break;
	}

	//_ret += string(current_month) + " "

	switch (current_month) {
	    case 1:
			_ret += "Jan "    
	    break;
		case 2:
	        _ret += "Feb "    
	    break;
		case 3:
	        _ret += "Mar "    
	    break;	
		case 4:
	        _ret += "Apr "    
	    break;
		case 5:
	        _ret += "May "    
	    break;
		case 6:
	        _ret += "Jun "    
	    break;	
		case 7:
	        _ret += "Jul "    
	    break;		
		case 8:
	        _ret += "Aug "    
	    break;		
		case 9:
	        _ret += "Sep "    
	    break;
		case 10:
	        _ret += "Oct "    
	    break;
		case 11:
	        _ret += "Nov "    
	    break;
		case 12:
	        _ret += "Dec "    
	    break;
	}


	_ret += string(current_day) + " "


	if _hour > 12 { _hour -= 12 amorpm = "PM" }

	_ret += string(_hour)+"-";

	if current_minute < 10 {
		_ret += "0"	
	}

	_ret += string(current_minute)

	_ret += " " + amorpm

	_ret += " "+string(current_second)

	return _ret;


}
