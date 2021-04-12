// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function animationEnded(objectID){
	with(objectID){
		if(inAnimation){
			inAnimation = false;
			playSoundsChangeSprites();
			if(!ds_queue_empty(global.animatingQueue)){
				if(ds_queue_head(global.animatingQueue) = "playAnimation"){
					global.animationInQueue--;
					ds_queue_dequeue(global.animatingQueue);
					with(ds_queue_dequeue(global.animatingQueue)){
						sprite_index = ds_queue_dequeue(global.animatingQueue);
						inAnimation = true;
					}
				}
			}
			if(global.animationInQueue = 0){
				playSoundsChangeSprites();
				show_debug_message("animation ended")
			}
			
			var tend = get_timer() + 1000000; 
			while(get_timer()<tend){}
		}
	}
	
}

function addSpriteChange(objectID, spriteID){
	ds_queue_enqueue(global.animatingQueue, "changeSprite", objectID, spriteID);
}


global.tempCounter = 0

function playSoundsChangeSprites(){
	while(!ds_queue_empty(global.animatingQueue)){
		if(ds_queue_head(global.animatingQueue) = "playSound"){
			ds_queue_dequeue(global.animatingQueue);
			var name = ds_queue_dequeue(global.animatingQueue);
			var priority = ds_queue_dequeue(global.animatingQueue);
			var loopOrNot = ds_queue_dequeue(global.animatingQueue);
			playSound(name, priority, loopOrNot);
		}
		else if(ds_queue_head(global.animatingQueue) = "changeSprite"){
			ds_queue_dequeue(global.animatingQueue);
			with(ds_queue_dequeue(global.animatingQueue)){
				sprite_index = ds_queue_dequeue(global.animatingQueue);
			}
		}
		else{
			break;
		}
	}
	
	global.tempCounter += 1
	if (global.inTutorial && global.currentMask == 6 && global.tempCounter == 2){
		//show_debug_message("next mask")
		nextTutorialMask()
		showTutorialMask()
	}
	
	
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