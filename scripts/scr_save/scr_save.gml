// Script assets have changed for v2.3.0 see
//https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// 1) Save the game to gameSave.save by saving the following:
//	1. levelStars array, which stores how many stars the player has
//	2. levelStarsActualSize, an integer that keeps track of how many 
//   levels the player has attempted.
//  3. TODO: save the transitions.
// 2) When is it used?: Should be used whenever the home and next buttons are pressed
// and if the game is closed.
// 3) param: None
// 4) return: void
//    side effect: creates a file named gameSave.save.
function save_game(){
	var _saveData = array_create(0);
	var _saveStars = {
		starCounts: global.levelStars,
		starCountsSize: global.levelStarsActualSize
	};
	array_push(_saveData, _saveStars);
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "gameSave.save");
	buffer_delete(_buffer);
}


// 1) Attemps to load a save from gameSave.save and if it is empty
//  it initialises a new array to save levels.
// 2) When is it used?: Everytime when the player starts the game 
//  and clicks on the play button on the home screen.
// 3) param: None
// 4) return: void
//    side effect: global.levelStars, and global.levelStarsActualSize
//     are set to their correct values
function load_game(){
	if (file_exists("gameSave.save")) {
		var _buffer = buffer_load("gameSave.save");
		var _string = buffer_read(_buffer, buffer_string);
		var _parsedArray = json_parse(_string);
		//Just a single pop for now. See TODO for save_game
		var _parsedData = array_pop(_parsedArray);
		global.levelStars = _parsedData.starCounts;
		global.levelStarsActualSize = _parsedData.starCountsSize;
	} else {
		//The total number of levels across all sets
		global.levelStars = array_create(global.num_levels, 0);
		global.levelStarsActualSize = 0;
	}
}