// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function t_createTransition(s1, s2, sym){ 
		add(dfa.transitions, getLabel(s1,s2,sym));   //add the transition if it doesn't exist, defined script_dfa
	}