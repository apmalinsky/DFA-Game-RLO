// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_dfa(){

num_states=3;
num_symbols=3;

//global struct var, contains the dfa definition, including the transitions, states, alphabet, start and final state
dfa = {
	transitions: initTrans(),
	states: [num_states],
	alphabet: [num_symbols],
	start: "s1",
	final: "s"+num_states
}

//resets the DFA, maybe for new level
function reset(){
	dfa.transitions = initTrans();
	dfa.states = [num_states];
	dfa.alphabet = [num_symbols];
}

//clears transitions data if clear button
function clearTransitions(){
	dfa.transitions = initTrans();
}

//used to initialize the transition array, 20 is arbitrary, just wanted to be big enough, need
//(num_states choose 2) + num_states max
function initTrans(){
	arr = [20];
	for (var i=0;i<array_length_1d(arr); i++){
		arr[i]="";
	}
	return arr;
}

//returns the state object associated with a state name
function getStateObj(s_name){
		for (var i=0;i<array_length_1d(dfa.states); i++){
			if(dfa.states[i].name==s_name)
				return dfa.states[i];
	}
	return null;
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
	found=false;
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
	curr = dfa.start;
	res=[2];
	res[0]=false;
	res[1]="";
	for (var i=0; i<string_length(string);i++){
		sym = string_char_at(string,i);
		res = hasTarget(curr, sym)
		if(res[0])
			curr=res[1];
		else
			return false;	
	}
	return true;
}




}