// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function g_initLevel(init){
//init patterns
//set logic
//set game object parameters, colors
// given strings, num states, alphabet

	var num_strings = 0;
	var strings=[];
	var str = "\\"+init+".txt";
	var i, file;
	file = file_text_open_read(working_directory + src);
	if(file!=-1){
		num_states = real(file_text_readln(file));
		show_debug_message(num_states);
		num_strings = real(file_text_readln(file));
		show_debug_message(num_strings);

		strings=[num_strings];
		for (var i = 0;i<num_strings;i++){
			strings[i] = file_text_readln(file);
			show_debug_message(strings[i]);
		}

		file_text_close(file);
	}

	else{
		show_debug_message("Init file failed to open");
	    game_end();
	}

}