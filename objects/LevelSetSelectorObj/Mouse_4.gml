/// @description Insert description here
// You can write your code in this editor


if (levelSetNum <= global.numberOfLevelSets) {
	global.currentRoomIsLevel = false;
	global.currentLevel = -1;
	global.prevRoomID = global.currentRoomID;
	global.currentRoomID = asset_get_index("LevelSet" + string(levelSetNum) + "Selection");
	room_goto(global.currentRoomID);
}
	

window_set_cursor(cr_default);