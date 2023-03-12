function parse_script(argument0) {
	var str = argument0;


	var scrName = string_copy(str,1,string_pos("(",str) - 1);

	var numArguments = string_count(",",str) + 1;

	var arguments;
	arguments[10000] = undefined;
	if(numArguments != 1){
	for(var i = 0; i < numArguments; i++){

	if(i = 0){

	arguments[i] = string_copy_index(str,string_pos("(",str) + 1,string_pos_ext(str,",",1) - 1);

	}



	if(i != 0 and i != numArguments - 1){
	arguments[i] = string_copy_index(str,string_pos_ext(str,",",i + 1) - 1, string_pos_ext(str,",",i + 1) - 1);
	}


	if(i = numArguments - 1){

	arguments[i] = string_copy_index(str,string_pos_ext(str,",",numArguments - 1) + 1, string_pos(")",str) - 1);;
	
	}
	
	}
	}else{

	arguments[0] = string_copy_index(str,string_pos("(",str) + 1,string_pos(")",str) - 1);
	
	}

	for(var b = 0; b < numArguments; b++){

	if ( string( real( arguments[b] ) ) == string( arguments[b] ) ) {
		arguments[b] = real(arguments[b]);
	} else {
	    //It's a string
	}

	}

	script_execute(asset_get_index(scrName),arguments[0],arguments[1],arguments[2],arguments[3],arguments[4],arguments[5],arguments[6],arguments[7],arguments[8]);
	//draw_text(500,500,"\nArgument 0 : " + string(arguments[0]) + "\nArgument 1 : " + string(arguments[1]) + "\nArgument 2 : " + string(arguments[2]));



}
