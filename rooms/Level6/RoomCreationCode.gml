
room_persistent = true;
//switch for edit mode, when making new rooms
//global.editMode = true;
global.editMode = false;

if(global.editMode){
	editOn();
	show_debug_message("EDITING")
}


// create states and transitions
resetVars()
genAllStates3State()
genAllTransitions3State()


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

global.red_count = instance_create_layer(125, 160, "Instances", ArrowCountObj);
global.red_count.image_index = global.num_red_left;
global.red_count.color = "r";
global.green_count = instance_create_layer(125, 250, "Instances", ArrowCountObj);
global.green_count.image_index = global.num_green_left; 
global.green_count.color = "g";
global.blue_count = instance_create_layer(125, 340, "Instances", ArrowCountObj);
global.blue_count.image_index = global.num_blue_left;
global.blue_count.color = "b";
global.blue_count.visible = false;
global.total_num_left = 0; //r + g + b
global.selected_state_color_rgb = make_colour_rgb(255, 255, 200);
global.is_state_selected = false;
//store state id, x, and y coordinates
global.state_selected = {name: "", id: 0, x: 0, y: 0};
global.is_hovering_state = false;
global.hover_state_id = 0;
global.hovered_transition = 0;
global.duplicate_hovered_transition = false;
global.sequence = [];
global.addedTransition = false;


//Local star count
global.star_count = getStars(room);
//This level was not played before
if(global.star_count = -1)global.star_count = 0;


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

string0 = "g";
string1 = "r";
string2 = "grr";
string3 = "rggrg";

x_pos = 901;
y_pos = 564;

in0 = instance_create_layer(x_pos, y_pos - 72, "Instances",  Input_sequence);
in0.sequence = string0;
in0.acceptingOrNot = false;

in1 = instance_create_layer(x_pos, y_pos, "Instances", Input_sequence);
in1.sequence = string1;

in2 = instance_create_layer(x_pos, y_pos + 64, "Instances",  Input_sequence);
in2.sequence = string2;

in3 = instance_create_layer(x_pos, y_pos + 128, "Instances",  Input_sequence);
in3.sequence = string3;

global.inputs[0] = in0;
global.inputs[1] = in1;
global.inputs[2] = in2;
global.inputs[3] = in3;

in0.alarm[0] = 1;
in1.alarm[0] = 1;
in2.alarm[0] = 1;
in3.alarm[0] = 1;

//letting the user see the previous stars they have gotten
starNum = global.star_count;
if(starNum > 4){
	show_error("Fatal error: the number of stars exceed 4", true);
}
var i = 0;
while(starNum > 0){
	global.inputs[i].star.sprite_index = Star_gold_64x64
	i++;
	starNum--;
}

global.runningDFA = false;
resetDFA();
