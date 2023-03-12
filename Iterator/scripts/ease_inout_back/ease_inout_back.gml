/// @description ease_inout_back(time, start, change, duration)
/// @param time
/// @param  start
/// @param  change
/// @param  duration
function ease_inout_back(argument0, argument1, argument2, argument3) {

	/*
	you need to set up a timer for the "time" variable

	time        = the point in time along the graph e.g. at the start 0
	start       = value of the starting point e.g. at the start 100
	change      = the change between starting value and end value e.g. 50 so the end value would be 150
	duration    = amount of "time" it should take to reach the end value e.g. 30 
	*/

	var _s = 1.70158;

	argument0 /= argument3;
	argument0 *= 2;

	if ((argument0) < 1)
	{
	    _s *= (1.525);
	    return argument2 * 0.5 * (argument0 * argument0 * ((_s + 1) * argument0 - _s)) + argument1;
	}

	argument0 -= 2;
	_s *= 1.525
	return argument2 * 0.5 * ((argument0) * argument0 * ((_s + 1) * argument0 + _s) + 2) + argument1;



}
