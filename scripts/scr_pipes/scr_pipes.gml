// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_selected_pipe(){
	switch(global.selectedColors[global.currentLevel]) {
		case 0:
			return pipe_red_spr;
		case 1:
			return pipe_green_spr;
		case 2:
			return pipe_blue_spr;
	}
}