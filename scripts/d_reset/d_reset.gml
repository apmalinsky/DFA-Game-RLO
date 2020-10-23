// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function g_reset(){
	dfa.transitions = initTrans();
	dfa.states = [num_states];
	dfa.alphabet = [num_symbols];
}