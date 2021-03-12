
game_set_speed(30, gamespeed_fps)
audio_play_sound(theme, 10, true);

global.stillAnimating = false;
global.animatingQueue = ds_queue_create();
audio_group_load(Music);
audio_group_load(SoundEffects);