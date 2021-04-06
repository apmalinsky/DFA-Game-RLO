
	
	
	


if (visible){
	global.clickAnywhereCounter = 0
	
	if (mouse_check_button_released(mb_left)){
		
		if (global.clickAnywhereCounter == 2){
			visible = false;	
		}
			
		global.clickAnywhereCounter += 1
	}




}






