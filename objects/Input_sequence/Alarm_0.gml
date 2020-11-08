/// @description Insert description here
// You can write your code in this editor


var i;
for(i=0; i<string_length(sequence); i++){
	
	var goal

	letter = string_char_at(sequence, i+1);
	
	if(letter == "b"){goal = blue_goal;}
	if(letter == "g"){goal = green_goal;}
	if(letter == "r"){goal = red_goal;}

	
	instance_create_layer((self.x + (64 * i)), self.y, "Instances", goal);
	
}