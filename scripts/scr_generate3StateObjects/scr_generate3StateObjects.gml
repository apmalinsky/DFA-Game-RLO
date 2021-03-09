


// script for generating state and transition objects for 3-State level designs



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
	stateA.x = 244.818
	stateA.y = 156.526
	stateA.image_xscale = .537
	stateA.image_yscale = .537
	stateA.image_angle = 0
	

	//startStateButton.visible = true
	startStateButton.depth = -1
	startStateButton.x = 288
	startStateButton.y = 192
	startStateButton.image_xscale = .787
	startStateButton.image_yscale = .787
	startStateButton.image_angle = -0.1083

	//stateB.visible = true
	stateB.x = 623.299
	stateB.y = 156.526
	stateB.image_xscale = .537
	stateB.image_yscale = .537
	stateB.image_angle = 0

	//stateC.visible = true
	stateC.x = 984.577
	stateC.y = 156.526
	stateC.image_xscale = .537
	stateC.image_yscale = .537
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
	selfA1.x = 156
	selfA1.y = 383
	selfA1.image_xscale = .39
	selfA1.image_yscale = .39
	selfA1.image_angle = 90

	selfA2.visible = false
	selfA2.depth = 1
	selfA2.x = 147
	selfA2.y = 383
	selfA2.image_xscale = .39
	selfA2.image_yscale = .39
	selfA2.image_angle = 90

	selfA3.visible = false
	selfA3.depth = 1
	selfA3.x = 147
	selfA3.y = 392
	selfA3.image_xscale = .39
	selfA3.image_yscale = .39
	selfA3.image_angle = 90

	global.states_info.s1.to1.transitions = [selfA1.id, selfA2.id, selfA3.id]


	// STATE B
	var selfB1 = instance_create_layer(156, 400, "Instances", TransitionSelfObj2);
	var selfB2 = instance_create_layer(156, 400, "Instances", TransitionSelfObj1);
	var selfB3 = instance_create_layer(156, 400, "Instances", TransitionSelfObj1);

	selfB1.visible = false
	selfB1.depth = 1
	selfB1.x = 688
	selfB1.y = 88
	selfB1.image_xscale = .28
	selfB1.image_yscale = .28
	selfB1.image_angle = 0

	selfB2.visible = false
	selfB2.depth = 1
	selfB2.x = 685
	selfB2.y = 92
	selfB2.image_xscale = .28
	selfB2.image_yscale = .28
	selfB2.image_angle = 0

	selfB3.visible = false
	selfB3.depth = 1
	selfB3.x = 839
	selfB3.y = 493
	selfB3.image_xscale = .28
	selfB3.image_yscale = .28
	selfB3.image_angle = -180
	
	global.states_info.s2.to2.transitions = [selfB2.id, selfB1.id, selfB3.id]
	
	// STATE C
	var selfC1 = instance_create_layer(156, 400, "Instances", TransitionSelfObj1);
	var selfC2 = instance_create_layer(156, 400, "Instances", TransitionSelfObj2);
	var selfC3 = instance_create_layer(156, 400, "Instances", TransitionSelfObj3);

	selfC1.visible = false
	selfC1.depth = 1
	selfC1.x = 1364
	selfC1.y = 194
	selfC1.image_xscale = .39
	selfC1.image_yscale = .39
	selfC1.image_angle = 270

	selfC2.visible = false
	selfC2.depth = 1
	selfC2.x = 1364
	selfC2.y = 194
	selfC2.image_xscale = .39
	selfC2.image_yscale = .39
	selfC2.image_angle = 270

	selfC3.visible = false
	selfC3.depth = 1
	selfC3.x = 1358
	selfC3.y = 194
	selfC3.image_xscale = .39
	selfC3.image_yscale = .39
	selfC3.image_angle = 270

	global.states_info.s3.to3.transitions = [selfC1.id, selfC2.id, selfC3.id]


	// SHORT transitions

	// STATE AB
	var shortAB1 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);
	var shortAB2 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortAB3 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);

	shortAB1.visible = false
	shortAB1.depth = 1
	shortAB1.x = 354
	shortAB1.y = 69
	shortAB1.image_xscale = .39
	shortAB1.image_yscale = .39
	shortAB1.image_angle = 0

	shortAB2.visible = false
	shortAB2.depth = 1
	shortAB2.x = 351
	shortAB2.y = 69
	shortAB2.image_xscale = .39
	shortAB2.image_yscale = .39
	shortAB2.image_angle = 0

	shortAB3.visible = false
	shortAB3.depth = 1
	shortAB3.x = 338
	shortAB3.y = 105
	shortAB3.image_xscale = .39
	shortAB3.image_yscale = .39
	shortAB3.image_angle = 0

	global.states_info.s1.to2.transitions = [shortAB1.id, shortAB2.id, shortAB3.id]


	// STATE BC
	var shortBC1 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);
	var shortBC2 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortBC3 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);

	shortBC1.visible = false
	shortBC1.depth = 1
	shortBC1.x = 705
	shortBC1.y = 79
	shortBC1.image_xscale = .39
	shortBC1.image_yscale = .39
	shortBC1.image_angle = 0

	shortBC2.visible = false
	shortBC2.depth = 1
	shortBC2.x = 711
	shortBC2.y = 79
	shortBC2.image_xscale = .39
	shortBC2.image_yscale = .39
	shortBC2.image_angle = 0

	shortBC3.visible = false
	shortBC3.depth = 1
	shortBC3.x = 702
	shortBC3.y = 112
	shortBC3.image_xscale = .39
	shortBC3.image_yscale = .39
	shortBC3.image_angle = 0

	global.states_info.s2.to3.transitions = [shortBC1.id, shortBC2.id, shortBC3.id]

	// STATE CB
	var shortCB1 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortCB2 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortCB3 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);

	shortCB1.visible = false
	shortCB1.depth = 1
	shortCB1.x = 1192
	shortCB1.y = 456
	shortCB1.image_xscale = .39
	shortCB1.image_yscale = .39
	shortCB1.image_angle = 180

	shortCB2.visible = false
	shortCB2.depth = 1
	shortCB2.x = 1186
	shortCB2.y = 492
	shortCB2.image_xscale = .39
	shortCB2.image_yscale = .39
	shortCB2.image_angle = 180

	shortCB3.visible = false
	shortCB3.depth = 1
	shortCB3.x = 1189
	shortCB3.y = 492
	shortCB3.image_xscale = .39
	shortCB3.image_yscale = .39
	shortCB3.image_angle = 180

	global.states_info.s3.to2.transitions = [shortCB1.id, shortCB2.id, shortCB3.id]

	// STATE BA
	var shortBA1 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortBA2 = instance_create_layer(156, 400, "Instances", TransitionShortObj1);
	var shortBA3 = instance_create_layer(156, 400, "Instances", TransitionShortObj2);

	shortBA1.visible = false
	shortBA1.depth = 1
	shortBA1.x = 815
	shortBA1.y = 457
	shortBA1.image_xscale = .39
	shortBA1.image_yscale = .39
	shortBA1.image_angle = -180

	shortBA2.visible = false
	shortBA2.depth = 1
	shortBA2.x = 802
	shortBA2.y = 496
	shortBA2.image_xscale = .39
	shortBA2.image_yscale = .39
	shortBA2.image_angle = -180

	shortBA3.visible = false
	shortBA3.depth = 1
	shortBA3.x = 806
	shortBA3.y = 499
	shortBA3.image_xscale = .39
	shortBA3.image_yscale = .39
	shortBA3.image_angle = -180

	global.states_info.s2.to1.transitions = [shortBA1.id, shortBA2.id, shortBA3.id]

	// LONG transitions
	
	// STATE AC
	var longAC1 = instance_create_layer(156, 400, "Instances", TransitionLongObj3);
	var longAC2 = instance_create_layer(156, 400, "Instances", TransitionLongObj2);
	var longAC3 = instance_create_layer(156, 400, "Instances", TransitionLongObj1);

	longAC1.visible = false
	longAC1.depth = 1
	longAC1.x = 334
	longAC1.y = -31
	longAC1.image_xscale = .41
	longAC1.image_yscale = .41
	longAC1.image_angle = 0

	longAC2.visible = false
	longAC2.depth = 1
	longAC2.x = 329
	longAC2.y = -52
	longAC2.image_xscale = .41
	longAC2.image_yscale = .41
	longAC2.image_angle = 0

	longAC3.visible = false
	longAC3.depth = 1
	longAC3.x = 326
	longAC3.y = -65
	longAC3.image_xscale = .41
	longAC3.image_yscale = .41
	longAC3.image_angle = 0
	
	global.states_info.s1.to3.transitions = [longAC3.id, longAC2.id, longAC1.id]
	
	// STATE CA
	var longCA1 = instance_create_layer(156, 400, "Instances", TransitionLongObj1);
	var longCA2 = instance_create_layer(156, 400, "Instances", TransitionLongObj2);
	var longCA3 = instance_create_layer(156, 400, "Instances", TransitionLongObj3);

	longCA1.visible = false
	longCA1.depth = 1
	longCA1.x = 1172
	longCA1.y = 649
	longCA1.image_xscale = .41
	longCA1.image_yscale = .41
	longCA1.image_angle = 180

	longCA2.visible = false
	longCA2.depth = 1
	longCA2.x = 1162
	longCA2.y = 630
	longCA2.image_xscale = .41
	longCA2.image_yscale = .41
	longCA2.image_angle = 180

	longCA3.visible = false
	longCA3.depth = 1
	longCA3.x = 1153
	longCA3.y = 612
	longCA3.image_xscale = .41
	longCA3.image_yscale = .41
	longCA3.image_angle = 180
	
	global.states_info.s3.to1.transitions = [longCA1.id, longCA2.id, longCA3.id]
}















