game_set_speed(30, gamespeed_fps)

global.selected_color = background_color;

global.sequence = [];

gml_pragma("global", "g_runFirst()");
g_initLevel("Note1");
g_initDFA();
