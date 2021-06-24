
	
	
	





if (global.clickAnywhereMode && visible){
	//show_debug_message("IS VISIBLE")
	
	if (mouse_check_button_released(mb_left)){	
		show_debug_message("CLICKED ANYWHERE")
		
		
		show_debug_message(global.clickAnywhereCounter)
		global.clickAnywhereCounter += 1
		show_debug_message(global.clickAnywhereCounter)
		
		if (global.clickAnywhereCounter == 2) {
			hideNextLevelMask()
			
			global.clickAnywhereCounter = 0
			global.clickAnywhereMode = false
		}
	}
}









