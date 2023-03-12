/// @desc returns the points of all "elbows"
/// @param ik
/// @param positive
function ik_chain_get_points(argument0, argument1) {
	var ik_nodes = argument0[IK_CHAIN.nodes];
	var ik_node_count = array_length_1d(ik_nodes);
	if(ik_node_count>0){
		var ik_bendDir = argument1 ? 1 : -1;
		var ik_target_x = argument0[IK_CHAIN.head_x];
		var ik_target_y = argument0[IK_CHAIN.head_y];
		var ik_points = [ik_target_x,ik_target_y];
		var ik_node_id_last = ik_node_count-1;
		for(var ik_node_id = ik_node_id_last; ik_node_id>=0; ik_node_id--){
			var ik_node = ik_nodes[ik_node_id];
			var ik_node_x = ik_node[0];
			var ik_node_y = ik_node[1];
			// perform 2 chain ik
			var ik_tx = ik_target_x-ik_node_x;
			var ik_ty = ik_target_y-ik_node_y;
			var ik_dd = ik_tx*ik_tx+ik_ty*ik_ty;
			var ik_dir = -darctan2(ik_ty,ik_tx);
			var ik_lena = ik_node[2];
			var ik_lenb = ik_node[3];
			var ik_rotb = darccos(clamp((ik_dd-ik_lena*ik_lena-ik_lenb*ik_lenb)/max(2*ik_lena*ik_lenb,0.0000001),-1,1))*-ik_bendDir;
			var ik_rota = ik_dir-darctan2(ik_lenb*dsin(ik_rotb),ik_lena+ik_lenb*dcos(ik_rotb));
			// add points
			var ik_point_id = array_length_1d(ik_points);
			ik_points[@ ik_point_id+3] = ik_node_y;
			ik_points[@ ik_point_id+2] = ik_node_x;
			ik_points[@ ik_point_id+1] = ik_node_y+ik_lena*-dsin(ik_rota);
			ik_points[@ ik_point_id+0] = ik_node_x+ik_lena*dcos(ik_rota);
			// pass next target
			ik_target_x = ik_node_x;
			ik_target_y = ik_node_y;
			ik_bendDir *= -1;
		}
		return ik_points;
	}	return -1;


}
