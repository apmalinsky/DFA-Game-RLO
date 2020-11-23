
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
	
	doStateLeftClick();
}








