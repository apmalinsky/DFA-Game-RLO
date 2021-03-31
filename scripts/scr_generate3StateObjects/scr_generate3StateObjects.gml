


// script for generating state and transition objects for 3-State level designs


function resetVars(){
	// initialize global variables
	global.stateIDs = [0,0,0] //A, B, C

	global.states_info = {
		s1: {
			name: "s1",
			id: 0,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			},
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			}
		},
		s2: {
			name: "s2",
			id: 0,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			},
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			} 
		},
		s3: {
			name: "s3",
			id: 0,
			to1: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			}, 
			to2: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			},
			to3: {
				addedIndices: [-1,-1,-1],
				transitions: [0,0,0]
			}
		},

	}
}












//x
//y
//image_xscale	
//image_yscale
//image_angle


function genAllStates3State(){
	
	// STATES A B C
	var stateA = instance_create_layer(156, 400, "Instances", StateObj);
	var startStateButton = instance_create_layer(156, 400, "Instances", StartButtonObj);
	var stateB = instance_create_layer(156, 400, "Instances", StateObj);
	var stateC = instance_create_layer(156, 400, "Instances", EndStateObj);

	//stateA.visible = true
	stateA.x = 288
	stateA.y = 192
	stateA.image_xscale = .4
	stateA.image_yscale = .4
	stateA.image_angle = 0
	

	//startStateButton.visible = true
	startStateButton.depth = -1
	startStateButton.x = 303
	startStateButton.y = 201
	startStateButton.image_xscale = .7
	startStateButton.image_yscale = .7
	startStateButton.image_angle = 0

	//stateB.visible = true
	stateB.x = 672
	stateB.y = 192
	stateB.image_xscale = .4
	stateB.image_yscale = .4
	stateB.image_angle = 0

	//stateC.visible = true
	stateC.x = 1056
	stateC.y = 192
	stateC.image_xscale = .4
	stateC.image_yscale = .4
	stateC.image_angle = 0
	
	global.stateIDs = [stateA.id, stateB.id, stateC.id]
	global.states_info.s1.id = stateA.id
	global.states_info.s2.id = stateB.id
	global.states_info.s3.id = stateB.id
}



