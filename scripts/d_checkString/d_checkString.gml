// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

s = argument0;
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
