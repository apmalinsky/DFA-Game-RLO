/// @description Make the arrow purple
// You can write your code in this editor

if(sprite_index = Transition_self_3_purple){
	shader_set(TransitionArrowPurple);

	rightHandle = shader_get_uniform(TransitionArrowPurple, "rightX");

	shader_set_uniform_f(rightHandle, image_index / image_number);

	draw_self();

	shader_reset();
}
else{
	draw_self();
}