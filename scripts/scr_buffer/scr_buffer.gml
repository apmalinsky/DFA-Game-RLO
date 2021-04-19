// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//function animationEnded(objectID){
//	if(inAnimation && global.animationInQueue = 0){
//		playSoundsChangeSprites();
//	}
//	with(objectID){
//		if(inAnimation){
//			inAnimation = false;
//			if(!ds_queue_empty(global.animatingBuffer)){
//				if(ds_queue_head(global.animatingBuffer) != "playAnimation"){
//					playSoundsChangeSprites();
//				}
//				global.animationInQueue--;
//				ds_queue_dequeue(global.animatingBuffer);
//				with(ds_queue_dequeue(global.animatingBuffer)){
//					sprite_index = ds_queue_dequeue(global.animatingBuffer);
//					inAnimation = true;
//				}
//				var tend = get_timer() + 750000; 
//			    while(get_timer()<tend){}
//			}
//			else{
//				//All animations ended
//				show_debug_message("Animations ended");
//				global.timerActive = true;
//				global.timer = get_timer() + 1000000;
//				if (global.inTutorial && global.currentMask == 6){
//					//show_debug_message("next mask")
//					nextTutorialMask();
//					showTutorialMask();
//				}
//			}
//		}
//	}
	
//}


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


function moveBall(timeDelay, isRight){
	if(isRight)pointer_move_right();
	else pointer_move_left();
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

