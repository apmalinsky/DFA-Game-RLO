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
	var res = [2];
	res[0]=false;
	res[1]="";
	for (var i=0;i<array_length_1d(trans); i++){
		var t = tokenize(trans[i]);
		if(t[0]==s1 && t[1]==sym){
			res[0]=true;
			res[1]=t[2];
		}
	}
	return res;
}

