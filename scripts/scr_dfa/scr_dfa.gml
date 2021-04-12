


//reset the DFA, maybe for new level
function resetDFA(){
	global.dfa.transitions = initTrans();
	global.dfa.states = initStates();
	global.dfa.alphabet = initAlphabet();
	
	
	clearTransitions();
	resetStateIndices();
	resetArrowCounts();
}

//set all transitions invisible
function clearTransitions(){
	with (TransitionShortObj1){
		visible = false;
	}
	with (TransitionShortObj2){
		visible = false;
	}
	with (TransitionShortObj3){
		visible = false;
	}
	
	with (TransitionLongObj1){
		visible = false;
	}
	with (TransitionLongObj2){
		visible = false;
	}
	with (TransitionLongObj3){
		visible = false;
	}
	
	with (TransitionSelfObj1){
		visible = false;
	}
	with (TransitionSelfObj2){
		visible = false;
	}
	with (TransitionSelfObj3){
		visible = false;
	}
}

//reset state addedIndices
function resetStateIndices(){
	global.states_info.s1.to1.addedIndices = [-1,-1,-1]
	global.states_info.s1.to2.addedIndices = [-1,-1,-1]
	global.states_info.s1.to3.addedIndices = [-1,-1,-1]
	global.states_info.s2.to1.addedIndices = [-1,-1,-1]
	global.states_info.s2.to2.addedIndices = [-1,-1,-1]
	global.states_info.s2.to3.addedIndices = [-1,-1,-1]
	global.states_info.s3.to1.addedIndices = [-1,-1,-1]
	global.states_info.s3.to2.addedIndices = [-1,-1,-1]
	global.states_info.s3.to3.addedIndices = [-1,-1,-1]
}


function resetArrowCounts(){
	global.num_red_left = 2;
	global.num_green_left = 2;
	global.num_blue_left = 2;
	
	global.red_count.alarm[0] = 1;
	global.green_count.alarm[0] = 1;
	global.blue_count.alarm[0] = 1;
}


//used to initialize the transition array, 20 is arbitrary, just wanted to be big enough, need
//(num_states choose 2) + num_states max
function initTrans(){
	global.total_num_left = global.num_red_left + global.num_green_left + global.num_blue_left;
	return array_create(global.total_num_left, "");
}


//initialize the states array
function initStates(){
	var states = array_create(global.num_states, "");
	
	for (var i = 0; i < global.num_states; i++){
		states[i] = "s" + string(i);
	}
	
	return states;
}


//initialize the alphabet array
function initAlphabet(){
	array_create(global.num_symbols, "")
	
}


//returns the state object associated with a state name
function getStateObj(s_name){
		for (var i=0;i<array_length_1d(global.dfa.states); i++){
			var state = global.dfa.states[i];

			if(state.name==s_name)
				return state;
	}
	return -1;
}

//&& getTarget(arr[i]) == target
//checks if there is a transition with source state and a given symbol,
//should prevent both duplicate transitions and non-determinism, returns true in this case
//this would need to change for a non-deterministic DFA and would need to explicitly handle duplicate case
function contains(arr, source, target, symbol){
	for (var i=0;i<array_length_1d(arr); i++){
		if(getSource(arr[i]) == source && getSymbol(arr[i]) == symbol){
			return true;
		}
	}
	return false;
}



//removes element from arr
function remove(arr, tID){
	for (var i=0;i<array_length_1d(arr); i++){
		if(getArrowID(arr[i]) == tID){
			arr[i] = "";
		}
	}
	return arr;
}


//adds element to arr
function add(arr, element){
	for (var i=0;i<array_length_1d(arr); i++){
		if(arr[i] == ""){
			arr[i] = element;
			return arr;
		}
	}
}