//resets the DFA, maybe for new level
function reset(){
	global.dfa.transitions = initTrans();
	global.dfa.states = [global.num_states];
	global.dfa.alphabet = [global.num_symbols];
}

//clears transitions data if clear button
function clearTransitions(){
	global.dfa.transitions = initTrans();
}

//used to initialize the transition array, 20 is arbitrary, just wanted to be big enough, need
//(num_states choose 2) + num_states max
function initTrans(){
	var arr = [20];
	for (var i=0;i<array_length_1d(arr); i++){
		arr[i]="";
	}
	return arr;
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

// checks if arr contains element, returns boolean
function contains(arr, element){
	for (var i=0;i<array_length_1d(arr); i++){
		if(arr[i]==element)
			return true;
	}
	return false;
}

//removes element from arr if exists, also shifts the array elements 
//returns true if exists, false else
function remove(arr, element){
	var found=false;
	for (var i=0;i<array_length_1d(arr); i++){
		if(arr[i]==element){
			found=true;
			for (var j=i;j<array_length_1d(arr)-1;j++){
				arr[@j]=arr[@j+1];
			}
			arr[@array_length_1d(arr)-1]="";
			break;
		}
	}
	return found;
}

//adds element to arr if it doesn't exist, no duplicates, and returns true on success
function add(arr, element){
	if(!contains(arr,element)){
		for (var i=0;i<array_length_1d(arr); i++){
			if(arr[i]!=""){
				arr[@i]=element;
				return true;
				}
		}
	return false;
}
}


//checks if a string is in the language defined by the DFA
function checkString(string){
	if(string=="")
		return true;
	var curr = global.dfa.start;
	var res=[2];
	res[0]=false;
	res[1]="";
	for (var i=0; i<string_length(string);i++){
		var sym = string_char_at(string,i);
		res = hasTarget(curr, sym)
		if(res[0])
			curr=res[1];
		else
			return false;	
	}
	return true;
}

//checks whether all strings for this level are accepted by the DFA, returns boolean, see
//checkString for per string code. Assumes all level strings are stored in global.strings
function checkAllStrings(){
	for (var i=0;i<array_length_1d(global.strings); i++){
	if(!checkString(global.strings[i])){
		return false;
		}
	}
	return true;
}


