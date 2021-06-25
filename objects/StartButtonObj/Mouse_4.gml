

if (!global.inTutorial){
	runDFA();
	
}


if (global.inTutorial){
	
	if (global.currentMask == 6){
		hideTutorialMask()
		runDFA()
		
	}
	else {
		show_debug_message("not allowed")	
	}
	
	
}

