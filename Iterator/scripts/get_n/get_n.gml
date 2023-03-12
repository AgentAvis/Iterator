///get_n
///@param instance
///@param object
function get_n(argument0, argument1) {
	var _inst = argument0, _obj = argument1;
	if(_inst.object_index == _obj){
	    for(var i = 0; i < instance_number(_obj); i++){
	        if(instance_find(_obj, i) == _inst) return i;
	    }

	    //It should be impossible to reach here, so we may as well crash the game because_ reality broke
	    while(true){
	        surface_create(2048,2048);
	    }
	}

	return -1;



}
