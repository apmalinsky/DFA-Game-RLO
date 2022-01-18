/// @description Insert description here
// You can write your code in this editor
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