


function t_tokenize(transition){
	
	//transition = argument0;
	var s1_ ="";
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
				s1_=s1_+string_char_at(transition,i);
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



	
