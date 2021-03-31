


if (visible){
	
	window_set_cursor(cr_default);
	room_persistent = false;
	if (global.current_level == global.current_level_max){
		global.current_level_max = global.current_level + 1;
	}
	if (room == Level5){
		room_goto(MenuLevels);
	}
	else {
		room_goto_next();
	}
	
}





