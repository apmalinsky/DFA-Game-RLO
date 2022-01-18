


if (visible){
//	if (room == Level1){
//		global.completedTutorial = true;
//	}
	
	ds_queue_clear(global.animatingBuffer);
	global.doingAnimation = false;
	global.timerActive = false;
	bufferAndBallReset();

	window_set_cursor(cr_default);
	
	global.prevRoomID = global.currentRoomID;
	global.currentRoomID = room_next(room);
	
	
	room_goto_next();
	global.currentRoomIsLevel = false;
	
}





