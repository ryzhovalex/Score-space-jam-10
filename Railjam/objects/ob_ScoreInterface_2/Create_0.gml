/// @description Insert description here
// You can write your code in this editor

global.player_highscore = 0;

ini_open("jam_on_rails.sav");
global.player_highscore = ini_read_real("player", "highscore", 0);
ini_close();