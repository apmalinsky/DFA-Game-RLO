
game_set_speed(30, gamespeed_fps)

room_persistent = true;

global.inLevelSet1 = false;
global.inLevelSet2 = false;


// global variables for tutorial controller
global.inTutorial = false;
global.clickAnywhereMode = false;
global.clickAnywhereCounter = 0;

global.stillAnimating = false;
global.animatingQueue = ds_queue_create();
audio_group_load(Music);
audio_group_load(SoundEffects);

global.prevRoom = room;