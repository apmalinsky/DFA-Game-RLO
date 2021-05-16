


if (visible){

	if (room == Level1){
		global.completedTutorial = true;
	}
	
	ds_queue_clear(global.animatingBuffer);
	global.doingAnimation = false;
	global.timerActive = false;
	bufferAndBallReset();

	window_set_cursor(cr_default);
	room_persistent = false;

	if (room == Level5){
		room_goto(LevelSetMenu);
		global.currentRoomIsLevel = false;
	}
	else {
		room_goto_next();
	}
	
}





