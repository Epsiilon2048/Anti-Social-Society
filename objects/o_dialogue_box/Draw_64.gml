
// Max talk sprite dimentions are 66x68

// Outline
draw_set_color(c_white)
draw_rectangle(17*window_scale,  161*window_scale, 303*window_scale, 236*window_scale, false)

// Box
draw_set_color(c_black)
draw_rectangle(20*window_scale,  164*window_scale, 300*window_scale, 233*window_scale, false)

// Text
draw_set_color(c_white)
draw_set_font(fnt_dialogue)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_transformed(88*window_scale, 174*window_scale, text, window_scale, window_scale, 0)

// Sprite
draw_sprite_ext(s_kelly_head, 0, 53*window_scale, 199*window_scale, window_scale, window_scale, 0, c_white, 1)