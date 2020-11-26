//checks if a string is in the language defined by the DFA
function checkInput(num){
	
	if(global.inputs[num].sequence==""){
	    show_debug_message("Empty Input Seen");
		return true;
		}
	var curr = global.dfa.start;
	var res=[1];
	res[0]=false;

	for (var i=0; i<string_length(global.inputs[num].sequence);i++){
		var sym = string_char_at(global.inputs[num].sequence,i+1);
		res = hasTarget(curr, sym);
		if(res[0]) {
			//if target found
			curr=res[1];
			show_debug_message(curr)
			global.inputs[num].sequence_objs[i].image_alpha=0.5;
			global.inputs[num].sequence_objs[i].alarm[0] = 1;
			audio_play_sound(input_taken, 11, false);
			var tend = get_timer() + 500000; //wait .5 seconds
			while(get_timer()<tend){}
			
			show_debug_message("found transitions");
			//animate
			//animateTransition(res[2]);   res[2] contains the transition arrow object id, assumes function is written
		}
		else{
			global.inputs[num].sequence_objs[i].alarm[1] = 1;
			var tend = get_timer() + 500000; //wait .5 seconds
			while(get_timer()<tend){}
			return false;
		}
		
	
	}
	
	if (curr != "s3"){
		global.inputs[num].end_obj.alarm[1] = 1;
		global.inputs[num].end_obj.image_alpha=0.5;
		return false;
	
	}
	
	//reached if could always find a target until the end of the string
	return true;
}


//checks whether all strings for this level are accepted by the DFA, returns boolean, see
//checkString for per string code. Assumes all level strings are stored in global.strings
function checkAllStrings(){
	for (var i=0;i<array_length_1d(global.inputs); i++){
		show_debug_message(global.inputs[i].sequence);
		if(!checkInput(i)){
			audio_play_sound(fail, 11, false);
			return false;
			}
		else {
			global.inputs[i].beaten = true;
			audio_play_sound(Success, 11, false);
			var tend = get_timer() + 500000;
			show_debug_message(global.inputs[i].star);
			global.inputs[i].end_obj.sprite_index = Completed_goal;
			global.inputs[i].star.sprite_index = Star_gold_64x64; //changes the star sprite to indicate success on string, not written
			while(get_timer()<tend){}
			
			
		}
	}
	return true; //this true represents all strings ran successfully in the dfa
}
