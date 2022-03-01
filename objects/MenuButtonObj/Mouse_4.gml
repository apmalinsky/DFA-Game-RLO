
// We are closing it, so we are saving what we need,
// and deleting this instance of the room, resetting some var
var _roomName = room_get_name(room);
room_goto(asset_get_index("LevelSet" + string(global.currentLevel % 5 + 1) + "Selection"));
global.currentRoomIsLevel = false;
global.currentLevel = -1;


ds_queue_clear(global.animatingBuffer);
global.doingAnimation = false;
global.timerActive = false;
	
window_set_cursor(cr_default);
