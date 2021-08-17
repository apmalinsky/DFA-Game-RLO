/// @description Insert description here
// You can write your code in this editor
draw_self()
if(showTooltip){
	draw_set_color(c_dkgray);
	draw_rectangle(mouse_x + 10, mouse_y, mouse_x + 50, mouse_y + 16, false);
	draw_set_colour(c_white);
	draw_set_font(Times12);
	draw_text(mouse_x + 12, mouse_y + 2, "Home");
}