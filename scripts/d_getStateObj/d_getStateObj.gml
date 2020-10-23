// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function d_getStateObj(s_name){
		for (var i=0;i<array_length_1d(dfa.states); i++){
			if(dfa.states[i].name==s_name)
				return dfa.states[i];
	}
	return null;
}