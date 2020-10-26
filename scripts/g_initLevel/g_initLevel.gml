// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//init patterns
//set logic
//set game object parameters, colors
// given strings, num states, alphabet
init = argument0;
var str = "\\"+init+".txt";
var i, file;
file = file_text_open_read(working_directory + str);
if(file!=-1){
	global.num_states = real(file_text_readln(file));
	show_debug_message(global.num_states);
	global.num_strings = real(file_text_readln(file));
	show_debug_message(global.num_strings);

	global.strings=[global.num_strings];
	for (var i = 0;i<global.num_strings;i++){
		global.strings[i] = file_text_readln(file);
		show_debug_message(global.strings[i]);
	}

	file_text_close(file);
}

else{
	show_debug_message("Init file failed to open");
	game_end();
}