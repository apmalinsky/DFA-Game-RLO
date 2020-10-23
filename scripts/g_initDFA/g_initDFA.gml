// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function g_initDFA(){
//global struct var, contains the dfa definition, including the transitions, states, alphabet, start and final state
dfa = {
	transitions: initTrans(),
	states: [num_states],
	alphabet: [num_symbols],
	start: "s1",
	final: "s"+num_states
}

}