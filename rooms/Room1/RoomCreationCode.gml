game_set_speed(30, gamespeed_fps)

global.selected_transition_color = "";
global.selected_transition_color_symbol = ""


//global.red = make_colour_rgb(157, 11, 14); 
//global.green = make_colour_rgb(0, 166, 82);
//global.blue = make_colour_rgb(0, 114, 187);


global.red = make_colour_rgb(250, 94, 90); 
global.green = make_colour_rgb(75, 230, 90);
global.blue = make_colour_rgb(74, 136, 251);

global.num_red_used = 0;
global.num_green_used = 0;
global.num_blue_used = 0;


global.selected__state_color_rgb = make_colour_rgb(157, 157, 0);


global.is_state_selected = false;
//store state id, x, and y coordinates
global.state_selected = {name: "", id: 0, x: 0, y: 0};

//show_debug_message(TransitionObj.id)
//global.transition_obj = TransitionObj;


//store list of transition ids
global.saved_transition_instance = 0;

global.hovered_transition = 0;

global.sequence = [];


//states 100019, 100018, 100020
//transitions 100012, 100013, 100014, 100015, 100016, 100017, 100021

global.addedTransition = false;



global.states_info = {
	stateA: {
		name: "stateA",
		id: 100018,
		toA: 100020, //loop
		toB: 100011,
		toC: 100015,
	},
	stateB: {
		name: "stateB",
		id: 100017,
		toA: 100014,
		toB: 100021, //loop
		toC: 100012,
	},
	stateC: {
		name: "stateC",
		id: 100019,
		toA: 100016,
		toB: 100013,
		toC: 100021, //loop
	}

}



global.strings=[];
global.num_states = 3;
global.num_strings = 3;
global.num_symbols = 3;

global.dfa = {
//	transitions: initTrans(),
    //states: array_create(global.num_states, 0),
//	alphabet: array_create(global.num_symbols, 0),
//	start: "s1",
//	final: "s"+global.num_states
}











//gml_pragma("global", "g_runFirst()");
//g_initLevel("Note1");
//g_initDFA();







