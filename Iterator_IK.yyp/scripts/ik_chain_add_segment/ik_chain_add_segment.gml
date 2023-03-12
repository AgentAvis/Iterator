/// @desc adds a bone segment to the chain
/// @param ik
/// @param lenA (the length of the first bone in the arm)
/// @param lenB (the length of the second bone in the arm)
function ik_chain_add_segment(argument0, argument1, argument2) {
	var ik_nodes = argument0[IK_CHAIN.nodes];
	var ik_lenA = real(argument1);
	var ik_lenB = real(argument2);
	if((ik_lenA<=0)||(ik_lenB<=0)){
		show_error("Bone lengths must be positive!",true);
		return;
	}
	ik_nodes[@ array_length_1d(ik_nodes)] = [0,0,ik_lenA,ik_lenB]; // [x,y, lenA,lenB]


}
