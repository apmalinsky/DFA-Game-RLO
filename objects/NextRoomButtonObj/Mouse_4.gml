


if (visible){

	if (room == Level1){
		global.completedTutorial = true;
	}
	
	ds_queue_clear(global.animatingBuffer);

	window_set_cursor(cr_default);
	room_persistent = false;
	if (global.current_level == global.current_level_max){
		global.current_level += 1;
		global.current_level_max = global.current_level;
	}
	if (room == Level5){
		room_goto(LevelSet1Selection);
	}
	else {
		room_goto_next();
	}
	
}





