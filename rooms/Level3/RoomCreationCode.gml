

//switch for edit mode, when making new rooms
//global.editMode = true;
global.editMode = false;


if(global.editMode){
	editOn();
	show_debug_message("EDITING")
}



initCommonVars();


global.stateIDs = [100081,100083,100084]

global.states_info = {
		s1: {
			name: "s1",
			id: 100081,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [100103, 100104, 100105]
			},
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [100101, 100100, 100102]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [100087, 100088, 100089]
			}
		},
		s2: {
			name: "s2",
			id: 100083,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [100086, 100090, 100085]
			},
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [100110, 100109, 100111]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [100098, 100097, 100099]
			} 
		},
		s3: {
			name: "s3",
			id: 100084,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [100091, 100093, 100092]
			}, 
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [100095, 100094, 100096]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [100108, 100107, 100106]
			}
		},

	}



//not sure if we just count total stars or per level, see scr_sceenObjs for how it might work
global.num_levels = 1;
global.star_count = 0;
global.level_stars = array_create(global.num_levels, 0);





global.dfa = {
	transitions: initTrans(),
	states: initStates(),
	alphabet: initAlphabet(),
	start: "s1",
	final: "s3"
}


string1 = "gggrr";
string2 = "bbrrg";
string3 = "grrrb";

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
