



function getStateName(){
	switch(id){
	//each state id, return transition id between selected and entered state
		
	case 100020:
		return "stateA"

	case 100021:
		return "stateB"

	case 100022:
		return "stateC"

	}	
		
}



function updateStateSelected(name, id, x, y){
	global.state_selected.name = name;
	global.state_selected.id = id;
	global.state_selected.x = x;
	global.state_selected.y = y;	
}




function doStateLeftClick(){
	
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

			
			
				if (!global.duplicate_hovered_transition){
					//fill in the saved_transition_instance to full color
					with (global.hovered_transition) {
						image_alpha = 1.0;
					}
					with (global.state_selected.id) {
						image_blend = c_white;
					}
			
					//update color symbol
					//add transition to dfa
					createTransition(global.state_selected.name, global.selected_transition_color_symbol, getStateName(), string(global.hovered_transition))
			
					//show_debug_message(global.dfa.transitions)
			
			
					global.addedTransition = true;
			
					//add the transition to the DFA
			
					global.is_state_selected = false;
					updateStateSelected(pointer_null, 0, 0, 0)
				
				}
			
			

			}
		

		}
	
	
	
	}
	
	
}






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
		case 100020:
			
			return selected_state_obj.toA;
			
		case 100021:
			return selected_state_obj.toB;
		
		case 100022:
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






function doStateHover(){
	

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

	
}




function doStateLeave(){
	
	
	if (!global.addedTransition){

	if (global.hovered_transition != 0 && !global.duplicate_hovered_transition){

		with (global.hovered_transition) {
			visible = false
		}	
	}
	
	
}

	global.addedTransition = false;
	global.hovered_transition = 0;

	global.duplicate_hovered_transition = false;

	show_debug_message(global.dfa.transitions)
	
	
}






//gets unique symbols used in transitions for a given state s1
function getSymbols(s1){
	var count=0;

	var res = [array_length_1d(global.dfa.alphabet)];
	for (var i=0;i<array_length_1d(global.dfa.alphabet);i++){
		res[i]="";
	}
	for (var i=0;i<array_length_1d(global.dfa.transitions); i++){
		var t = tokenize(global.dfa.transitions[i]);

		if(t[0]==s1){
			if(!contains(res,t[1])){
				res[count]=t[1];
				count++;
			}
		}
	}
	return res;
}

//checks if a transition exists from s1 via sym, does it have a target, good for seeing if in language
//returns true or false and the target state name or empty string
function hasTarget(s1, sym){

	var trans = global.dfa.transitions;

	var res = [3];
	res[0]=false;
	res[1]="";
	res[2]=0;
	for (var i=0;i<array_length_1d(trans); i++){
		var st = tokenize(trans[i],0);
		var symb = tokenize(trans[i],1);
		//if a match, store true and the target state symbol
		if(st==s1 && symb==sym){
			res[0]=true;
			res[1]=tokenize(trans[i],2);
			res[2]=tokenize(trans[i],3);
		}
	}
	return res;
}

