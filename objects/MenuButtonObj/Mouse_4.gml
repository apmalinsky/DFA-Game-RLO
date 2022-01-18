
// We are closing it, so we are saving what we need,
// and deleting this instance of the room, resetting some var
global.currentRoomIsLevel = false;

var _roomName = room_get_name(room);
var _levelNum = real(string_copy(_roomName, 5, string_length(_roomName) - 5));
room_goto(asset_get_index("LevelSet" + string(_levelNum % 5 + 1) + "Selection"));

ds_queue_clear(global.animatingBuffer);
global.doingAnimation = false;
global.timerActive = false;
bufferAndBallReset();  
	
window_set_cursor(cr_default);
