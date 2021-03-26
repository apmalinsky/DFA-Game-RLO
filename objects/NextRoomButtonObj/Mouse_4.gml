


if (visible){
	
	window_set_cursor(cr_default);
	room_persistent = false;
	if (room == Level5){
		room_goto(MenuLevels);
	}
	else {
		room_goto_next();
	}
	
}





