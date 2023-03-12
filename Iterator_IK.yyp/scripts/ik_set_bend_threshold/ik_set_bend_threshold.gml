/// @desc a global flag which tells the chain how much to bend an arm before stopping
/// @param amount
function ik_set_bend_threshold(argument0) {
	global.ik_chain_bendThreshold = clamp(real(argument0),0,1);


}
