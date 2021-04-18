
//show_debug_message("clicked")

window_set_cursor(cr_default);

global.current_level_max = 1;
global.current_level = 0;

//The total number of levels across all sets
global.num_levels = 5;
global.level_stars = array_create(global.num_levels, 0);
global.level_stars_curr_size = 0;


audio_play_sound(button_click, 10, false);
sprite_index = Play_click;