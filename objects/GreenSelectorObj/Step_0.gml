
color_selected = "";


// check if clicked
if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, self)) {
	selected = !selected; //switch state of button
	image_index = selected;
	audio_play_sound(button_click, 10, false);
	
	if (selected){
		global.selected_transition_color = global.green
		global.selected_transition_color_symbol = "g";
		
		//show_debug_message(global.currentMask)
		if (global.inTutorial && global.currentMask == 4){
			//show_debug_message("green arrow selected")
			
			show_debug_message("mask 4 now")
			nextTutorialMask();
		}
		
		
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
	if (instance_exists(BlueSelectorObj)) {
		if(BlueSelectorObj.selected){
			color_selected = "blue"
		}	
	}
	

	if (color_selected != ""){
		switch(color_selected){
			case "red":
				RedSelectorObj.selected = false;
				RedSelectorObj.image_index = RedSelectorObj.selected;
				break;
			case "blue":
				BlueSelectorObj.selected = false;
				BlueSelectorObj.image_index = BlueSelectorObj.selected;
				break;
			default:
				break;
		}
	}
	
}
