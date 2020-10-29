game_set_speed(30, gamespeed_fps)

global.selected_transition_color = "";

global.red = make_colour_rgb(157, 11, 14); 
global.green = make_colour_rgb(0, 166, 82);
global.blue = make_colour_rgb(0, 114, 187);

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


//states 100022, 100021, 100023
//transitions 100015, 100016, 100017, 100018, 100019, 100020

global.addedTransition = false;



global.states_info = {
	stateA: {
		name: "stateA",
		id: 100022,
		toA: 100024, //loop
		toB: 100015,
		toC: 100019,
	},
	stateB: {
		name: "stateB",
		id: 100021,
		toA: 100018,
		toB: 100024, //loop
		toC: 100016,
	},
	stateC: {
		name: "stateC",
		id: 100023,
		toA: 100020,
		toB: 100017,
		toC: 100024, //loop
	}

}











gml_pragma("global", "g_runFirst()");
g_initLevel("Note1");
g_initDFA();
