
// We are closing it, so we are saving what we need,
// and deleting this instance of the room, resetting some var
room_persistent = false;
global.currentRoomIsLevel = false;
save_game();
switch(room){
	case Level1:
	case Level2:
	case Level3:
	case Level4:
	case Level5:
		room_goto(LevelSet1Selection);
		break;
	default:
		room_goto(LevelSetMenu);
}

ds_queue_clear(global.animatingBuffer);
global.doingAnimation = false;
global.timerActive = false;
bufferAndBallReset();  
	
window_set_cursor(cr_default);
