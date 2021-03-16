



function animateTransition(tID){
	if(!global.firstAnimationInitialized){
		global.firstAnimationInitialized = true;
		with (real(tID)) {
			sprite_index = getTransitionAnimation(object_get_name(object_index));
			inAnimation = true;
		}
	}else{
		ds_queue_enqueue(global.animatingQueue, "playAnimation");
		ds_queue_enqueue(global.animatingQueue, real(tID));
		with (real(tID)) {
		    ds_queue_enqueue(global.animatingQueue, getTransitionAnimation(object_get_name(object_index)));
		}
	}
	//with (real(tID)) {
		//sprite_index = getTransitionAnimation(object_get_name(object_index));
	//}
	
	return true;
}

/*



function animateTransitions(){
	//show_debug_message(real(tID))
	
	for (var i=0; i<array_length_1d(animationSequence);i++){
		if (animationSequence[i] == 0){
			break;
		}
		else {
			with (animationSequence[i]) {
				sprite_index = getTransitionAnimation(object_get_name(object_index));
			}
		}
	}
}



function addAnimation(tID){
	for (var i=0; i<array_length_1d(animationSequence);i++){
		if (animationSequence[i] == 0){
			animationSequence[i] = real(tID)
		}
	}

}


function resetAnimationSequence(){
	animationSequence = array_create(10, 0);
}

*/



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
			//show_debug_message(curr)
			
			
			global.doingAnimation = true;
			global.animatingTransition = res[2];
			
			//object_set_sprite(global.animatingTransition, getTransitionAnimation(object_get_name(global.animatingTransition)));
			
			while(global.doingAnimation){
				animateTransition(global.animatingTransition);
				global.doingAnimation = false;
			}
			
			
			
			global.inputs[num].sequence_objs[i].image_alpha=0.5;
			
			global.inputs[num].sequence_objs[i].alarm[0] = 1;
			/*
			with (global.inputs[num].sequence_objs[i]) {
				//sprite_index = getTransitionAnimation(object_get_name(object_index));
				sprite_index = Completed_red;
			}
			*/

			
			addSoundEffectsToQueue(input_taken, 11, false);
			//audio_play_sound(input_taken, 11, false);
			//var tend = get_timer() + 500000; //wait .5 seconds
			//while(get_timer()<tend){}
			
			show_debug_message("found transitions");
			//animate
			//addAnimation(res[2]);
			//animateTransition(res[2]);   //res[2] contains the transition arrow object id, assumes function is written
		}
		else{
			global.inputs[num].sequence_objs[i].alarm[1] = 1;
			//var tend = get_timer() + 500000; //wait .5 seconds
			//while(get_timer()<tend){}
			return false;
		}
		
	
	}
	
	if (curr != "s3"){
		global.inputs[num].end_obj.alarm[1] = 1;
		global.inputs[num].end_obj.image_alpha=0.5;
		return false;
	
	}
	
	//reached if could always find a target until the end of the string
	global.inputs[num].end_obj.alarm[0] = 1;
	return true;
}


//checks whether all strings for this level are accepted by the DFA, returns boolean, see
//checkString for per string code. Assumes all level strings are stored in global.strings
function checkAllStrings(){
	if(!ds_queue_empty(global.animatingQueue)){
		show_debug_message("NOT EMPTY");
		while(!ds_queue_empty(global.animatingQueue)){
			show_debug_message(ds_queue_dequeue(global.animatingQueue));
		}
		show_debug_message("NOT EMPTY");
	}
	else{
		show_debug_message("EMPTY");
	}
	global.firstAnimationInitialized = false;
	for (var i=0;i<array_length_1d(global.inputs); i++){
		show_debug_message(global.inputs[i].sequence);
		if(!checkInput(i)){
			if(global.inputs[i].acceptingOrNot){
				addSoundEffectsToQueue(fail, 11, false);
				//audio_play_sound(fail, 11, false);
				return false;
			}
			else{
				global.inputs[i].beaten = true;
				addSoundEffectsToQueue(Success, 11, false);
				//audio_play_sound(Success, 11, false);
				//var tend = get_timer() + 500000;
				show_debug_message(global.inputs[i].star);
				global.inputs[i].end_obj.sprite_index = Completed_NA_goal;
				global.inputs[i].star.sprite_index = Star_gold_64x64; //changes the star sprite to indicate success on string, not written
				global.star_count += 1;
				//while(get_timer()<tend){}
				//Failed_goal
			}
		}
		else {
			if(global.inputs[i].acceptingOrNot){
				global.inputs[i].beaten = true;
				addSoundEffectsToQueue(Success, 11, false);
				//audio_play_sound(Success, 11, false);
				//var tend = get_timer() + 500000;
				show_debug_message(global.inputs[i].star);
				global.inputs[i].end_obj.sprite_index = Completed_goal;
				global.inputs[i].star.sprite_index = Star_gold_64x64; //changes the star sprite to indicate success on string, not written
				global.star_count += 1;
				//while(get_timer()<tend){}
			}
			else{
				addSoundEffectsToQueue(fail, 11, false);
				//audio_play_sound(fail, 11, false);
				return false;
			}
		}
	}
	return true; //this true represents all strings ran successfully in the dfa
}
