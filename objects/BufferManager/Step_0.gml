/// @description Insert description here
// You can write your code in this editor

//If an arrow is not in transition and if we are on a level
if(!global.doingAnimation && global.currentRoomIsLevel){
	//is there an ongoing pause/delay and Enough time has elapsed
	if(global.timerActive && global.animatingBufferTimer < get_timer()){
		//if the buffer is not empty, trigger one event and activate the timer
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
				var tType = ds_queue_dequeue(global.animatingBuffer);
				moveBall(timeDelay, tType);
			}
			else if(ds_queue_head(global.animatingBuffer) = "resetBall"){
				ds_queue_dequeue(global.animatingBuffer);
				var timeDelay = ds_queue_dequeue(global.animatingBuffer);
				pointer_soft_reset();
				global.timerActive = true;
	            global.animatingBufferTimer = get_timer() + timeDelay;
			}
			else{
				show_debug_message("animatingBuffer error " + string(ds_queue_size(global.animatingBuffer)));
				show_error("animatingBuffer error", true);
			}
		}
		//Animations ended
		if(global.timerActive && ds_queue_empty(global.animatingBuffer)){
			
			show_debug_message("Animations ended");
			//Tutorial animations ended trigger
			if (global.inTutorial && global.currentMask == 6){
				//show_debug_message("next mask")
				nextTutorialMask();
				showTutorialMask();
			}
			
			//Show next level button mask
			if (global.inTutorial == false && global.completedTutorial == false && global.nextLevelMaskObjectId.visible == 0){
				show_debug_message("show next level mask")
				showNextLevelMask()
			}
			
			
			//pointer hard reset
			pointer_hard_reset();
			global.timerActive = false;
		}
	}
}