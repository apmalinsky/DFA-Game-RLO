//room initialization
game_set_speed(30, gamespeed_fps)
room_persistent = true;

//load previous saves
load_game();

// initialization of constants here:

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
global.numberOfLevels =  1 + 1; // We do this because computer indicing starts at 0
global.numberOfLevelSets = 1;
//To keep track of input_sequence objects in sequence_box
global.sequenceObjs = array_create(global.numberOfLevels, -1);
//These whill be set in the creation code of individual levels
global.arrowCountObjs = array_create(global.numberOfLevels, array_create(3, -1));
global.transitionsLeft = array_create(global.numberOfLevels, array_create(3, 0));
//store state id, its x, and y coordinates relative to the tile system
global.drawing = false;
global.currentPathNodes = ds_list_create();
global.currentPathTrans = ds_list_create();
global.allPaths = ds_list_create();
global.allEdges = ds_list_create();
//This should always be saved because it stores which color was chosen to draw an arrow with it
global.selectedColors = array_create(global.numberOfLevels, -1);
//Decides where and how big/small the tiles should be on the screen
global.levelTileScaling = array_create(global.numberOfLevels, 1);
global.levelTileTopLeft = array_create(global.numberOfLevels, {x: -1, y: -1});
global.levelTileScaling[1] = 0.25;
global.levelTileTopLeft[1] = {x: 270, y: 70};
//States variable
global.tilesNum = {i: 6, j: 9};
global.startState = {i: 0, j: 3};
global.middleState = {i: 2, j: 4};
global.endState = {i: 5, j: 6};
//Pipe offsets and image indices to properly position pipes
global.pipeOffsets = array_create(6, {x: 0, y: 0});
global.pipeOffsets[0] = {x: 151, y: 325};
global.pipeOffsets[1] = {x: 0, y: 240};
global.pipeOffsets[2] = {x: 1, y: 61};
global.pipeOffsets[3] = {x: 150, y: -25};
global.pipeOffsets[4] = {x: 300, y: 60};
global.pipeOffsets[5] = {x: 300, y: 239};
global.pipeImgIndices = array_create(6, -1);
global.pipeImgIndices[0] = 0;
global.pipeImgIndices[1] = 1;
global.pipeImgIndices[2] = 2;
global.pipeImgIndices[3] = 0;
global.pipeImgIndices[4] = 1;
global.pipeImgIndices[5] = 2;

//Correct coordinates of level selector buttons
global.levelSelectorCoords = array_create(5, 0);
global.levelSelectorCoords[0] = [64, 230];
global.levelSelectorCoords[1] = [320, 480]; 
global.levelSelectorCoords[2] = [560, 270]; 
global.levelSelectorCoords[3] = [800, 480]; 
global.levelSelectorCoords[4] = [1024, 230]; 

global.levelSelectorInitializer = 0;

global.levelSetSelectorCoords = array_create(5, 0);
global.levelSetSelectorCoords[0] = [64, 230];
global.levelSetSelectorCoords[1] = [320, 480]; 
global.levelSetSelectorCoords[2] = [560, 270]; 
global.levelSetSelectorCoords[3] = [800, 480]; 
global.levelSetSelectorCoords[4] = [1024, 230]; 

global.levelSetSelectorInitializer = 0;

//Load sound so it can be used.
audio_group_load(Music);
audio_group_load(SoundEffects);

global.colorsRGB = array_create(3, make_color_rgb(0, 0, 0));
global.colorsRGB[0] = make_colour_rgb(250, 94, 90); 
global.colorsRGB[1] = make_colour_rgb(75, 230, 90);
global.colorsRGB[2] = make_colour_rgb(74, 136, 251);