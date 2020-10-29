// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
s_name = argument0;

for (var i=0;i<array_length_1d(global.dfa.states); i++){
	if(global.dfa.states[i].name==s_name)
		return global.dfa.states[i];
}
return -1;
