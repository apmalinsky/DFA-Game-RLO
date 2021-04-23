/// @description Insert description here
// You can write your code in this editor
if(ds_map_find_value(async_load, "type") == "audiogroup_load"){
	var audioGroup = ds_map_find_value(async_load, "group_id");
	if(audioGroup == Music){
		audio_play_sound(theme, 10, true);
	}
	audio_group_set_gain(audioGroup,0.5,0);
}