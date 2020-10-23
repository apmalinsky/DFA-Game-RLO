// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function d_checkString(string){
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