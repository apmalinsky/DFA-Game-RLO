
if (global.editMode){
	show_debug_message("Transition: " + string(id))
}


if (visible){
	
	removeTransition(string(id))
	//show_debug_message("transition: " + string(id))

	window_set_cursor(cr_default);
	visible = false;

}



