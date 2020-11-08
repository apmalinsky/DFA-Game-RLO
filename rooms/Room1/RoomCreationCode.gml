game_set_speed(30, gamespeed_fps)
audio_play_sound(theme, 10, false);

global.selected_transition_color = "";
global.selected_transition_color_symbol = ""



//global.red = make_colour_rgb(157, 11, 14); 
//global.green = make_colour_rgb(0, 166, 82);
//global.blue = make_colour_rgb(0, 114, 187);


global.red = make_colour_rgb(250, 94, 90); 
global.green = make_colour_rgb(75, 230, 90);
global.blue = make_colour_rgb(74, 136, 251);


global.num_red_left = 3;
global.num_green_left = 3;
global.num_blue_left = 3;
global.total_num_left = 0; //r + g + b


global.selected__state_color_rgb = make_colour_rgb(157, 157, 0);


global.is_state_selected = false;
//store state id, x, and y coordinates
global.state_selected = {name: "", id: 0, x: 0, y: 0};


//store list of transition ids
global.saved_transition_instance = 0;

global.hovered_transition = 0;
global.duplicate_hovered_transition = false;

global.sequence = [];


//states 100019, 100018, 100020
//transitions 100012, 100013, 100014, 100015, 100016, 100017, 100021

global.addedTransition = false;



global.states_info = {
	stateA: {
		name: "stateA",
		id: 100020,
		toA: 100011, //loop
		toB: 100023,
		toC: 100024,
	},
	stateB: {
		name: "stateB",
		id: 100021,
		toA: 100028,
		toB: 100011, //loop
		toC: 100026,
	},
	stateC: {
		name: "stateC",
		id: 100022,
		toA: 100025,
		toB: 100027,
		toC: 100011, //loop
	}

}



global.num_states = 3;
global.strings=array_create(global.num_states, 0);
global.num_strings = 3;
global.num_symbols = 3;


global.dfa = {
	transitions: initTrans(),
    states: array_create(global.num_states, 0),
	alphabet: array_create(global.num_symbols, 0),
	start: "s1",
	final: "s"+string(global.num_states)
}


string1 = "rrrr";
string2 = "bg";
string3 = "bgbg";

x_pos = 895;
y_pos = 545;

in1 = instance_create_layer(x_pos, y_pos, "Instances", Input_sequence);
in1.sequence = string1;

in2 = instance_create_layer(x_pos, y_pos + 64, "Instances",  Input_sequence);
in2.sequence = string2;

in3 = instance_create_layer(x_pos, y_pos + 128, "Instances",  Input_sequence);
in3.sequence = string3;


in1.alarm[0] = 1;
in2.alarm[0] = 1;
in3.alarm[0] = 1;





/*
global.dfa = {
	transitions:{}
	states_info:
	start_state:
	end_state:
}
*/



