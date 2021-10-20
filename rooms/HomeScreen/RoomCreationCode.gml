
game_set_speed(30, gamespeed_fps)

room_persistent = true;

global.inLevelSet1 = false;
//global.inLevelSet2 = false;


// global variables for tutorial controller
global.inTutorial = false;
global.clickAnywhereMode = false;
global.clickAnywhereCounter = 0;

global.completedTutorial = false;

//Start the animation buffer
global.animatingBuffer = ds_queue_create();

global.animatingBufferTimer = get_timer();
global.timerActive = false;
global.doingAnimation = false;
global.currentRoomIsLevel = false;

//Set the number of levels here
global.num_levels = 25;

//Load sound so it can be used.
audio_group_load(Music);
audio_group_load(SoundEffects);

global.prevRoom = room;