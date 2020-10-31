
//s_name = argument0;

function d_getStateObj(s_name){
	for (var i=0;i<array_length_1d(global.dfa.states); i++){
		if(global.dfa.states[i].name==s_name)
			return global.dfa.states[i];
	}
	
	return -1;
}




