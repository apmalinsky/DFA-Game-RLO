room_persistent = true;
for (var i = 0; i < 5; i++) {
	global.levelSelectorInitializer++;
	var pos = global.levelSelectorCoords[i];
	instance_create_layer(pos[0], pos[1], "Dynamic", LevelSelectorObj);
}