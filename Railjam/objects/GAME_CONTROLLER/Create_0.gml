/// @description <-->

game_procced = false;
pause = false;
global.player_score = 0;
gameOver = -1;
depth = -100

/// @function           game_start()	
/// @description        Order to start game. Void.
function game_start() {
	TASK_CONTROLLER.enable_task_manager()
	TIMER.start_timer()	
	game_procced = true;
}
	

/// @function           fullscreen_switch()	
/// @description        Changing fullscreen mode. Void.
function fullscreen_switch() {
	window_set_fullscreen(!window_get_fullscreen())
}


/// @function						button_handler(number)
/// @param {int}  button_number     Logic number of pressed button
/// @description					Handling button clicks and changing statuses of appropriate crossways. Void.
function button_handler(button_number) {
	function _crossway_iterator(button_number, crossway) {
		// | takes crossway object type and search for all instances of it in the room, 
		// | then changing their status
		
		var _crossway = noone
	
		//find all instances with same number and change its status
		for (var j = 0; j < instance_number(crossway); j++) {
			_crossway = instance_find(crossway, j)
		
			if (_crossway.logic_number == button_number) {
				_crossway.change_status()
			}	
		}
	}
	
	//iterate all instances of all types of crossways
	for (var i = 0; i < array_length(global.CROSSWAYS); i++) {
		_crossway_iterator(button_number, global.CROSSWAYS[i])
	}
}


/// @function						initialize_train(number)
/// @param {int}  start_point		Point to start from
/// @param {int}  end_point			Point of end destination
/// @param {int}  score_value		How much in score train will cost
/// @description					Creates train and set his task. Void.
function initialize_train(start_point, end_point, score_value) {
	var _spawn = _find_target(ob_TrainSpawn, start_point)
	
	var _train = instance_create_depth(_spawn.x, _spawn.y, -1, ob_Train)
	
	_train.task_number = TASK_CONTROLLER.take_task(score_value) - 1
	_train.target_station_type = end_point
}


/// @function						_find_target(object, point)
/// @description					Find object by comparible point. Returns that object.
function _find_target(object, point) {
	for (var i = 0; i < instance_number(object); i++) {
		var _target = instance_find(object, i)
		if (_target.instance_type == point) {
			return _target
		}
	}
}


/// @function						game_over(event_name)
/// @param {str}  event_name        Name of happened event ("collide", "timer")
/// @description					End game. Void.
function game_over(event_name) {
	switch (event_name) {
		case "collide":
			var lay_id = layer_get_id("Background");
			var back_id = layer_background_get_id(lay_id);
			layer_background_sprite(back_id, bckg_fakeScreen);
			instance_deactivate_all(true)
			gameOver = 0
			alarm[0] = room_speed * 3;
			break
			
		case "timer":
			var lay_id = layer_get_id("Background");
			var back_id = layer_background_get_id(lay_id);
			layer_background_sprite(back_id, bckg_fakeScreen);
			instance_deactivate_all(true)
			gameOver = 1
			alarm[0] = room_speed * 3;
			break
			
		default:
			show_message("Game end")
			game_end()
			break
	}
}
///

/*
switch (event_name) {
		case "collide":
			show_message("Trains crushed!")
			room_goto(rm_menuScore)
			break
		case "timer":
			show_message("Timer's up!")
			room_goto(rm_menuScore)
			break
		default:
			show_message("Game end")
			game_end()
			break
			*/