
// testing commit show_debug_message("Changed");

if (global.selected_color != "") {
	show_debug_message("Changed");
	switch(global.selected_color){
			case "red":
			
				draw_set_color(global.red)
			
			
				if (image_blend == global.selected_color_rgb){
					image_blend = c_white;
				}
				else {
					image_blend = global.selected_color_rgb;
				}
				break;
			case "green":
			
			
				draw_set_color(global.green)
				if (image_blend == global.selected_color_rgb){
					image_blend = c_white;
				}
				else {
					image_blend = global.selected_color_rgb;
				}
				break;
			case "blue":
				draw_set_color(global.blue)
				if (image_blend == global.selected_color_rgb){
					image_blend = c_white;
				}
				else {
					image_blend = global.selected_color_rgb;
				}
				break;
			default:
				break;
		}
		
	

	if (!global.is_state_selected){
		global.is_state_selected = true;
		global.state_selected.id = self.id;
		global.state_selected.x = x;
		global.state_selected.y = y;
		//updateStateSelected(id, self.x, self.y)
		//show_debug_message(global.state_selected);
	}
	else {
		//if select the selected state (de-select it)
		if (global.state_selected.id == self.id){
			global.is_state_selected = false;
			global.state_selected.id = 0;
			global.state_selected.x = 0;
			global.state_selected.y = 0;
			//updateStateSelected(0, 0, 0)
		}
		
		//select other state to make transition
		else {
			//fill in the saved_transition_instance to full color
			
			
		}
	}
	
	
	
}


//
function updateStateSelected(id, x, y){
	global.state_selected.id = id;
	global.state_selected.x = x;
	global.state_selected.y = y;	
}
