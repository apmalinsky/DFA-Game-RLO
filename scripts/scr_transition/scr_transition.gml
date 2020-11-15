
//add the transition to the dfas array
function createTransition(s1, s2, sym, tID){ 
	global.dfa.transitions = add(global.dfa.transitions, createLabel(s1,s2,sym,tID));   
	//show_debug_message(getSource(createLabel(s1,s2,sym,tID)));
	//show_debug_message(getTarget(createLabel(s1,s2,sym,tID)));
	//show_debug_message(getSymbol(createLabel(s1,s2,sym,tID)));
	//show_debug_message(getArrowID(createLabel(s1,s2,sym,tID)));
}


//"stateA-stateB-r-100018"	
//produces the string representing this transtion, from s1 to s2 via the symbol sym
function createLabel(s1, s2, sym, tID){
	return s1 + "-" + s2 + "-" + sym + "-" + tID; //convention for identifying transition
}

//lookup dfa.transitions by tID, return label if contains tID
function getLabelByTransitionID(arr, tID){
	for (var i = 0; i < array_length_1d(arr); i++){
		if(getArrowID(arr[i]) == string(tID)){
			return arr[i];
		}
	}
}

//get name of the source state
function getSource(transitionLabel){
	return tokenize(transitionLabel, 0);
}
	
//get name of the target for the transition
function getTarget(transitionLabel){
	return tokenize(transitionLabel, 1);
}

//get name of the symbol for the transition
function getSymbol(transitionLabel){
	//show_debug_message(tokenize(transitionLabel, 2))
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
			return string_copy(transitionLabel, 0, 2)
		case 1:
			return string_copy(transitionLabel, 4, 2)
		case 2:
			return string_char_at(transitionLabel, 7)
		case 3:
			return string_copy(transitionLabel, 9, string_length(transitionLabel))
	}
}	



function getStateIndicesByTransitionID(tID){
	//"s1-s2-r-100014"
	
	var label = getLabelByTransitionID(global.dfa.transitions, tID);
	return getToObjByTargetName(getStateObjByName(getSource(label)), getTarget(label)).addedIndices;
}


function removeTransition(tID){	
	
	removeTransitionIndex(tID);
	global.dfa.transitions = remove(global.dfa.transitions, tID); 
	
}






