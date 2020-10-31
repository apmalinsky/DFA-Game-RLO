

function g_initDFA(){
	//global struct var, contains the dfa definition, including the transitions, states, alphabet, start and final state
	global.dfa.states = [global.num_states];
	global.dfa.alphabet = [global.num_symbols];
	global.dfa.final = "s"+string(global.num_states);
	
}



