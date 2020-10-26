/// @description Ini sprite

// Задаем спрайт в соответствии с instance_type
for (i = 0; i < sprite_get_number(sp_TrainSpawn); i++) {
	if (instance_type == chr(i + 65)) {
		image_index = i;
		image_speed = 0;
		break;
	}
}