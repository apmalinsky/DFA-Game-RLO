room_persistent = true;
for (var i = 0; i < 5; i++) {
	global.levelSetSelectorInitializer++;
	var _pos = global.levelSetSelectorCoords[i];
	instance_create_layer(_pos[0], _pos[1], "Dynamic", LevelSetSelectorObj);
}