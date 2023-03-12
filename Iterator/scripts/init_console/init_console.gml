function init_console() {
	/*****************************
	* This creates the Console
	* system and stores it in a
	* variable.
	*****************************/
	my_console = console_create();

	/*****************************
	* This allows you to override
	* the default settings for the
	* Console system.
	*****************************/
	console_settings(my_console,",",false);

	/*****************************
	* This loads some preset commands
	* into the Console system.
	*****************************/
	//console_preset(my_console);

	/*****************************
	* This loads all the available
	* commands from a text file,
	* which will be shown as suggestions
	* whilst the use_r types.
	*****************************/
	//console_text_open(my_console,"commands.txt");

	/*****************************
	* You can also add individual
	* commands to the suggestions
	* list.
	*****************************/
	//console_add(my_console,"down [amount to shrink Console by]")
	//console_add(my_console,"up [amount to grow Console by]")
	s = my_console[? "sep"];
	console_add(my_console,"help"+s+"-provides info pertaining to Console")
	str = "type help if you don't know how to use me!"
	ds_list_insert(my_console[? "history"],0,str);	


	done = false;
	gunliststring = ""
	makenumber = 0




}
