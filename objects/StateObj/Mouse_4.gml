


if (global.selected_color != "") {
	show_debug_message("Changed");
	switch(global.selected_color){
			case "red":
				if (image_blend == c_red){
					image_blend = c_white;
				}
				else {
					image_blend = c_red;
				}
				break;
			case "green":
				if (image_blend == c_green){
					image_blend = c_white;
				}
				else {
					image_blend = c_green;
				}
				break;
			case "blue":
				if (image_blend == c_blue){
					image_blend = c_white;
				}
				else {
					image_blend = c_blue;
				}
				break;
			default:
				break;
		}
		
}


