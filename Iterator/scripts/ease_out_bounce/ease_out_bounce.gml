/// @description ease_out_bounce(time, start, change, duration)
/// @param time
/// @param  start
/// @param  change
/// @param  duration
function ease_out_bounce(argument0, argument1, argument2, argument3) {

	/*
	you need to set up a timer for the "time" variable

	time        = the point in time along the graph e.g. at the start 0
	start       = value of the starting point e.g. at the start 100
	change      = the change between starting value and end value e.g. 50 so the end value would be 150
	duration    = amount of "time" it should take to reach the end value e.g. 30 
	*/

	argument0 /= argument3;

	if (argument0 < (1 / 2.75))
	{
	    return argument2 * (7.5625 * argument0 * argument0) + argument1;
	}
	else
	if (argument0 < (2 / 2.75))
	{
	    argument0 -= (1.5 / 2.75);
	    return argument2 * (7.5625 * argument0 * argument0 + 0.75) + argument1;
	}
	else
	if (argument0 < (2.5 / 2.75))
	{
	    argument0 -= (2.25 / 2.75);
	    return argument2 * (7.5625 * argument0 * argument0 + 0.9375) + argument1;
	}
	else
	{
	    argument0 -= ( 2.625 / 2.75 );
	    return argument2 * (7.5625 * argument0 * argument0 + 0.984375) + argument1;
	}



}
