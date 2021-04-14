


function initializeTutorialMask(){
	
	// initialize tutorial mask
	var mask = instance_create_layer(0, 0, "Instances", TutorialMask);
	mask.x = 0
	mask.y = 0
	mask.image_xscale = 1
	mask.image_yscale = 1
	mask.image_angle = 0
	mask.image_speed = 0
	global.maskObjectId = mask.id;
	global.currentMask = 0;
}


function nextTutorialMask(){
	
	with (global.maskObjectId){
		//// hide mask after last mask finished
		//if (global.currentMask == 7){
		//	show_debug_message("hide mask")
		//	global.clickAnywhereMode = true
		//}
		
		image_index += 1
		
		global.currentMask = image_index
		
		
	//	show_debug_message(global.currentMask)
	
		// hide mask until transition animation end
		if (global.currentMask == 7){
			global.clickAnywhereMode = true
			//visible = false
		
		}
	
		
		
	}
	

	
}


function hideTutorialMask(){
	with (global.maskObjectId){
		
		visible = false
	}
}

function showTutorialMask(){
	with (global.maskObjectId){
		
		visible = true
	}
	
}


//function clickAnywhereMode(){
	// in step
		//if (global.clickAnywhereMode){
	
		//	//show_debug_message("anywhere mode")
	
		//	if (mouse_check_button_released(mb_left)){		
		//		global.clickAnywhereCounter += 1

		//		if (global.clickAnywhereCounter == 2) {
		//			nextTutorialMask()
		//			global.clickAnywhereCounter = 0
		//			global.clickAnywhereMode = false
		//		}
		
		//	}
	
		//}

	
//}




