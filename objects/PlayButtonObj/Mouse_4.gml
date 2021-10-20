
//show_debug_message("clicked")

window_set_cursor(cr_default);

audio_play_sound(theme, 10, true);

load_game();

audio_play_sound(button_click, 10, false);
sprite_index = Play_click;