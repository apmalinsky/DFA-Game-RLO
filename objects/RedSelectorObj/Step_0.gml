
// check if clicked
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, self)) {
	selected = !selected; //switch state of button
	image_index = selected;
	audio_play_sound(button_click, 10, false);
	
	if (selected){
		global.selectedColors[global.currentLevel] = color;
	}
	else {
		global.selectedColors[global.currentLevel] = -1;
	}
}

if (global.selectedColors[global.currentLevel] != color) {
	selected = false;
	image_index = 0;
}