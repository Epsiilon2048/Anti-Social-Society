
// Max talk sprite dimentions are 63x68

var sc = window_scale // A macro for a macro!! (oh god i almost named the variable ws)

if enabled
{
	// hmu
	var is_top = o_chara.y > 160
	var top = (is_top ? 7 : 160)*sc
	var bottom = (is_top ? 84 : 236)*sc
	
	// Outline
	draw_set_color(c_white)
	draw_rectangle(17*sc,  top, 303*sc, bottom, false)

	// Box
	draw_set_color(c_black)
	draw_rectangle(20*sc, top+3*sc, 300*sc, bottom-3*sc, false)

	// Text
	var text_x = (sprite_exists(sprite) ? 104 : 46)*sc
	var text_y = top+10*sc
	
	draw_set_color(c_white)
	draw_set_font(fnt_dialogue)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_ext_transformed(text_x, text_y, text, 9+alpha_char_height, 999, sc, sc, 0)
	draw_text_ext_transformed(text_x-16*sc, text_y, "*", 9+alpha_char_height, 999, sc, sc, 0)

	// Sprite
	if sprite_exists(sprite)
	{
		draw_sprite_ext(sprite, 0, 53*sc, 199*sc, sc, sc, 0, c_white, 1)
	}
}