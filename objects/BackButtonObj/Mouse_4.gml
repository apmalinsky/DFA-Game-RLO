/// @description Insert description here
// You can write your code in this editor
global.currentLevel = -1;
global.currentRoomIsLevel = false;
if(room == LevelSetMenu){
	global.prevRoomID = global.currentRoomID;
	global.currentRoomID = HomeScreen;
	room_goto(HomeScreen);
}
else{
	global.prevRoomID = global.currentRoomID;
	global.currentRoomID = LevelSetMenu;
	room_goto(LevelSetMenu);
}