function ik_create_chain() {
	gml_pragma("global","global.ik_chain_bendThreshold = 0.1;");
	enum IK_CHAIN{
		head_x,
		head_y,
		nodes,
		sizeof
	}
	/// @desc create a new ik chain
	var ik_structure = array_create(IK_CHAIN.sizeof);
	ik_structure[@ IK_CHAIN.nodes] = [];
	// setup
	ik_chain_tug_forward(ik_structure,0,0);
	ik_chain_tug_backward(ik_structure,0,0);
	// return final structure
	return ik_structure;


}
