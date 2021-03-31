/// @description Insert description here
// You can write your code in this editor
if(clickedOrNot){
	if(mouse_x < baseID.x - 250){
		x = baseID.x - 250;
	}
	else if(mouse_x > baseID.x + 250){
		x = baseID.x + 250;
	}
	else{
		x = mouse_x;
	}
	setVolumeForAudioGroup(baseID.audioGroupID, extractValue(baseID));
}