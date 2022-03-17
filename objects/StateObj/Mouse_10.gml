
audio_play_sound(button_hover, 10, false);
var ancestorNodeIndex = ds_list_find_index(global.currentPathNodes, id);
if(global.drawing) {
	if(ancestorNodeIndex == -1){
		var len = ds_list_size(global.currentPathNodes);
		var prevState = ds_list_find_value(global.currentPathNodes, len - 1);
		var TileBackgroundSize = {x: sprite_get_width(tile_background), y: sprite_get_height(tile_background)};
		var pipeCoords = {x: 0, y: 0};
		var cfgN = -1;
		if(prevState.j == j + 2 && prevState.i == i) {
			cfgN = 3;
		} else if(prevState.j == j - 2 && prevState.i == i) {
			cfgN = 0;
		} else if(prevState.j == j - 1) {
			if(j % 2 == 0 && prevState.i == i){
				cfgN = 1;
			} else if(j % 2 == 0 && prevState.i == i - 1) {
				cfgN = 5;
			} if(j % 2 == 1 && prevState.i == i){
				cfgN = 5;
			} else if(j % 2 == 1 && prevState.i == i + 1) {
				cfgN = 1;
			} 
		} else if(prevState.j == j + 1) {
			if(j % 2 == 0 && prevState.i == i){
				cfgN = 2;
			} else if(j % 2 == 0 && prevState.i == i - 1) {
				cfgN = 4;
			} if(j % 2 == 1 && prevState.i == i){
				cfgN = 4;
			} else if(j % 2 == 1 && prevState.i == i + 1) {
				cfgN = 2;
			} 
		}
		if(cfgN != -1){
			var pipeCoords = get_tile_coords(i, j);
			var offsetX = (TileBackgroundSize.x / 2 - global.pipeOffsets[cfgN].x);
			var offsetY = (TileBackgroundSize.y / 2 - global.pipeOffsets[cfgN].y);
			var scale = global.levelTileScaling[global.currentLevel];
			pipeCoords.x += offsetX * scale;
			pipeCoords.y += offsetY * scale;
			var newPipe = instance_create_layer(pipeCoords.x, pipeCoords.y, "States", PipeObj);
			newPipe.image_xscale = global.levelTileScaling[global.currentLevel];
			newPipe.image_yscale = global.levelTileScaling[global.currentLevel];
			newPipe.sprite_index = get_selected_pipe();
			newPipe.image_index = global.pipeImgIndices[cfgN];
			ds_list_insert(global.currentPathNodes, len, id);
			ds_list_insert(global.currentPathTrans, ds_list_size(global.currentPathTrans), newPipe.id);
		}
	} else {
		//mouse went over a ancestor, shorten the path
		while(ancestorNodeIndex + 1 < ds_list_size(global.currentPathNodes)) {
			ds_list_delete(global.currentPathNodes, ancestorNodeIndex + 1);
			instance_destroy(global.currentPathTrans[|(ds_list_size(global.currentPathTrans) - 1)], true);
			ds_list_delete(global.currentPathTrans, ds_list_size(global.currentPathTrans) - 1);
		}
	}
}












