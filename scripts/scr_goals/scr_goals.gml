// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_input(goal_id){
	
	sprite_id = goal_id.sprite_index;
	
	if (sprite_id = Completed_blue || sprite_id = Failed_blue) {
		
		goal_id.sprite_index = Goal_blue
	
	}
	if (sprite_id = Completed_green || sprite_id = Failed_green) {
		
		goal_id.sprite_index = Goal_green
	
	}

	if (sprite_id = Completed_red || sprite_id = Failed_red) {
		
		goal_id.sprite_index = Goal_red
	
	}
	
	if (sprite_id = Completed_goal || sprite_id = Failed_goal) {
		
		goal_id.sprite_index = Goal_end
	
	}
}

function reset_all_goals(){
	
	
	for (var i = 0; i<array_length(global.inputs); i++){
		for (var j = 0; j<array_length(global.inputs[i].sequence_objs); j++){
		
			reset_input(global.inputs[i].sequence_objs[j]);
			global.inputs[i].sequence_objs[j].image_alpha=1;
		
			}
	
		reset_input(global.inputs[i].end_obj);
		global.inputs[i].end_obj.image_alpha=1;
	
		}
}