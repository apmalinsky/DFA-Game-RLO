// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function addSpriteChangeToBuffer(timeDelay, objectID, spriteID){
	ds_queue_enqueue(global.animatingBuffer, "changeSprite", timeDelay, objectID, spriteID);
}


function addSoundEffectsToBuffer(name, timeDelay, priority, loopOrNot){
	ds_queue_enqueue(global.animatingBuffer, "playSound", name, timeDelay, priority, loopOrNot);
}


function playSound(name, timeDelay, priority, loopOrNot){
	audio_play_sound(name, priority, loopOrNot);
	global.timerActive = true;
	global.animatingBufferTimer = get_timer() + timeDelay;
}


function changeSprite(timeDelay, objectID, spriteID){
	with(objectID){
		sprite_index = spriteID;
	}
	global.timerActive = true;
	global.animatingBufferTimer = get_timer() + timeDelay;
}


function moveBall(timeDelay, tType){
	if(tType = 1){
		//true if we are moving the ball to the right
		show_debug_message("Ball move right");
		pointer_move_right();
	}
	else if(tType = -1){
		//false if we are moving the ball to the left
		show_debug_message("Ball move left");
		pointer_move_left();
	}
	else if(tType = -2){
		//false if we are moving the ball to the left
		show_debug_message("Ball move double left");
		pointer_move_left();
		pointer_move_left();
	}
	else if(tType = 2){
		//false if we are moving the ball to the left
		show_debug_message("Ball move double right");
		pointer_move_right();
		pointer_move_right();
	}
	else if(tType = 0){
		show_debug_message("Ball self loop");
	}
	else{
		show_error("Transition type error", true);
	}
	global.timerActive = true;
	global.animatingBufferTimer = get_timer() + timeDelay;
}

function goalSpriteReturner(objectID, failedOrNot){
	switch(objectID.object_index){
	    case blue_goal:
		    if(failedOrNot)return Failed_blue;
			else return Completed_blue;
		case red_goal:
			if(failedOrNot)return Failed_red;
			else return Completed_red;
		case green_goal:
		    if(failedOrNot)return Failed_green;
			else return Completed_green;
	}
}

function bufferAndBallReset(){
	ds_queue_clear(global.animatingBuffer);
	global.timerActive = false;
	pointer_soft_reset();
}

//short or long, to find the right animation sprite
function getTransitionAnimation(obj_name){
	switch(obj_name){
		case "TransitionShortObj1":
			return Transition_short_1_animation;
		case "TransitionShortObj2":
			return Transition_short_2_animation;
		case "TransitionShortObj3":
			return Transition_short_3_animation;
			
		case "TransitionLongObj1":
			return Transition_long_1_animation;
		case "TransitionLongObj2":
			return Transition_long_2_animation;
		case "TransitionLongObj3":
			return Transition_long_3_animation;
			
		case "TransitionSelfObj1":
			return Transition_self_1_animation;
		case "TransitionSelfObj2":
			return Transition_self_2_animation;
		case "TransitionSelfObj3":
			return Transition_self_3_animation;
	}
}

//return the correct "purple"(not actually purple but uses shader) transition animation for playButton
function getPurpleTransitionAnimation(obj_name){
	switch(obj_name){
		case "TransitionShortObj1":
			return Transition_short_1_purple;
		case "TransitionShortObj2":
			return Transition_short_2_purple;
		case "TransitionShortObj3":
			return Transition_short_3_purple;
			
		case "TransitionLongObj1":
			return Transition_long_1_purple;
		case "TransitionLongObj2":
			return Transition_long_2_purple;
		case "TransitionLongObj3":
			return Transition_long_3_purple;
			
		case "TransitionSelfObj1":
			return Transition_self_1_purple;
		case "TransitionSelfObj2":
			return Transition_self_2_purple;
		case "TransitionSelfObj3":
			return Transition_self_3_purple;
	}
}