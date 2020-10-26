/// @description draw self

draw_set_font(fo_score)
draw_set_color(c_white)

draw_text(x, y, "highscore: " + string(global.player_highscore))