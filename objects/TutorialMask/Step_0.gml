


if (global.clickAnywhereMode && visible){
	if (mouse_check_button_released(mb_left)){	
		
		if (global.inTutorial == false){
			show_debug_message("PRESSING WRONG MASK")
		}
		
		if (global.currentMask == 7){
			nextTutorialMask()
			global.clickAnywhereCounter = 0
		}
		if (global.currentMask == 8 && global.clickAnywhereCounter == 1){
			global.inTutorial = false
			global.clickAnywhereCounter = 0
			global.clickAnywhereMode = false
		}
		
		global.clickAnywhereCounter += 1

		if (global.clickAnywhereCounter == 2) {
			nextTutorialMask()
			
			global.clickAnywhereCounter = 0
			global.clickAnywhereMode = false
		}
	}
}


if (!global.inTutorial){
	visible = false
}
