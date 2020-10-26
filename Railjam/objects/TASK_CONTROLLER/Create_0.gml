/// @description <-->

//tasks with scores that currently picked up and active
tasks_scores = []

//task give cooldown time
task_cooldown = 8
cooldown_min = 5
cooldown_dif = 1
cooldown_freq = 8

_tasking_proceed = false // if true == auto tasking enabled

_alarm0 = false
_alarm1 = false

/// @function						enable_task_manager()
/// @description					Enables auto tasking. Void.
function enable_task_manager() {
	_tasking_proceed = true
	create_task()
}

function disable_task_manager() {
	_tasking_proceed = false;
}

/// @function						task_manager()
/// @description					Gives random tasks periodically. Void.
function task_manager() {
	if (_tasking_proceed) { 
		if (!_alarm0) {
			_alarm0 = true
			alarm[0] = room_speed * task_cooldown
		}
	}
}
	

/// @function						create_task()
/// @description					Creating new task with random values and move it to queue. Void.
function create_task() {
	var _title = global.TITLES[irandom(array_length(global.TITLES) - 1)]
	var _start_point = global.START_POINTS[irandom(array_length(global.START_POINTS) - 1)]
	var _end_point = irandom(1)
	var _score_value = irandom_range(20,28) * 10
	CARDS_CONTAINER.add_card(_title, _start_point, _end_point, _score_value)
}


/// @function						take_task(score_value)
/// @param {int}  score_value		Score for task
/// @description					Taking task for player. Return task number.
function take_task(score_value) {
	tasks_scores = append(tasks_scores, score_value)
	return array_length(tasks_scores)
}


/// @function						end_task(task_number, success)
/// @param {int}   task_number		Number of task
/// @param {bool}  success		    Successful task or not
/// @description					Ending task and calculate points according to successful. Void.
function end_task(task_number, success) {
	if (success) {
		TIMER.timer_seconds += 1
		global.player_score += tasks_scores[task_number]
	} else {
		global.player_score -= 100 //tasks_scores[task_number]
	}
}
		