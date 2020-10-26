/// @description Cooldown freq

if (task_cooldown > cooldown_min) {
	task_cooldown -= cooldown_dif;
	_alarm1 = false;
}
	