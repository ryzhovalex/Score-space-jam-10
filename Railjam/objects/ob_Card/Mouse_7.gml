/// @description take task

if (GAME_CONTROLLER.game_procced) {
	GAME_CONTROLLER.initialize_train(start_point, end_point, score_value)
	CARDS_CONTAINER.delete_card(container_position)
	audio_play_sound(sn_cardSlide, 1, false);
}
