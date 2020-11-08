//show_debug_message("state: " + string(id))





window_set_cursor(cr_drag);
audio_play_sound(button_hover, 10, false);


//show_debug_message(global.addedTransition)

//show_debug_message(global.addedTransition)

function getSelectedStateObj(){
	
	switch(global.state_selected.name){
		case "stateA":
			
			return global.states_info.stateA;
			
		case "stateB":
			return global.states_info.stateB;
		
		case "stateC":
			return global.states_info.stateC;
	}
			
}

function getHoveredStateObj(selected_state_obj){
	switch(id){
		case 100018:
			
			return selected_state_obj.toA;
			
		case 100017:
			return selected_state_obj.toB;
		
		case 100019:
			return selected_state_obj.toC;
	}
			
}





function getTransitionId(){
	//return transition id between selected and entered state
	
	//selected state
	var selected_state = getSelectedStateObj()
	//show_debug_message(selected_state)
	return getHoveredStateObj(selected_state);
	//transitions 100015, 100016, 100017, 100018

}









if (global.is_state_selected){
	//draw transparent arrow connecting the selected state to this one
	//global.saved_transition_instance = {}; //save the drawn arrow for the case
    //create smooth curve path, save list of points?
	
	
	//draw transition arrow between
	//global.state_selected --> self.id
	

	
	//show_debug_message(TransitionObj)
	

	//show_debug_message("entered")
	

	//100015
	//100016
	//100017
	//100018
	//get the transition object connecting these states

	
	

	
	
	
	global.hovered_transition = getTransitionId()
	
	//only draw transition if not in dfa already
	if (!contains(global.dfa.transitions, string(global.hovered_transition))){
		with (global.hovered_transition) {
			image_blend = global.selected_transition_color;
			visible = true
			image_alpha = 0.5;
		}
		global.duplicate_hovered_transition = false;
	}
	else {
		global.duplicate_hovered_transition = true;
	}



}






