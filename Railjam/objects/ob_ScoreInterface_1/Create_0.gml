/// @description Insert description here
// You can write your code in this editor

if (global.player_score > global.player_highscore) {
	ini_open("jam_on_rails.sav");
	ini_write_real("player", "highscore", global.player_score);
	ini_close();
}

ini_open("jam_on_rails.sav");
global.player_highscore = ini_read_real("player", "highscore", 0);
ini_close();