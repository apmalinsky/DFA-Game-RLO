
//add the transition to the dfas array
function createTransition(s1, s2, sym, tID){ 
	global.dfa.transitions = add(global.dfa.transitions, getLabel(s1,s2,sym,tID));   
	//show_debug_message(global.dfa.transitions)
	//show_debug_message(getSource(getLabel(s1,s2,sym,tID)));
	//show_debug_message(getSymbol(getLabel(s1,s2,sym,tID)));
	//show_debug_message(getTarget(getLabel(s1,s2,sym,tID)));
	//show_debug_message(getArrowID(getLabel(s1,s2,sym,tID)));
}



//produces the string representing this transtion, from s1 to s2 via the symbol sym
function getLabel(s1, s2, sym, tID){
	return s1 + "-" + sym + "-" + s2 + "-" + tID; //convention for identifying transition
}

//"stateA-r-stateB-100018"	
//get name of the source state
function getSource(transitionLabel){
	return tokenize(transitionLabel, 0);
}
	
//get name of the symbol for the transition
function getSymbol(transitionLabel){
return tokenize(transitionLabel, 1);
}
	
//get name of the target for the transition
function getTarget(transitionLabel){
	return tokenize(transitionLabel, 2);
}

//get name object id of transition arrow
function getArrowID(transitionLabel){
	return tokenize(transitionLabel, 3);
}
	
//splits the name into its tokens: source, symbol, target, arrowID
function tokenize(transitionLabel, index){
	switch(index){
		case 0:
			return string_copy(transitionLabel, 0, 6)
		case 1:
			return string_copy(transitionLabel, 8, 6)
		case 2:
			return string_char_at(transitionLabel, 15)
		case 3:
			return string_copy(transitionLabel, 17, string_length(transitionLabel))
	}
}	


