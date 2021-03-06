
color_selected = "";


// check if clicked
if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, self)) {
	selected = !selected; //switch state of button
	image_index = selected;
	audio_play_sound(button_click, 10, false);
	
	if (selected){
		global.selected_transition_color = global.blue;
		global.selected_transition_color_symbol = "b";
	}
	else {
		global.selected_transition_color = ""
		global.selected_transition_color_symbol = "";
	}

	// check if another box is selected
	if (instance_exists(RedSelectorObj)) {
		if(RedSelectorObj.selected){
			color_selected = "red"
		}	
	}
	if (instance_exists(GreenSelectorObj)) {
		if(GreenSelectorObj.selected){
			color_selected = "green"
		}	
	}
	

	if (color_selected != ""){
		switch(color_selected){
			case "red":
				RedSelectorObj.selected = false;
				RedSelectorObj.image_index = RedSelectorObj.selected;
				break;
			case "green":
				GreenSelectorObj.selected = false;
				GreenSelectorObj.image_index = GreenSelectorObj.selected;
				break;
			default:
				break;
		}
	}
	
}
