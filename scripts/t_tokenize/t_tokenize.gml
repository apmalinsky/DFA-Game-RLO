// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function t_tokenize(transition){
		s1="";
		sym="";
		s2="";
		res=[3];
		count=0;
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
