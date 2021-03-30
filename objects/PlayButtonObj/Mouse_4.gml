
//show_debug_message("clicked")

window_set_cursor(cr_default);

global.current_level_max = 1;
global.current_level = 0;

audio_play_sound(button_click, 10, false);
sprite_index = Play_click;
global.stillAnimating = true;