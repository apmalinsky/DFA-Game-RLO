
audio_play_sound(button_click, 10, false);

var startButtonPressed = false;


with (StartButtonObj)
{
     if (position_meeting(mouse_x, mouse_y, id))
     {
         //show_debug_message("start button pressed");
		 startButtonPressed = true;
     }
}



if (!startButtonPressed){
	//show_debug_message("start button not pressed")
	
	if (!global.inTutorial){
		doStateLeftClick();
	}
	
	
	if (global.inTutorial){
		
		
		if (global.currentMask == 1 && getStateName() == "s1"){
			doStateLeftClick();
				
		}
		if (global.currentMask == 2 && getStateName() == "s2"){
			doStateLeftClick();
		}
		if (global.currentMask == 5 && getStateName() == "s2"){
			doStateLeftClick();
			global.mask5Part1 = true;
		}
		else {
			show_debug_message("not allowed")
		}
		
		
		
		
	}
	
	
}








