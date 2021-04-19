/// @description Insert description here
// You can write your code in this editor

//If an arrow is not in transition
if(!global.doingAnimation && global.currentRoomIsLevel){
	//is there an ongoing pause/delay and Enough time has elapsed or is the timer inactive
	if(global.timerActive && global.animatingBufferTimer < get_timer()){
		//if the buffer is not empty
		if(!ds_queue_empty(global.animatingBuffer)){
			if(ds_queue_head(global.animatingBuffer) = "playAnimation"){
				ds_queue_dequeue(global.animatingBuffer);
				var timeDelay = ds_queue_dequeue(global.animatingBuffer);
				var objectID = ds_queue_dequeue(global.animatingBuffer);
				var spriteID = ds_queue_dequeue(global.animatingBuffer);
				changeSprite(timeDelay, objectID, spriteID);
				with(objectID){
					inAnimation = true;
				}
				global.doingAnimation = true;
				global.animationInQueue--;
			}
			else if(ds_queue_head(global.animatingBuffer) = "playSound"){
				ds_queue_dequeue(global.animatingBuffer);
				var name = ds_queue_dequeue(global.animatingBuffer);
				var timeDelay = ds_queue_dequeue(global.animatingBuffer);
				var priority = ds_queue_dequeue(global.animatingBuffer);
				var loopOrNot = ds_queue_dequeue(global.animatingBuffer);
				playSound(name, timeDelay, priority, loopOrNot);
			}
			else if(ds_queue_head(global.animatingBuffer) = "changeSprite"){
				ds_queue_dequeue(global.animatingBuffer);
				var timeDelay = ds_queue_dequeue(global.animatingBuffer);
				var objectID = ds_queue_dequeue(global.animatingBuffer);
				var spriteID = ds_queue_dequeue(global.animatingBuffer);
				changeSprite(timeDelay, objectID, spriteID);
			}
			else if(ds_queue_head(global.animatingBuffer) = "moveBall"){
				ds_queue_dequeue(global.animatingBuffer);
				var timeDelay = ds_queue_dequeue(global.animatingBuffer);
				var isRight = ds_queue_dequeue(global.animatingBuffer);
				moveBall(timeDelay, isRight);
			}
			else if(ds_queue_head(global.animatingBuffer) = "resetBall"){
				ds_queue_dequeue(global.animatingBuffer);
				var timeDelay = ds_queue_dequeue(global.animatingBuffer);
				pointer_soft_reset();
				global.timerActive = true;
	            global.animatingBufferTimer = get_timer() + timeDelay;
			}
			else{
				show_error("animatingBuffer error", true);
			}
		}
		if(global.timerActive && ds_queue_empty(global.animatingBuffer)){
			//Animations ended
			show_debug_message("Animations ended");
			//Tutorial end
			if (global.inTutorial && global.currentMask == 6){
				//show_debug_message("next mask")
				nextTutorialMask();
				showTutorialMask();
			}
			//pointer hard reset
			pointer_hard_reset();
			global.timerActive = false;
		}
	}
}