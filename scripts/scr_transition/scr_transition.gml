//add the transition to the dfas array
function createTransition(s1, s2, sym, tID){ 
	add(global.dfa.transitions, getLabel(s1,s2,sym,tID));   
}
	
//produces the string representing this transtion, from s1 to s2 via the symbol sym
function getLabel(s1, s2, sym, tID){
	return s1.name+"-"+sym.name+"-"+s2.name + "-"+tID; //convention for identifying transition
}

//"stateA-r-stateB"	
//get name of the source state
function getSource(transition){
	return tokenize(transition)[0];
}
	
//get name of the symbol for the transition
function getSymbol(transition){
return tokenize(transition)[1];
}
	
//get name of the target for the transition
function getTarget(transition){
	return tokenize(transition)[2];
}

//get name object id of transition arrow
function getArrowID(transition){
	return tokenize(transition)[3];
}
	
//splits the name into its tokens: source, symbol, target
function tokenize(transition){
	var s1="";
	var sym="";
	var s2="";
	var tid="";
	var res=[4];
	var count=0;
	for(var i =0; i<string_length(transition); i++){
		if(string_char_at(transition,i)=="-"){
			count++;
		}
		else{
			if(count==0)
				s1=s1+string_char_at(transition,i);
			else if (count==1)
				sym=sym+string_char_at(transition,i);
			else if (count==2)
				s2=s2+string_char_at(transition,i);
			else
				tid=tid+string_char_at(transition,i);
		}
	}
	res[0]=s1;
	res[1]=sym;
	res[2]=s2;
	res[3]=tid;
	return res;
	}	

