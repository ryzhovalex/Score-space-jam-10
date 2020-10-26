/// @description <-->

timer_seconds = 120
timer_proceed = false

/// @function						start_timer()
/// @description					Starting reverse timer. Void.
function start_timer() {
	timer_proceed = true
}


/// @function						_evaluate_timer()
/// @description					Calculating reversing timer. Void.
function _evaluate_timer() {
	if (timer_proceed) {
		timer_seconds -= 1 / room_speed
	}
}


/// @function						timer_check()
/// @description					Checking timer and send signal if it has finished. Void.
function _timer_check() {
	if (timer_seconds <= 0) {
		GAME_CONTROLLER.game_over("timer")
	}
}
	