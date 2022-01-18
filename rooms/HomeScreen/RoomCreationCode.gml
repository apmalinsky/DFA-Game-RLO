//room initialization
game_set_speed(30, gamespeed_fps)
room_persistent = true;

//load previous saves
load_game();

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

//Keeping track of the current room
global.currentLevel = -1;
global.currentRoomID = room;
global.prevRoomID = room;
global.currentRoomIsLevel = false;

//Set the number of levels here
global.numberOfLevels = 1;
global.numberOfLevelSets = 1;
global.levelTileScaling = array_create(global.numberOfLevels, 1);
global.levelTileTopLeft = array_create(global.numberOfLevels, array_create(2, 0));

//Correct coordinates of level selector buttons
global.levelSelectorCoords = array_create(5, 0);
global.levelSelectorCoords[0] = [64, 230];
global.levelSelectorCoords[1] = [320, 480]; 
global.levelSelectorCoords[2] = [560, 270]; 
global.levelSelectorCoords[3] = [800, 480]; 
global.levelSelectorCoords[4] = [1024, 230]; 

global.levelSelectorInitializer = 1;

global.levelSetSelectorCoords = array_create(5, 0);
global.levelSetSelectorCoords[0] = [64, 230];
global.levelSetSelectorCoords[1] = [320, 480]; 
global.levelSetSelectorCoords[2] = [560, 270]; 
global.levelSetSelectorCoords[3] = [800, 480]; 
global.levelSetSelectorCoords[4] = [1024, 230]; 

global.levelSetSelectorInitializer = 1;

//Load sound so it can be used.
audio_group_load(Music);
audio_group_load(SoundEffects);

global.red = make_colour_rgb(250, 94, 90); 
global.green = make_colour_rgb(75, 230, 90);
global.blue = make_colour_rgb(74, 136, 251);