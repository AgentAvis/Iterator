/// @desc lerp_but_with_angles
/// @arg angle
/// @arg target_angle
/// @arg value
function angle_lerp(argument0, argument1, argument2) {
	var angle = argument0;
	var target_angle = argument1;
	var value = argument2;

	angle += angle_difference(target_angle,angle)*value

	return angle;



}

/**
 * interpolate between angles
 * @param {real} a start
 * @param {real} b end
 * @param {real} i increment
 * @returns {real}
 */
function lerp_angle(a, b, i) {
	var n = a + angle_difference(b, a);
	return lerp(a, n, i);
}