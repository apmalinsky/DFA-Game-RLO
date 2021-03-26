


if (global.clickAnywhereMode){
	
	//show_debug_message("anywhere mode")
	
	if (mouse_check_button_released(mb_left)){		
		global.clickAnywhereCounter += 1

		if (global.clickAnywhereCounter == 2) {
			
			if (global.currentMask == 7){
				global.inTutorial = false
			}
			else {
				nextTutorialMask()
			}
			
			global.clickAnywhereCounter = 0
			global.clickAnywhereMode = false
		}
		
	}
	
}


if (!global.inTutorial){
	visible = false
}
