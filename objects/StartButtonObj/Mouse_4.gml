

//show_debug_message("pressed tri")
audio_play_sound(button_click, 10, false);

reset_all_goals()

global.runningDFA = true;


checkAllStrings();


if (global.star_count >= 2){
	with (NextRoomButtonObj){
		visible = true;
	}
	
}

// if in tutorial
if (global.inTutorial && global.currentMask == 6){
	//show_debug_message("NEXT")
	//nextTutorialMask()
	hideTutorialMask()	
	
	//nextTutorialMask()
	//showMask()
}