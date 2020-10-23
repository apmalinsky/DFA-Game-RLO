// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_has_Target(s1, sym){
	var trans = dfa.transitions;
	res = [2];
	res[0]=false;
	res[1]="";
	for (var i=0;i<array_length_1d(trans); i++){
		t = tokenize(trans[i]);
		if(t[0]==s1 && t[1]==sym){
			res[0]=true;
			res[1]=t[2];
		}
	}
	return res;
}