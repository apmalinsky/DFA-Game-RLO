


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
	global.mask5Part1 = false;
	
}


function initializeNextLevelMask(){
	
	// initialize next level mask
	var mask = instance_create_layer(0, 0, "Instances", NextLevelMask);
	mask.x = 0
	mask.y = 0
	mask.image_xscale = 1
	mask.image_yscale = 1
	mask.image_angle = 0
	mask.image_speed = 0
	mask.visible = false;
	global.nextLevelMaskObjectId = mask.id
}



function nextTutorialMask(){
	
	with (global.maskObjectId){		
		image_index += 1
		
		global.currentMask = image_index
		
		
		show_debug_message(global.currentMask)
		
		
		
		if (global.currentMask == 7 || global.currentMask == 8){
			//show_debug_message("RRRRRRRRRRRRRRRRRRRR")
			global.clickAnywhereMode = true
			show_debug_message("click anywhere is on")
			show_debug_message(global.clickAnywhereMode)
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



function hideNextLevelMask(){
	with (global.nextLevelMaskObjectId){
		visible = false
	}
	global.completedTutorial = true;
}

function showNextLevelMask(){
	with (global.nextLevelMaskObjectId){
		visible = true
	}
	global.clickAnywhereMode = true
	show_debug_message("click anywhere is on")
}


