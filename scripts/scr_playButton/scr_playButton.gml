



function animateTransition(tID){
	
	//Add animation to queue
	show_debug_message("Adding animation");
	//Event type: play animation by changing an object sprite.
	ds_queue_enqueue(global.animatingBuffer, "playAnimation");
	//Add time delay(which will apply after this action is done) in mS:
	ds_queue_enqueue(global.animatingBuffer, 0);
	//Add the object's ID
	ds_queue_enqueue(global.animatingBuffer, real(tID));
	//Add the sprite ID to change the object's sprite ID into
	with (real(tID)) {
		ds_queue_enqueue(global.animatingBuffer, getPurpleTransitionAnimation(object_get_name(object_index)));
	}
	//Increment the number of animations in the buffer
	global.animationInQueue++;



    //Moving the ball
	var tType = transitionType(tID);
	ds_queue_enqueue(global.animatingBuffer, "moveBall");
	//Add time delay(which will apply after this action is done) in mS:
	ds_queue_enqueue(global.animatingBuffer, 500000);
	ds_queue_enqueue(global.animatingBuffer, tType);
	
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
	    //show_debug_message("Empty Input Seen");
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
			
			animateTransition(res[2]);
			
			global.inputs[num].sequence_objs[i].image_alpha=0.5;
			
			//add a sprite change to AnimatonQueue, to update goals in the sequence box
			addSpriteChangeToBuffer(0, global.inputs[num].sequence_objs[i], goalSpriteReturner(global.inputs[num].sequence_objs[i], false)); 
			
			/*
			with (global.inputs[num].sequence_objs[i]) {
				//sprite_index = getTransitionAnimation(object_get_name(object_index));
				sprite_index = Completed_red;
			}
			*/

			
			addSoundEffectsToBuffer(input_taken, 500000, 11, false);
			//audio_play_sound(input_taken, 11, false);
			//var tend = get_timer() + 500000; //wait .5 seconds
			//while(get_timer()<tend){}
			
			//show_debug_message("found transitions");
			//animate
			//addAnimation(res[2]);
			//animateTransition(res[2]);   //res[2] contains the transition arrow object id, assumes function is written
		}
		else{
			//add a sprite change to AnimatonQueue, to update goals in the sequence box
			addSpriteChangeToBuffer(0, global.inputs[num].sequence_objs[i], goalSpriteReturner(global.inputs[num].sequence_objs[i], true)); 

			return false;
		}
		
	
	}
	
	if (curr != "s3"){
		global.inputs[num].end_obj.alarm[1] = 1;
		return false;
	
	}
	
	//reached if could always find a target until the end of the string
	global.inputs[num].end_obj.alarm[0] = 1;
	return true;
}


//checks whether all strings for this level are accepted by the DFA, returns boolean, see
//checkString for per string code. Assumes all level strings are stored in global.strings
function checkAllStrings(){
	
	//making the ball visible at the start
	global.pointer.visible = true;
	
	//reset variables related to animationBuffer and star counter
	global.star_count = 0;
	global.animationInQueue = 0;
	bufferAndBallReset();
	
//	global.pointer.visible = true;  // Uncomment this to show the pointer
	
	
	for (var i=0;i<array_length_1d(global.inputs); i++){
		//show_debug_message(global.inputs[i].sequence);
		if(!checkInput(i)){
			if(global.inputs[i].acceptingOrNot){
				addSoundEffectsToBuffer(fail, 200000, 11, false);
				//Trigger buffer to play
				global.timerActive = true;
	            global.animatingBufferTimer = get_timer() - 200000;
				
				return false;
			}
			else{
				global.inputs[i].beaten = true;
				addSoundEffectsToBuffer(Success, 200000, 11, false);
				//var tend = get_timer() + 500000;
				//show_debug_message(global.inputs[i].star);
				global.inputs[i].end_obj.sprite_index = Completed_NA_goal;
				global.inputs[i].star.sprite_index = Star_gold_64x64; //changes the star sprite to indicate success on string, not written
				global.star_count += 1;
				//while(get_timer()<tend){}
				//Failed_goal
				ds_queue_enqueue(global.animatingBuffer, "resetBall", 500000);
			}
		}
		else {
			if(global.inputs[i].acceptingOrNot){
				global.inputs[i].beaten = true;
				addSoundEffectsToBuffer(Success, 200000, 11, false);
				//audio_play_sound(Success, 11, false);
				//var tend = get_timer() + 500000;
				//show_debug_message(global.inputs[i].star);
				global.inputs[i].end_obj.sprite_index = Completed_goal;
				global.inputs[i].star.sprite_index = Star_gold_64x64; //changes the star sprite to indicate success on string, not written
				global.star_count += 1;
				//while(get_timer()<tend){}
				ds_queue_enqueue(global.animatingBuffer, "resetBall", 500000);
			}
			else{
				addSoundEffectsToBuffer(fail, 200000, 11, false);
				//Trigger buffer to play
				global.timerActive = true;
	            global.animatingBufferTimer = get_timer() - 200000;
				
				return false;
			}
		}
	}   
	
	//Trigger buffer to play
	global.timerActive = true;
	global.animatingBufferTimer = get_timer() - 200000;
	
	return true; //this true represents all strings ran successfully in the dfa
}
