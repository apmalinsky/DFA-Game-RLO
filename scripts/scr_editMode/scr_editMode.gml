



function editOn(){


with (TransitionParentObj) {	
	with (object_index){
		visible = true;
		
	}
}

/*
//console log id for states and transitions on hover

with(TransitionLongObj1){
	if(ev_mouse_enter){
		show_debug_message("Transition: " + string(id))
	}

}


*/

//show_debug_message("State: " + string(id))

}





function printInfo(){
	show_debug_message("Transition: " + string(id))
	show_debug_message("PositionX: " + string(x))
	show_debug_message("PositionY: " + string(y))
	show_debug_message("ScaleX: " + string(image_xscale))
	show_debug_message("ScaleY: " + string(image_yscale))
	show_debug_message("Rotation: " + string(image_angle))
	show_debug_message("Object: " + object_get_name(object_index))
	
	
	
}







