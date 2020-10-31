





function s_hasTarget(s1, sym){
	
	//s1_=argument0;
	//sym=argument1;

	var trans = global.dfa.transitions;
	var res = [2];
	res[0]=false;
	res[1]="";
	for (var i=0;i<array_length_1d(trans); i++){
		var t = t_tokenize(trans[i]);
		if(t[0]==s1_ && t[1]==sym){
			res[0]=true;
			res[1]=t[2];
		}
	}
	
	return res;	
}





