room_persistent = true;
//switch for edit mode, when making new rooms
//global.editMode = true;
global.editMode = false;

global.transitionsLeft = array_create(global.numberOfLevels, array_create(3, 0));
//0 for red, 1 for green, 2 for blue
global.transitionsLeft[global.currentLevel][0] = 2;
global.transitionsLeft[global.currentLevel][1] = 2;

//TODO: (optional) make this automatic using shaders instesd of initializing each color
var redSelector = instance_create_layer(0, 128, "Dynamic", RedSelectorObj);
var greenSelector = instance_create_layer(0, 224, "Dynamic", GreenSelectorObj);
//var blueSelector = instance_create_layer(0, 320, "Dynamic", BlueSelectorObj);

for (var i = 0; i < 3; i++) {
	global.arrowCountObjs[global.currentLevel][i] = instance_create_layer(125, 160 + 90 * i, "Dynamic", ArrowCountObj);
	global.arrowCountObjs[global.currentLevel][i].image_index = global.transitionsLeft[global.currentLevel][i];
	global.arrowCountObjs[global.currentLevel][i].image_xscale = 0.25;
	global.arrowCountObjs[global.currentLevel][i].image_yscale = 0.25;
	//if blue arrows should not exist on this level
	if(global.transitionsLeft[global.currentLevel][i] == 0) {
		global.arrowCountObjs[global.currentLevel][i].visible = false;
	}
	global.arrowCountObjs[global.currentLevel][i].color = i;
}

var _xPos = 901;
var _yPos = 564;

var so1 = instance_create_layer(_xPos, _yPos, "Dynamic", Input_sequence);
so1.sequence = "rg";
so1.acceptingOrNot = true;
so1.alarm[0] = 1;

var so2 = instance_create_layer(_xPos, _yPos + 64, "Dynamic",  Input_sequence);
so2.sequence = "gg";
so2.acceptingOrNot = true;
so2.alarm[0] = 1;

var so3 = instance_create_layer(_xPos, _yPos + 128, "Dynamic",  Input_sequence);
so3.sequence = "rr";
so3.acceptingOrNot = true;
so3.alarm[0] = 1;


var scale = global.levelTileScaling[global.currentLevel];
for(var i = 0; i < global.tilesNum.i; i++) {
	for(var j = 0; j < global.tilesNum.j; j++) {
		var tilePos = get_tile_coords(i, j);
		var tile = instance_create_layer(tilePos.x, tilePos.y, "Dynamic",  TileMainObj); 
		tile.image_xscale = scale;
		tile.image_yscale = scale;
		var state = instance_create_layer(tilePos.x, tilePos.y, "States",  StateObj); 
		state.sprite_index = state_normal;
		state.image_xscale = scale;
		state.image_yscale = scale;
		state.i = i;
		state.j = j;
		if(i == global.startState.i && j == global.startState.j) {
			state.sprite_index = state_start;
		} else if(i == global.endState.i && j == global.endState.j){
			state.sprite_index = state_end;
		} else if(i == global.middleState.i && j == global.middleState.j){
			state.sprite_index = state_middle;
		} else {
			state.sprite_index = state_normal;
		}
	}
}

global.sequenceObjs[global.currentLevel] = [so1, so2, so3];

//store state id, its x, and y coordinates relative to the tile system
global.drawing = false;
global.currentPathNodes = ds_list_create();
global.currentPathTrans = ds_list_create();
global.allPaths = ds_list_create();
global.allEdges = ds_list_create()

//Logic global vars
global.numStates = 3;
global.numSequences = 3;
