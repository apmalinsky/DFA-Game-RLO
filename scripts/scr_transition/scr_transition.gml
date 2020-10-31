
function createTransition(s1, s2, sym){ 
	add(dfa.transitions, getLabel(s1,s2,sym));   //add the transition if it doesn't exist, defined script_dfa
}
	
//produces the string representing this transtion, from s1 to s2 via the symbol sym
function getLabel(s1, s2, sym){
	return s1.name+"-"+sym.name+"-"+s2.name; //convention for identifying transition
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
	
//splits the name into its tokens: source, symbol, target
function tokenize(transition){
	var s1="";
	var sym="";
	var s2="";
	var res=[3];
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
			else
				s2=s2+string_char_at(transition,i);
		}
	}
	res[0]=s1;
	res[1]=sym;
	res[2]=s2;
	return res;
	}	

