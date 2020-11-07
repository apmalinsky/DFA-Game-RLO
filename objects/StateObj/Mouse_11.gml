
//global.saved_transition_instance = 0; //delete the saved transition

window_set_cursor(cr_default);

//destroy created arrow object

//instance_destroy(global.saved_transition_instance);


//get correct transition currently in alpha
//show_debug_message(global.addedTransition)

if (!global.addedTransition){

	if (global.hovered_transition != 0 && !global.duplicate_hovered_transition){

		with (global.hovered_transition) {
			visible = false
		}	
	}
	
	
}

global.addedTransition = false;
global.hovered_transition = 0;

global.duplicate_hovered_transition = false;

show_debug_message(global.dfa.transitions)

