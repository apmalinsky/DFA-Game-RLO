



sprite_index = Transition_self_3;
if(inAnimation){
	inAnimation = false;
	playAllAvailableSounds();
	if(!ds_queue_empty(global.animatingQueue) and ds_queue_dequeue(global.animatingQueue) = "playAnimation"){
		with(ds_queue_dequeue(global.animatingQueue)){
			sprite_index = ds_queue_dequeue(global.animatingQueue);
			inAnimation = true;
		}
	}
	var tend = get_timer() + 1000000; 
	while(get_timer()<tend){}
	playAllAvailableSounds();
}
