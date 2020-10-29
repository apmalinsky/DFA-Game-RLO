
//global.saved_transition_instance = 0; //delete the saved transition

window_set_cursor(cr_default);

//destroy created arrow object

//instance_destroy(global.saved_transition_instance);


//get correct transition currently in alpha


if (!global.addedTransition){
	with (global.hovered_transition) {
		visible = false
	}
	
	
}


global.addedTransition = false;
global.hovered_transition = 0;
