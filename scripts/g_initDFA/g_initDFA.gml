// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//global struct var, contains the dfa definition, including the transitions, states, alphabet, start and final state
global.dfa.states = [global.num_states];
global.dfa.alphabet = [global.num_symbols];
global.dfa.final = "s"+global.num_states;
