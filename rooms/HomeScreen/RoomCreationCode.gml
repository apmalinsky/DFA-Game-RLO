
game_set_speed(30, gamespeed_fps)

room_persistent = true;

global.inLevelSet1 = false;
//global.inLevelSet2 = false;


// global variables for tutorial controller
global.inTutorial = false;
global.clickAnywhereMode = false;
global.clickAnywhereCounter = 0;

global.completedTutorial = false;


global.animatingBuffer = ds_queue_create();

global.animatingBufferTimer = get_timer();
global.timerActive = false;
global.doingAnimation = false;
global.currentRoomIsLevel = false;

audio_group_load(Music);
audio_group_load(SoundEffects);

global.prevRoom = room;