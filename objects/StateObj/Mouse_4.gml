

//show_debug_message(global.states_info.stateA)


// testing commit show_debug_message("Changed");
function getStateName(){
	switch(id){
	//each state id, return transition id between selected and entered state
		
	case 100018:
		return "stateA"

	case 100017:
		return "stateB"

	case 100019:
		return "stateC"

	}	
		
}



function updateStateSelected(name, id, x, y){
	global.state_selected.name = name;
	global.state_selected.id = id;
	global.state_selected.x = x;
	global.state_selected.y = y;	
}

audio_play_sound(button_click, 10, false);



if (global.selected_transition_color != "") {
	show_debug_message("Changed");
	
	
	if (!global.is_state_selected){
		global.is_state_selected = true;
		updateStateSelected(getStateName(), self.id, x, self.bbox_top)

		with (global.state_selected.id) {
			image_blend = global.selected__state_color_rgb;
		}
			
		//global.state_selected.id = self.id;
		//global.state_selected.x = x;
		//show_debug_message(self.bbox_top)
		//global.state_selected.y = self.bbox_top;
		//global.state_selected.name = getStateName();
		
		//updateStateSelected(id, self.x, self.y)
		//show_debug_message(global.state_selected);
	}
	else {
		//if select the selected state (de-select it)
		if (global.state_selected.id == self.id){
			global.is_state_selected = false;
			with (global.state_selected.id) {
				image_blend = c_white;
			}
			updateStateSelected(pointer_null, 0, 0, 0)
			//global.state_selected.id = 0;
			//global.state_selected.x = 0;
			//global.state_selected.y = 0;
			//global.state_selected.name = pointer_null;
			//updateStateSelected(0, 0, 0)
		}
		
		//select other state to make transition
		else {
			//fill in the saved_transition_instance to full color
			with (global.hovered_transition) {
				image_alpha = 1.0;
			}
			with (global.state_selected.id) {
				image_blend = c_white;
			}
			
			//update color symbol
			//createTransition(global.state_selected.name, global.selected_transition_color_symbol, getStateName())
			
			global.addedTransition = true;
			
			//add the transition to the DFA
			
			global.is_state_selected = false;
			updateStateSelected(pointer_null, 0, 0, 0)
		}
		

	}
	
	
	
}



