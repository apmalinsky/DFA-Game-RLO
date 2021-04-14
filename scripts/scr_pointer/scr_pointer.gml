// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pointer_move_right(){
	
	global.pointer.x = min(global.pointer.x + 384, global.pointerx + 768);
	
}

function pointer_move_left(){

	global.pointer.x -= 384;

}

function pointer_self_loop(){

}

function pointer_move(){
	if global.right{
		pointer_move_right();
	}
	else{
		pointer_move_left();
	}
}


function pointer_reset(){

global.pointer.x = global.pointerx;
global.pointer.y = global.pointery;
global.pointer.visible = false;
show_debug_message("pointer is reset")
show_debug_message(global.pointer.visible)

}