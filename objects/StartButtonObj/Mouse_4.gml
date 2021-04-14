

if (!global.inTutorial){
	runDFA();
	
}


modifyStars(room, global.star_count);

if (global.inTutorial){
	
	if (global.currentMask == 6){
		hideTutorialMask()
		runDFA()
		
	}
	else {
		show_debug_message("not allowed")	
	}
	
	
}

