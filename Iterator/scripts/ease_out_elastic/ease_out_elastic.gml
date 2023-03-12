/// @description ease_out_elastic(time, start, change, duration)
/// @param time
/// @param  start
/// @param  change
/// @param  duration
function ease_out_elastic(argument0, argument1, argument2, argument3) {

	/*
	you need to set up a timer for the "time" variable

	time        = the point in time along the graph e.g. at the start 0
	start       = value of the starting point e.g. at the start 100
	change      = the change between starting value and end value e.g. 50 so the end value would be 150
	duration    = amount of "time" it should take to reach the end value e.g. 30 
	*/

	var _s = 1.70158;
	var _p = 0;
	var time = argument0;
	var start = argument1;
	var change = argument2;
	var duration = argument3;


	if (time == 0 or change == 0)
	    {
	    return start;
	    }

	time /= duration;

	if (time == 1)
	    {
	    return start + argument2;
	    }

	if (!_p)
	    {
	    _p = duration * 0.3;
	    }

	if (change < abs(argument2)) 
	    { 
	    change = argument2;
	    _s = _p * 0.25; 
	    }
	else 
	    {
	    _s = _p / (2 * pi) * arcsin (argument2 / change);
	    }

	return change * power(2, -10 * time) * sin((time * duration - _s) * (2 * pi) / _p ) + argument2 + start;


}