function genAllTransitions3State(){
	
	// SELF transitions
	
	// STATE A
	var selfA1 = instance_create_layer(156, 400, "Instances", TransitionSelfObj1);
	var selfA2 = instance_create_layer(156, 400, "Instances", TransitionSelfObj2);
	var selfA3 = instance_create_layer(156, 400, "Instances", TransitionSelfObj3);

	selfA1.visible = false
	selfA1.depth = 1
	selfA1.x = 195
	selfA1.y = 384
	selfA1.image_xscale = .35
	selfA1.image_yscale = .35
	selfA1.image_angle = 90

	selfA2.visible = false
	selfA2.depth = 1
	selfA2.x = 195
	selfA2.y = 384
	selfA2.image_xscale = .35
	selfA2.image_yscale = .35
	selfA2.image_angle = 90

	selfA3.visible = false
	selfA3.depth = 1
	selfA3.x = 195
	selfA3.y = 384
	selfA3.image_xscale = .35
	selfA3.image_yscale = .35
	selfA3.image_angle = 90

	global.states_info.s1.to1.transitions = [selfA1.id, selfA2.id, selfA3.id]


	// STATE B
	var selfB1 = instance_create_layer(156, 400, "Instances", TransitionSelfObj1);
	var selfB2 = instance_create_layer(156, 400, "Instances", TransitionSelfObj2);
	var selfB3 = instance_create_layer(156, 400, "Instances", TransitionSelfObj3);

	selfB1.visible = false
	selfB1.depth = 1
	selfB1.x = 684
	selfB1.y = 95
	selfB1.image_xscale = .35
	selfB1.image_yscale = .35
	selfB1.image_angle = 0

	selfB2.visible = false
	selfB2.depth = 1
	selfB2.x = 684
	selfB2.y = 95
	selfB2.image_xscale = .35
	selfB2.image_yscale = .35
	selfB2.image_angle = 0

	selfB3.visible = false
	selfB3.depth = 1
	selfB3.x = 684
	selfB3.y = 95
	selfB3.image_xscale = .35
	selfB3.image_yscale = .35
	selfB3.image_angle = 0
	
	global.states_info.s2.to2.transitions = [selfB1.id, selfB2.id, selfB3.id]
	
	// STATE C
	var selfC1 = instance_create_layer(156, 400, "Instances", TransitionSelfObj1);
	var selfC2 = instance_create_layer(156, 400, "Instances", TransitionSelfObj2);
	var selfC3 = instance_create_layer(156, 400, "Instances", TransitionSelfObj3);

	selfC1.visible = false
	selfC1.depth = 1
	selfC1.x = 1359
	selfC1.y = 202
	selfC1.image_xscale = .35
	selfC1.image_yscale = .35
	selfC1.image_angle = 270

	selfC2.visible = false
	selfC2.depth = 1
	selfC2.x = 1359
	selfC2.y = 202
	selfC2.image_xscale = .35
	selfC2.image_yscale = .35
	selfC2.image_angle = 270

	selfC3.visible = false
	selfC3.depth = 1
	selfC3.x = 1359
	selfC3.y = 202
	selfC3.image_xscale = .35
	selfC3.image_yscale = .35
	selfC3.image_angle = 270

	global.states_info.s3.to3.transitions = [selfC1.id, selfC2.id, selfC3.id]


	// SHORT transitions

	// STATE AB
	var shortAB1 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortAB2 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);
	var shortAB3 = instance_create_layer(156, 400, "Instances", TransitionShortObj3);

	shortAB1.visible = false
	shortAB1.depth = 1
	shortAB1.x = 392
	shortAB1.y = 134
	shortAB1.image_xscale = .35
	shortAB1.image_yscale = .35
	shortAB1.image_angle = 0

	shortAB2.visible = false
	shortAB2.depth = 1
	shortAB2.x = 392
	shortAB2.y = 134
	shortAB2.image_xscale = .35
	shortAB2.image_yscale = .35
	shortAB2.image_angle = 0

	shortAB3.visible = false
	shortAB3.depth = 1
	shortAB3.x = 392
	shortAB3.y = 134
	shortAB3.image_xscale = .35
	shortAB3.image_yscale = .35
	shortAB3.image_angle = 0

	global.states_info.s1.to2.transitions = [shortAB1.id, shortAB2.id, shortAB3.id]


	// STATE BC
	var shortBC1 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortBC2 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);
	var shortBC3 = instance_create_layer(156, 400, "Instances", TransitionShortObj3);

	shortBC1.visible = false
	shortBC1.depth = 1
	shortBC1.x = 774
	shortBC1.y = 131
	shortBC1.image_xscale = .35
	shortBC1.image_yscale = .35
	shortBC1.image_angle = 0

	shortBC2.visible = false
	shortBC2.depth = 1
	shortBC2.x = 774
	shortBC2.y = 131
	shortBC2.image_xscale = .35
	shortBC2.image_yscale = .35
	shortBC2.image_angle = 0

	shortBC3.visible = false
	shortBC3.depth = 1
	shortBC3.x = 774
	shortBC3.y = 131
	shortBC3.image_xscale = .35
	shortBC3.image_yscale = .35
	shortBC3.image_angle = 0

	global.states_info.s2.to3.transitions = [shortBC1.id, shortBC2.id, shortBC3.id]

	// STATE CB
	var shortCB1 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortCB2 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);
	var shortCB3 = instance_create_layer(156, 400, "Instances", TransitionShortObj3);

	shortCB1.visible = false
	shortCB1.depth = 1
	shortCB1.x = 1160
	shortCB1.y = 466
	shortCB1.image_xscale = .35
	shortCB1.image_yscale = .35
	shortCB1.image_angle = 180

	shortCB2.visible = false
	shortCB2.depth = 1
	shortCB2.x = 1160
	shortCB2.y = 466
	shortCB2.image_xscale = .35
	shortCB2.image_yscale = .35
	shortCB2.image_angle = 180

	shortCB3.visible = false
	shortCB3.depth = 1
	shortCB3.x = 1160
	shortCB3.y = 466
	shortCB3.image_xscale = .35
	shortCB3.image_yscale = .35
	shortCB3.image_angle = 180

	global.states_info.s3.to2.transitions = [shortCB1.id, shortCB2.id, shortCB3.id]

	// STATE BA
	var shortBA1 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortBA2 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);
	var shortBA3 = instance_create_layer(156, 400, "Instances", TransitionShortObj3);

	shortBA1.visible = false
	shortBA1.depth = 1
	shortBA1.x = 775
	shortBA1.y = 465
	shortBA1.image_xscale = .35
	shortBA1.image_yscale = .35
	shortBA1.image_angle = -180

	shortBA2.visible = false
	shortBA2.depth = 1
	shortBA2.x = 775
	shortBA2.y = 465
	shortBA2.image_xscale = .35
	shortBA2.image_yscale = .35
	shortBA2.image_angle = -180

	shortBA3.visible = false
	shortBA3.depth = 1
	shortBA3.x = 775
	shortBA3.y = 465
	shortBA3.image_xscale = .35
	shortBA3.image_yscale = .35
	shortBA3.image_angle = -180

	global.states_info.s2.to1.transitions = [shortBA1.id, shortBA2.id, shortBA3.id]

	// LONG transitions
	
	// STATE AC
	var longAC1 = instance_create_layer(156, 400, "Instances", TransitionLongObj1);
	var longAC2 = instance_create_layer(156, 400, "Instances", TransitionLongObj2);
	var longAC3 = instance_create_layer(156, 400, "Instances", TransitionLongObj3);

	longAC1.visible = false
	longAC1.depth = 1
	longAC1.x = 366
	longAC1.y = 584
	longAC1.image_xscale = -.4
	longAC1.image_yscale = .4
	longAC1.image_angle = -180

	longAC2.visible = false
	longAC2.depth = 1
	longAC2.x = 366
	longAC2.y = 584
	longAC2.image_xscale = -.4
	longAC2.image_yscale = .4
	longAC2.image_angle = -180

	longAC3.visible = false
	longAC3.depth = 1
	longAC3.x = 366
	longAC3.y = 584
	longAC3.image_xscale = -.4
	longAC3.image_yscale = .4
	longAC3.image_angle = -180
	
	global.states_info.s1.to3.transitions = [longAC1.id, longAC2.id, longAC3.id]
	
	// STATE CA
	var longCA1 = instance_create_layer(156, 400, "Instances", TransitionLongObj1);
	var longCA2 = instance_create_layer(156, 400, "Instances", TransitionLongObj2);
	var longCA3 = instance_create_layer(156, 400, "Instances", TransitionLongObj3);

	longCA1.visible = false
	longCA1.depth = 1
	longCA1.x = 1189
	longCA1.y = 8
	longCA1.image_xscale = -.4
	longCA1.image_yscale = .4
	longCA1.image_angle = 0

	longCA2.visible = false
	longCA2.depth = 1
	longCA2.x = 1189
	longCA2.y = 8
	longCA2.image_xscale = -.4
	longCA2.image_yscale = .4
	longCA2.image_angle = 0

	longCA3.visible = false
	longCA3.depth = 1
	longCA3.x = 1189
	longCA3.y = 8
	longCA3.image_xscale = -.4
	longCA3.image_yscale = .4
	longCA3.image_angle = 0
	
	global.states_info.s3.to1.transitions = [longCA1.id, longCA2.id, longCA3.id]
}















