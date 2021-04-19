// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pointer_move_right(){
	
	global.pointer.x += 384;
	
}

function pointer_move_left(){

	global.pointer.x -= 384;

}

function pointer_soft_reset(){

global.pointer.x = global.pointerx;
global.pointer.y = global.pointery;

}
function pointer_hard_reset(){

global.pointer.x = global.pointerx;
global.pointer.y = global.pointery;
global.pointer.visible = false;

}