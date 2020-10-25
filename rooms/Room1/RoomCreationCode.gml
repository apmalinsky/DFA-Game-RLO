game_set_speed(30, gamespeed_fps)

global.selected_color = "";

global.red = make_colour_rgb(157, 11, 14); 
global.green = make_colour_rgb(0, 166, 82);
global.blue = make_colour_rgb(0, 114, 187);

global.num_red_used = 0;
global.num_green_used = 0;
global.num_blue_used = 0;


global.selected_color_rgb = make_colour_rgb(157, 157, 0);

global.is_state_selected = false;
//store state id, x, and y coordinates
global.state_selected = {id: 0, x: 0, y: 0};



//store list of points to create path with (trace on submission)
global.saved_transition_instance = {};


global.sequence = [];