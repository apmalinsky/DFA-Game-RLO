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
