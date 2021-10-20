
//switch for edit mode, when making new rooms
global.editMode = true;
//global.editMode = false;


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
global.num_red_left = 2;
global.num_green_left = 2;
global.num_blue_left = 2;

global.red_count = instance_create_layer(125, 35, "Instances", ArrowCountObj);
global.red_count.image_index = global.num_red_left;
global.red_count.color = "r";
global.green_count = instance_create_layer(125, 125, "Instances", ArrowCountObj);
global.green_count.image_index = global.num_green_left; 
global.green_count.color = "g";

global.blue_count = instance_create_layer(125, 215, "Instances", ArrowCountObj);
global.blue_count.visible = false;
//global.blue_count.image_index = global.num_blue_left;
//global.blue_count.color = "b";

global.total_num_left = 0; //r + g + b
global.selected_state_color_rgb = make_colour_rgb(255, 255, 200);
global.is_state_selected = false;
//store state id, x, and y coordinates
global.state_selected = {name: "", id: 0, x: 0, y: 0};
global.is_hovering_state = false;
global.hovered_transition = 0;
global.duplicate_hovered_transition = false;
global.sequence = [];
global.addedTransition = false;


global.stateIDs = [100086,100088,100089]

global.states_info = {
	s1: {
		name: "s1",
		id: 100086,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100108, 100109, 100110]
		},
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100106, 100105, 100107]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100092, 100093, 100094]
		}
	},
	s2: {
		name: "s2",
		id: 100088,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100091, 100095, 100090]
		},
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100115, 100114, 100116]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100103, 100102, 100104]
		} 
	},
	s3: {
		name: "s3",
		id: 100089,
		to1: {
			addedIndices: [-1,-1,-1],
			transitions: [100096, 100098, 100097]
		}, 
		to2: {
			addedIndices: [-1,-1,-1],
			transitions: [100100, 100099, 100101]
		},
		to3: {
			addedIndices: [-1,-1,-1],
			transitions: [100113, 100112, 100111]
		}
	},

}

//not sure if we just count total stars or per level, see scr_sceenObjs for how it might work
global.num_levels = 1;
global.star_count = 0;
global.levelStars = array_create(global.num_levels, 0);


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


string1 = "g";
string2 = "rgr";
string3 = "rggg";

x_pos = 901;
y_pos = 564;

in1 = instance_create_layer(x_pos, y_pos, "Instances", Input_sequence);
in1.sequence = string1;
in1.acceptingOrNot = true;

in2 = instance_create_layer(x_pos, y_pos + 64, "Instances",  Input_sequence);
in2.sequence = string2;
in2.acceptingOrNot = true;

in3 = instance_create_layer(x_pos, y_pos + 128, "Instances",  Input_sequence);
in3.sequence = string3;
in3.acceptingOrNot = false;

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



