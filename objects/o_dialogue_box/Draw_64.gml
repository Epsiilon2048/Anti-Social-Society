
// Max talk sprite dimentions are 63x68

var sc = window_scale // A macro for a macro!! (oh god i almost named the variable ws)

if enabled
{
	// Outline
	draw_set_color(c_white)
	draw_rectangle(17*sc,  161*sc, 303*sc, 236*sc, false)

	// Box
	draw_set_color(c_black)
	draw_rectangle(20*sc,  164*sc, 300*sc, 233*sc, false)

	// Text
	var text_x = (sprite_exists(sprite) ? 104 : 46)*sc
	var text_y = 173*sc
	
	draw_set_color(c_white)
	draw_set_font(fnt_dialogue)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_ext_transformed(text_x, text_y, text, 6*sc, 999, sc, sc, 0)

	// Sprite
	if sprite_exists(sprite)
	{
		draw_sprite_ext(sprite, 0, 53*sc, 199*sc, sc, sc, 0, c_white, 1)
	}
}

//draw_text(50, 50, format_dialogue_line(keyboard_string, false))