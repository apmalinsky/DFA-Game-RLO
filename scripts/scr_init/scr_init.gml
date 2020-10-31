// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//an idea to init the level from a text file, like a configuration
//tentatively assumes text file is accessible from working directory
//and that first line is num_states, 2nd number of strings to follow
//after that the strings should be the stirngs to be checked by the dfa when testing, (the ones on the right)

function scr_init(init){

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
	dfa.states = [num_states];
	dfa.alphabet = [num_symbols];
	dfa.final = "s"+num_states;

	file_text_close(file);
}

else{
	show_debug_message("Init file failed to open");
	game_end();
}



}
