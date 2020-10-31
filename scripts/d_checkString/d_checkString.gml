


function d_checkString(s){
	//s = argument0;
	if(s=="")
		return true;
	var curr = global.dfa.start;
	var res=[2];
	res[0]=false;
	res[1]="";
	for (var i=0; i<string_length(s);i++){
		var sym = string_char_at(s,i);
		res = s_hasTarget(curr, sym)
		if(res[0])
			curr=res[1];
		else
			return false;	
	}
	return true;
	
}


