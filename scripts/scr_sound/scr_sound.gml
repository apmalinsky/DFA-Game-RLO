// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addSoundEffectsToQueue(name, priority, loopOrNot){
	ds_queue_enqueue(global.animatingQueue, "playSound", name, priority, loopOrNot);
}

function playSound(name, priority, loopOrNot){
	audio_play_sound(name, priority, loopOrNot);
	//var tend = get_timer() + 500000; //wait .5 seconds
	//while(get_timer()<tend){}
}

function playAllAvailableSounds(){
	while(!ds_queue_empty(global.animatingQueue)){
		if(ds_queue_head(global.animatingQueue) = "playSound"){
			ds_queue_dequeue(global.animatingQueue);
			var name = ds_queue_dequeue(global.animatingQueue);
			var priority = ds_queue_dequeue(global.animatingQueue);
			var loopOrNot = ds_queue_dequeue(global.animatingQueue);
			playSound(name, priority, loopOrNot);
		}
		else{
			break;
		}
	}
}