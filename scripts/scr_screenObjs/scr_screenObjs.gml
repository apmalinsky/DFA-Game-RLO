// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changeStar(i){
	//maybe havbe naming convention for object so the ith 
	//star has name that can be modified by knowing i
}


//assumes level_stars is an array where each element is another array with 2 elements,like a tuple, containing levelID and number of stars
//takes a levelID and either returns the number of stars if it exists in the array, or -1 otherwise
function getStars(levelID){
	for (var i = 0; i < global.level_stars_curr_size; i++){
		if(global.level_stars[i][0] == levelID){
			return global.level_stars[i][1];
		}
	}
	return -1;
}

//assumes level_stars is an array where each element is another array with 2 elements, like a tuple, containing levelID and number of stars
//this can modify the star count for an existing combination of levelID and star quantity or create it if it doesn't exist
function modifyStars(levelID, newQuantity){
	var found = false;
	for (var i = 0; i < global.level_stars_curr_size; i++){
		//in the case it already exists in the logic
		if(global.level_stars[i][0] = levelID){
			global.level_stars[i][1] = newQuantity;
			found = true;
		}
	}
	//the case it is first added
	if(not found){
		//check if there is any space left
		if(global.level_stars_curr_size < array_length_1d(global.level_stars)){
			var tuple = [2];
			tuple[0] = levelID;
			tuple[1] = newQuantity;
			global.level_stars[global.level_stars_curr_size] = tuple;
			global.level_stars_curr_size++;
		}
		else{
			show_error("Fatal error, update number of levels in playButtonObj to allocate enough room", true);
		}
	}
}

//return the total number of stars by traversing the level_stars array's used slots.
function getTotalStars(){
	var result = 0;
	for (var i = 0; i < global.level_stars_curr_size; i++){
		result += global.level_stars[i][1];
	}
	return result;
}
