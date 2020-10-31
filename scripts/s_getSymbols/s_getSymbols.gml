


function s_getSymbols(s1){
	//s1_ = argument0;
	var count=0;
	var res = [array_length_1d(global.dfa.alphabet)];
	for (var i=0;i<array_length_1d(global.dfa.alphabet);i++){
		res[i]="";
	}
	for (var i=0;i<array_length_1d(global.dfa.transitions); i++){
		var t = t_tokenize(global.dfa.transitions[i]);
		if(t[0]==s1_){
			if(!d_contains(res,t[1])){
				res[count]=t[1];
				count++;
			}
		}
	}
	return res;
	
}


