/// @description Start game

if (state == 0) {
	GAME_CONTROLLER.game_start();
	state = 1;	
	audio_play_sound(sn_buttonClick, 1, false);
}