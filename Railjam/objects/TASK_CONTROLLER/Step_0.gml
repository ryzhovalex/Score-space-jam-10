/// @description task manager

task_manager()

if (!_alarm1) {
	_alarm1 = true;
	alarm[1] = cooldown_freq * room_speed;
}