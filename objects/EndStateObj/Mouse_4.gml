



audio_play_sound(button_click, 10, false);


if (!global.inTutorial){
	doStateLeftClick();
}
	
	
if (global.inTutorial && global.currentMask == 5){
	
	if (global.mask5Part1){
		doStateLeftClick();
	}
	
}
else {
	show_debug_message("not allowed")	
}






