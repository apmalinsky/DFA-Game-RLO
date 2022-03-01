if(sprite_index != state_normal && global.selectedColors[global.currentLevel] != -1) {
	global.drawing = true;
	ds_list_insert(global.currentPathNodes, 0, {id: id, i: i, j: j});
}