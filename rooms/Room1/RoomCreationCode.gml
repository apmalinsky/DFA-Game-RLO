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
global.state_selected = {id: 0, x: 0, y: 0};

//show_debug_message(TransitionObj.id)
//global.transition_obj = TransitionObj;


//store list of transition ids
global.saved_transition_instance = 0;


global.sequence = [];

gml_pragma("global", "g_runFirst()");
g_initLevel("Note1");
g_initDFA();
