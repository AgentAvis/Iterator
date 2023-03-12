/// @description ease_inout_elastic(time, start, change, duration)
/// @param time
/// @param  start
/// @param  change
/// @param  duration
function ease_inout_elastic(argument0, argument1, argument2, argument3) {

	/*
	you need to set up a timer for the "time" variable

	time        = the point in time along the graph e.g. at the start 0
	start       = value of the starting point e.g. at the start 100
	change      = the change between starting value and end value e.g. 50 so the end value would be 150
	duration    = amount of "time" it should take to reach the end value e.g. 30 
	*/

	var _s = 1.70158;
	var _p = 0;
	var _a = argument2;

	if (argument0 == 0 || _a == 0)
	{
	    return argument1;
	}

	argument0 /= (argument3 * 0.5);

	if (argument0 == 2)
	{
	    return argument1 + argument2; 
	}

	if (!_p)
	{
	    _p = argument3 * (0.3 * 1.5);
	}

	if (_a < abs(argument2)) 
	{ 
	    _a = argument2; 
	    _s = _p * 0.25; 
	}
	else
	{
	    _s = _p / (2 * pi) * arcsin (argument2 / _a);
	}

	if (argument0 < 1)
	{
	    return -0.5 * (_a * power(2, 10 * (--argument0)) * sin((argument0 * argument3 - _s) * (2 * pi) / _p)) + argument1;
	}
    
	return _a * power(2, -10 * (--argument0)) * sin((argument0 * argument3 - _s) * (2 * pi) / _p) * 0.5 + argument2 + argument1;
    



}
