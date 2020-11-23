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
global.num_red_left = 7;
global.num_green_left = 7;
global.num_blue_left = 7;
global.total_num_left = 0; //r + g + b
global.selected_state_color_rgb = make_colour_rgb(157, 157, 0);
global.is_state_selected = false;
//store state id, x, and y coordinates
global.state_selected = {name: "", id: 0, x: 0, y: 0};
global.is_hovering_state = false;
global.hovered_transition = 0;
global.duplicate_hovered_transition = false;
global.sequence = [];
global.addedTransition = false;



global.states_info = {
	s1: {
		name: "s1",
		id: 100011,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100010, 100010, 100010]
		},
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100014, 100022, 100021]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100030, 100029, 100015]
		}
	},
	s2: {
		name: "s2",
		id: 100012,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100027, 100028, 100019]
		},
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100010, 100010, 100010]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100017, 100023, 100024]
		} 
	},
	s3: {
		name: "s3",
		id: 100013,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100016, 100032, 100031]
		}, 
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100026, 100025, 100018]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100010, 100010, 100010]
		}
	},

}

//not sure if we just count total stars or per level, see scr_sceenObjs for how it might work
global.num_levels=1;
global.star_count = 0;
global.level_stars = array_create(global.num_levels, 0);


//Logic global vars
global.num_states = 3;
global.num_strings = 3;
global.strings = array_create(global.num_strings, 0);
global.num_symbols = 3;


global.dfa = {
	transitions: initTrans(),
    states: initStates(),
	alphabet: initAlphabet(),
	start: "s1",
	final: "s3"
}


string1 = "rrrr";
string2 = "bg";
string3 = "bgbg";

global.string[0]=string1;
global.string[1]=string2;
global.string[2]=string3;

x_pos = 901;
y_pos = 564;

in1 = instance_create_layer(x_pos, y_pos, "Instances", Input_sequence);
in1.sequence = string1;

in2 = instance_create_layer(x_pos, y_pos + 64, "Instances",  Input_sequence);
in2.sequence = string2;

in3 = instance_create_layer(x_pos, y_pos + 128, "Instances",  Input_sequence);
in3.sequence = string3;


in1.alarm[0] = 1;
in2.alarm[0] = 1;
in3.alarm[0] = 1;




