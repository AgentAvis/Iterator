/// @desc performs backward kinematics
/// @param ik
/// @param x
/// @param y
function ik_chain_tug_backward(argument0, argument1, argument2) {
	var ik_effector_x = real(argument1);
	var ik_effector_y = real(argument2);
	var ik_nodes = argument0[IK_CHAIN.nodes];
	var ik_node_count = array_length_1d(ik_nodes);
	if(ik_node_count>0){
		var ik_target_x = ik_effector_x;
		var ik_target_y = ik_effector_y;
		var ik_node_id_first = 0;
		var ik_node_first = ik_nodes[ik_node_id_first];
		ik_node_first[@ 0] = ik_target_x;
		ik_node_first[@ 1] = ik_target_y;
		var ik_node_lena = ik_node_first[2];
		var ik_node_lenb = ik_node_first[3];
		for(var ik_node_id = ik_node_id_first+1; ik_node_id<ik_node_count; ik_node_id++){
			var ik_node = ik_nodes[ik_node_id];
			var ik_node_x = ik_node[0];
			var ik_node_y = ik_node[1];
			// get lengths
			var ik_node_lmax = ik_node_lena+ik_node_lenb;
			var ik_node_lmin = lerp(abs(ik_node_lena-ik_node_lenb),ik_node_lmax,global.ik_chain_bendThreshold);
			// constrain distance
			var ik_node_dx = ik_node_x-ik_target_x;
			var ik_node_dy = ik_node_y-ik_target_y;
			var ik_node_dd = max(point_distance(0,0,ik_node_dx,ik_node_dy),0.001);
			var ik_node_du = clamp(ik_node_dd,ik_node_lmin,ik_node_lmax)/ik_node_dd;
			ik_node_dx *= ik_node_du;
			ik_node_dy *= ik_node_du;
			ik_node_x = ik_target_x+ik_node_dx;
			ik_node_y = ik_target_y+ik_node_dy;
			// update
			ik_target_x = ik_node_x;
			ik_target_y = ik_node_y;
			ik_node[@ 0] = ik_target_x;
			ik_node[@ 1] = ik_target_y;
			ik_node_lena = ik_node[2];
			ik_node_lenb = ik_node[3];
		}
		// constrain head
		var ik_head_x = argument0[IK_CHAIN.head_x];
		var ik_head_y = argument0[IK_CHAIN.head_y];
		var ik_head_lmax = ik_node_lena+ik_node_lenb;
		var ik_head_lmin = lerp(abs(ik_node_lena-ik_node_lenb),ik_head_lmax,global.ik_chain_bendThreshold);
		var ik_head_dx = ik_head_x-ik_target_x;
		var ik_head_dy = ik_head_y-ik_target_y;
		var ik_head_dd = max(point_distance(0,0,ik_head_dx,ik_head_dy),0.001);
		var ik_head_du = clamp(ik_head_dd,ik_head_lmin,ik_head_lmax)/ik_head_dd;
		ik_head_dx *= ik_head_du;
		ik_head_dy *= ik_head_du;
		argument0[@ IK_CHAIN.head_x] = ik_target_x+ik_head_dx;
		argument0[@ IK_CHAIN.head_y] = ik_target_y+ik_head_dy;
	}


}
