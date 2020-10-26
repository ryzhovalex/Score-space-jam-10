/// @description draw self

draw_set_font(fo_score_1)
draw_set_color(c_white)
draw_text(x, y, "Your score: " + string(global.player_score))
draw_text(x, y+48, "Highscore: " + string(global.player_highscore))