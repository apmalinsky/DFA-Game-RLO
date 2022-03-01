/// @description Go to the designated room
// You can write your code in this editor

if (levelNum <= global.numberOfLevels) {
	global.currentRoomIsLevel = true;
	global.currentLevel = levelNum;
	global.prevRoomID = global.currentRoomID;
	global.currentRoomID = asset_get_index("Level" + string(levelNum));
	room_goto(global.currentRoomID);
}
	

window_set_cursor(cr_default);