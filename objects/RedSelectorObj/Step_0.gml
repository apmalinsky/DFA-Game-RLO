/*
// check if clicked
if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, self)) {
	selected = !selected; //switch state of button
	image_index = selected;
	

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
	selected = !selected; //switch state of button
	image_index = selected;
	
	if (selected){
		global.selected_color = "red"
	}
	else {
		global.selected_color = ""
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
