/// @description draw self

draw_set_font(fo_score)
draw_set_color(c_white)
draw_text(x, y, "score: " + string(global.player_score))