// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//This function must be called for all sliders.
function generateSlider(xPos, yPos, audioGroup){
	if(os_browser != browser_not_a_browser){
		var sliderBaseID = instance_create_layer(xPos, yPos, "Instances", SliderBaseObj);
	    var sliderButtonID = instance_create_layer(xPos, yPos, "Instances", SliderButtonMusicObj);
    }
	else{
		var sliderButtonID = instance_create_layer(xPos, yPos, "Instances", SliderButtonMusicObj);
		var sliderBaseID = instance_create_layer(xPos, yPos, "Instances", SliderBaseObj);
	}
	
	with(sliderButtonID){
		baseID = sliderBaseID;
		if(audioGroup = Music){
			sprite_index = slider_button_music_spr;
		}
		else if(audioGroup = SoundEffects){
			sprite_index = slider_button_volume_spr;
		}
	}
	with(sliderBaseID){
		buttonID = sliderButtonID;
		audioGroupID = audioGroup;
	}
}

//You don't have to set the minimum and maximum value, it is by default 0 and 100 respectively.
function setMinMaxForSlider(sliderBaseID, minimumValue, maximumValue){
	if(maximumValue < minimumValue){
		show_error("the maximum value cannot be lower than the minimum value", true);
	}
	with(sliderBaseID){
		minVal = minimumValue;
		maxVal = maximumValue;
	}
}

function extractValue(sliderBaseID){
	with(sliderBaseID){
		var sliderFloat = ((buttonID.x - x) / 500) + 0.5;
		return minVal + (maxVal - minVal) * sliderFloat;
	}
}

function setVolumeForAudioGroup(audioGroup, volume){
	if(volume < 0 or volume > 100){
		show_error("Volume must be between 0 and 100", true);
	}
	audio_group_set_gain(audioGroup, volume / 100, 0);
}