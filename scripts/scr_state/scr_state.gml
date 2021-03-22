
var hoveredStateObj = {}

function getStateName(){
	switch(id){
	//each state id, return transition id between selected and entered state			
		case global.stateIDs[0]:
			return "s1"

		case global.stateIDs[1]:
			return "s2"

		case global.stateIDs[2]:
			return "s3"
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
		//show_debug_message("Changed");
	
		if (!global.is_state_selected){
			if (symToNumLeft(global.selected_transition_color_symbol) > 0){
			global.is_state_selected = true;
			updateStateSelected(getStateName(), self.id, x, self.bbox_top)

			with (global.state_selected.id) {
				image_blend = global.selected_state_color_rgb;
			}}
		}
		else {

			//select other state to make transition
				
				if (!global.duplicate_hovered_transition){

			
					//add transition to dfa
					createTransition(global.state_selected.name, getStateName(), global.selected_transition_color_symbol, string(global.hovered_transition))
					global.addedTransition = true;
			
					//add the transition to the DFA
					global.is_state_selected = false;
					updateStateSelected(pointer_null, 0, 0, 0)
					
					//add the tID to the tostate object's indices
					addTransitionIndex();
				}
			}
		}


	//for drawing self loops right away
	doStateHover();
}


/*
function doStateRightClick(){
	
	if (global.selected_transition_color != "") {
		//show_debug_message("Changed");
	
		if (global.is_state_selected){
			if (global.state_selected.id == self.id){
				if (!global.duplicate_hovered_transition){
					//fill in the saved_transition_instance to full color
					with (global.hovered_transition) {
						image_alpha = 1.0;
						//show_debug_message(object_get_name(object_index))
						sprite_index = getTransitionAnimation(object_get_name(object_index));
					}
					with (global.state_selected.id) {
						image_blend = c_white;
					}
			
					//add transition to dfa
					createTransition(global.state_selected.name, global.state_selected.name, global.selected_transition_color_symbol, string(global.hovered_transition))
					global.addedTransition = true;
			
					//add the transition to the DFA
					global.is_state_selected = false;
					updateStateSelected(pointer_null, 0, 0, 0)
					
					//add the tID to the tostate object's indices
					addTransitionIndex();
				}			
			}
		}
	}
}
*/

//short or long, to find the right animation sprite
function getTransitionAnimation(obj_name){
	switch(obj_name){
		case "TransitionShortObj1":
			return Transition_short_1_animation;
		case "TransitionShortObj2":
			return Transition_short_2_animation;
		case "TransitionShortObj3":
			return Transition_short_3_animation;
			
		case "TransitionLongObj1":
			return Transition_long_1_animation;
		case "TransitionLongObj2":
			return Transition_long_2_animation;
		case "TransitionLongObj3":
			return Transition_long_3_animation;
			
		case "TransitionSelfObj1":
			return Transition_self_1_animation;
		case "TransitionSelfObj2":
			return Transition_self_2_animation;
		case "TransitionSelfObj3":
			return Transition_self_3_animation;
	}
}




function getSelectedStateObj(){
	switch(global.state_selected.name){
		case "s1":
			return global.states_info.s1;
			
		case "s2":
			return global.states_info.s2;
		
		case "s3":
			return global.states_info.s3;
	}
}


function getStateObjByName(name){
	switch(name){
		case "s1":
			return global.states_info.s1;
		
		case "s2":
			return global.states_info.s2;
		
		case "s3":
			return global.states_info.s3;
	}
}


function getHoveredStateObj(selected_state_obj){
	switch(id){
		case global.stateIDs[0]:
			return selected_state_obj.to1;
			
		case global.stateIDs[1]:
			return selected_state_obj.to2;
		
		case global.stateIDs[2]:
			return selected_state_obj.to3;
	}
}


function getToObjByTargetName(sourceObj, targetName){
	switch(targetName){
		case "s1":
			return sourceObj.to1;
			
		case "s2":
			return sourceObj.to2;
		
		case "s3":
			return sourceObj.to3;
	}
}


function getNextAvailableIndex(indices){
	for (i = 0; i < array_length_1d(indices); i += 1){
		if (indices[i] == -1){
			return i;
		}
	}
}

//return next available transition id between selected and entered state
function getTransitionId(){
	hoveredStateObj = getHoveredStateObj(getSelectedStateObj());
	//setHoveredStateObj()
	show_debug_message(hoveredStateObj) // this somehow fixes the order error
	var addedIndices = hoveredStateObj.addedIndices;

	return hoveredStateObj.transitions[getNextAvailableIndex(addedIndices)];
}





function addTransitionIndex(){
	var nextAvailableIndex = getNextAvailableIndex(hoveredStateObj.addedIndices);
	hoveredStateObj.addedIndices[nextAvailableIndex] = hoveredStateObj.transitions[nextAvailableIndex];
}

function removeTransitionIndex(tID){
	var addedIndices = getStateIndicesByTransitionID(tID);

	for (i = 0; i < array_length_1d(addedIndices); i += 1){
		if (addedIndices[i] == tID){
			addedIndices[i] = -1;
		}
	}
}


function transitionsAvailable(){
	var hoveredStateObj = getHoveredStateObj(getSelectedStateObj());
	var addedIndices = hoveredStateObj.addedIndices;
	var availableCount = 3;

	for (i = 0; i < array_length_1d(addedIndices); i += 1){
		if (addedIndices[i] != -1){
			availableCount -= 1;
		}
	}
	
	if (availableCount == 0){
		return false;
	}
	else {
		return true;
	}
}




function doStateHover(){
	global.is_hovering_state = true;

	if (global.is_state_selected){
		
		// do only if there are still transitions available to draw
		if (transitionsAvailable()){
			global.hovered_transition = getTransitionId();
			//show_debug_message("show transition: " + string(global.hovered_transition))
	
			//only draw transition if not in dfa already
			if (!contains(global.dfa.transitions, global.state_selected.name, getStateName(), global.selected_transition_color_symbol)){
				show_debug_message("not duplicate")
				with (global.hovered_transition) {
					if (symToNumLeft(global.selected_transition_color_symbol) > 0){
					image_blend = global.selected_transition_color;
					visible = true
					image_alpha = 0.5;}
				}
				global.duplicate_hovered_transition = false;
			}
			else {
				show_debug_message("duplicate")
				global.duplicate_hovered_transition = true;
			}
		}
		else {
			show_debug_message("NO TRANSTIONS AVAILABLE")
			global.duplicate_hovered_transition = true;
		}
	}
}

function symToNumLeft(sym){

	if(sym = "r") return global.num_red_left 
	if(sym = "g") return global.num_green_left 
	if(sym = "b") return global.num_blue_left 



}




function doStateLeave(){
	global.is_hovering_state = false;
	
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
	show_debug_message("WWWWWWWW")
	//show_debug_message(trans);


	var res = [3];
	res[0]=false;
	res[1]="";
	res[2]=0;
	for (var i=0;i<array_length_1d(trans); i++){
		var st = tokenize(trans[i],0);
		var symb = tokenize(trans[i],2);
		//show_debug_message(s1);
		//show_debug_message(st);
		//show_debug_message(sym);
	    //show_debug_message(symb);
		//show_debug_message("next")
		//if a match, store true and the target state symbol
		if(st==s1 && symb==sym){
			res[0]=true;
			res[1]=tokenize(trans[i],1);
			res[2]=tokenize(trans[i],3);
			//show_debug_message(res[2]);
		}
	}
	return res;
}

