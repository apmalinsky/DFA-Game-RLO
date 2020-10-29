

// if correct sequence go to next room
if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, self)) {
	
	show_debug_message("Submitted.");
	room_goto(Room2);
}
