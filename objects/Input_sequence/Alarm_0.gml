sequenceObjs = [];

for(var i = 0; i < string_length(sequence); i++){
	
	var goal;

	letter = string_char_at(sequence, i+1);
	
	if(letter == "b"){goal = blue_goal;}
	if(letter == "g"){goal = green_goal;}
	if(letter == "r"){goal = red_goal;}

	
	sequenceObjs[i] = instance_create_layer((self.x + (64 * i)), self.y, "Dynamic", goal);
	
}

//show_debug_message("WWWWWWWWWWWWWWWWWWWWWWWWWWW")
//show_debug_message(sequence_objs)
endObj = instance_create_layer((self.x + (64 * 5) - 10), self.y, "Dynamic", input_goal);
endObj.inputSequence = self;

if(!acceptingOrNot){
	end_obj.sprite_index = Goal_NA_end;
}