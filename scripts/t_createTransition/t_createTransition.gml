

function t_createTransition(s1, sym, s2){
	//s1_ = argument0;
	//sym=argument1;
	//s2 = argument2;
	d_add(global.dfa.transitions, t_getLabel(s1_,s2,sym));   //add the transition if it doesn't exist, defined script_dfa

	
}


