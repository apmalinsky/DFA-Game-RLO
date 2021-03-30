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

