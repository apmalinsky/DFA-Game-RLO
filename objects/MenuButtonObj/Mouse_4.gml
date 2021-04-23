

room_persistent = false;
global.currentRoomIsLevel = false;
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
window_set_cursor(cr_default);
