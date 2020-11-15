//reset the DFA, maybe for new level
function resetDFA(){
	global.dfa.transitions = initTrans();
	global.dfa.states = initStates();
	global.dfa.alphabet = initAlphabet();
}

//set all transitions invisible
function clearTransitions(){
	with (TransitionShortObj){
		visible = false;
	}
	
	with (TransitionLongObj){
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


//checks if same colored transition in dfa transitions
function contains(arr, source, target, symbol){
	for (var i=0;i<array_length_1d(arr); i++){
		if(getSource(arr[i]) == source && getTarget(arr[i]) == target && getSymbol(arr[i]) == symbol){
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
		if(arr[i] = ""){
			arr[i] = element;
			return arr;
		}
	}
}



//checks if a string is in the language defined by the DFA
function checkString(string){
	if(string=="")
		return true;
	var curr = global.dfa.start;
	var res=[1];
	res[0]=false;

	for (var i=0; i<string_length(string);i++){
		var sym = string_char_at(string,i);
		res = hasTarget(curr, sym);
		if(res[0]) {
			//if target found
			curr=res[1];
			//animate
			//animateTransition(res[2]);   res[2] contains the transition arrow object id, assumes function is written
		}
		else
			return false;	
	}
	
	//reached if could always find a target until the end of the string
	return true;
}


//checks whether all strings for this level are accepted by the DFA, returns boolean, see
//checkString for per string code. Assumes all level strings are stored in global.strings
function checkAllStrings(){
	for (var i=0;i<array_length_1d(global.strings); i++){
		if(!checkString(global.strings[i])){
			return false;
			}
		//else
			//changeStar(i)    changes the star sprite to indicate success on string, not written
	}
	return true; //this true represents all strings ran successfully in the dfa
}



