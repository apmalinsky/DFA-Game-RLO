sequence_objs = [];

var i;
for(i=0; i<string_length(sequence); i++){
	
	var goal;

	letter = string_char_at(sequence, i+1);
	
	if(letter == "b"){goal = blue_goal;}
	if(letter == "g"){goal = green_goal;}
	if(letter == "r"){goal = red_goal;}

	
	sequence_objs[i] = instance_create_layer((self.x + (64 * i)), self.y, "Instances", goal);
	
}

//show_debug_message("WWWWWWWWWWWWWWWWWWWWWWWWWWW")
//show_debug_message(sequence_objs)
end_obj = instance_create_layer((self.x + (64 * 5) - 10), self.y, "Instances", input_goal);
end_obj.inputSequence = self;

if(!acceptingOrNot){
	end_obj.sprite_index = Goal_NA_end;
}