/*
// check if clicked
if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, self)) {
	selected = !selected; //switch state of button
	image_index = selected;
	audio_play_sound(button_click, 10, false);
	

	with (object_index) {
		if (self.id != other.id && selected == true) { // not this button and checked?	
			selected = false; //switch state to false
			image_index = selected;
		}
	}

}
*/

color_selected = "";


// check if clicked
if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, self)) {
	
	if (global.inTutorial && global.currentMask != 0){
		show_debug_message("not allowed")
	}
	else {
		selected = !selected; //switch state of button
		image_index = selected;
		audio_play_sound(button_click, 10, false);
	
		if (selected){
		
			if (global.inTutorial && global.currentMask == 0){
				//show_debug_message("red arrow selected")
				nextTutorialMask();
			}
		
			global.selected_transition_color = global.red
			global.selected_transition_color_symbol = "r";
		}
		else {
			global.selected_transition_color = ""
			global.selected_transition_color_symbol = "";
		}
	
		// check if another box is selected
		if (instance_exists(GreenSelectorObj)) {
			if(GreenSelectorObj.selected){
				color_selected = "green"
			}	
		}
		if (instance_exists(BlueSelectorObj)) {
			if(BlueSelectorObj.selected){
				color_selected = "blue"
			}	
		}
	

		if (color_selected != ""){
			switch(color_selected){
				case "green":
					GreenSelectorObj.selected = false;
					GreenSelectorObj.image_index = GreenSelectorObj.selected;
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
	
	
	
	
	
}
