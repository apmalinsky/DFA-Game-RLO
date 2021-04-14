



if (visible){
	
	if (!global.inTutorial){
		removeTransition(string(id))
		//show_debug_message("transition: " + string(id))
		window_set_cursor(cr_default);
		audio_play_sound(pop, 12, false);

		visible = false;
		
	}
	else {
		show_debug_message("not allowed");
	}

}




