// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//return the correct x, y coordinates for the ijth tile fo rthe current level
function get_tile_coords(i, j){
	var topLeft = global.levelTileTopLeft[global.currentLevel];
	var scale = global.levelTileScaling[global.currentLevel];
	var result = {x: topLeft.x, y: topLeft.y};
	var TileBackgroundSize = {x: sprite_get_width(tile_background), y: sprite_get_height(tile_background)};
	if(j % 2 == 0) {
		//Sprite width * sprite scale to get the real size of the sprite to display
		//1.5 because of our layout in the x axis
		result.x += 1.5*i * TileBackgroundSize.x * scale;
		result.y += (j / 2) * TileBackgroundSize.y * scale;
	} else {
		//Sprite width * sprite scale to get the real size of the sprite to display
		//1.5 because of our layout in the x axis
		//0.75 because the first element of x axis start after 0.75 of the width.
		result.x += (1.5*i + 0.75) * TileBackgroundSize.x * scale;
		//i - 1 because i is a real number not integer
		result.y += ((j - 1) / 2 + 0.5) * TileBackgroundSize.y * scale;
	}
	return result;
}