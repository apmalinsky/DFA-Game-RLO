
if (global.editMode){
	show_debug_message("State: " + string(id))
}




window_set_cursor(cr_handpoint);
audio_play_sound(button_hover, 10, false);


sprite_index = State_i_current;
global.hover_state_id = id


doStateHover();












