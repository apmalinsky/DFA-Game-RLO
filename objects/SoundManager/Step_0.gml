/// @description Insert description here
// You can write your code in this editor
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