
// Max talk sprite dimentions are 63x68

if enabled
{
	// Outline
	draw_set_color(c_white)
	draw_rectangle(17*window_scale,  161*window_scale, 303*window_scale, 236*window_scale, false)

	// Box
	draw_set_color(c_black)
	draw_rectangle(20*window_scale,  164*window_scale, 300*window_scale, 233*window_scale, false)

	// Text
	var text_x = (sprite_exists(sprite) ? 88 : 30)*window_scale
	var text_y = 175*window_scale
	
	draw_set_color(c_white)
	draw_set_font(fnt_dialogue)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_transformed(text_x, text_y, text, window_scale, window_scale, 0)

	// Sprite
	if sprite_exists(sprite)
	{
		draw_sprite_ext(sprite, 0, 53*window_scale, 199*window_scale, window_scale, window_scale, 0, c_white, 1)
	}
}