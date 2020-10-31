


function d_reset(){
	global.dfa.transitions = t_initTrans();
	global.dfa.states = [global.num_states];
	global.dfa.alphabet = [global.num_symbols];
}


