
if (room == Room3) {
	show_debug_message("ROOOOM 3")
	
}


//switch for edit mode, when making new rooms
//global.editMode = true;
global.editMode = false;


if(global.editMode){
	editOn();
	show_debug_message("EDITING")
}



initCommonVars();


global.stateIDs = [100079,100081,100082]

global.states_info = {
		s1: {
			name: "s1",
			id: 100079,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [100101, 100102, 100103]
			},
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [100099, 100098, 100100]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [100085, 100086, 100087]
			}
		},
		s2: {
			name: "s2",
			id: 100081,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [100084, 100088, 100083]
			},
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [100108, 100107, 100109]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [100096, 100095, 100097]
			} 
		},
		s3: {
			name: "s3",
			id: 100082,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [100089, 100091, 100090]
			}, 
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [100093, 100092, 100094]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [100106, 100105, 100104]
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
