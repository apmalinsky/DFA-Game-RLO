
//switch for edit mode, when making new rooms
//global.editMode = true;
global.editMode = false;

if(global.editMode){
	editOn();
	show_debug_message("EDITING")
}


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


global.stateIDs = [100043,100045,100046]

global.states_info = {
	s1: {
		name: "s1",
		id: 100043,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100065, 100066, 100067]
		},
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100063, 100062, 100064]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100049, 100050, 100051]
		}
	},
	s2: {
		name: "s2",
		id: 100045,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100048, 100052, 100047]
		},
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100072, 100071, 100073]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100060, 100059, 100061]
		} 
	},
	s3: {
		name: "s3",
		id: 100046,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100053, 100055, 100054]
		}, 
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100057, 100056, 100058]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100070, 100069, 100068]
		}
	},

}

//not sure if we just count total stars or per level, see scr_sceenObjs for how it might work
global.num_levels = 1;
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


string1 = "r";
string2 = "gr";
string3 = "rggr";

x_pos = 901;
y_pos = 564;

in1 = instance_create_layer(x_pos, y_pos, "Instances", Input_sequence);
in1.sequence = string1;

in2 = instance_create_layer(x_pos, y_pos + 64, "Instances",  Input_sequence);
in2.sequence = string2;

in3 = instance_create_layer(x_pos, y_pos + 128, "Instances",  Input_sequence);
in3.sequence = string3;

global.inputs[0] = in1;
global.inputs[1] = in2;
global.inputs[2] = in3;

in1.alarm[0] = 1;
in2.alarm[0] = 1;
in3.alarm[0] = 1;


global.runningDFA = false;

/*
global.animationSequence = {
	
	seq1: {
		tIDs: [0, 0, 0, 0, 0]
		goalIDs: []
	},
	seq2: [0, 0, 0, 0, 0],
	seq3: [0, 0, 0, 0, 0],
}

*/


global.doingAnimation = false;
global.animatingTransition = 0;
//global.doneAnimation = false;


