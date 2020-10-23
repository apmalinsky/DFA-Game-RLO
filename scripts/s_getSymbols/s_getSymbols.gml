// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_get_Symbols(s1){
	var count=0;
	res = [array_length_1d(dfa.alphabet)];
	for (var i=0;i<array_length_1d(dfa.alphabet);i++){
		res[i]="";
	}
	for (var i=0;i<array_length_1d(dfa.transitions); i++){
		t = tokenize(trans[i]);
		if(t[0]==s1){
			if(!contains(res,t[1])){
				res[count]=t[1];
				count++;
			}
		}
	}
	return res;
}