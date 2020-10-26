/// @description <-->

spd_origin = 1
spd_mod = choose(0, 0.1, 0.2, 0.3, 0.4, 0.5);
spd = spd_origin + spd_mod;

_started = false //check if train collided with starting direction arrow

//task which this train makes
task_number = 0
target_station_type = 0

//true == train turned recently
_turned = false


/// @function           move()	
/// @description        Moving with self direction and spd. Void.
function move() {
	image_angle = direction
	
	//calculate move direction
	var _x = lengthdir_x(spd, direction)
	var _y = lengthdir_y(spd, direction)
	
	//move
	x += _x
	y += _y	
}
	

/// @function           direction_logic()	
/// @description        Checks for railways and does appropriate actions. Void.
function direction_logic() {
	var _rail_direction = instance_place(x, y, ob_RailDirection)
	var _crossA = instance_place(x, y, ob_CrosswayA)
	var _crossB = instance_place(x, y, ob_CrosswayB)
	var _crossC = instance_place(x, y, ob_CrosswayC)
	var _crossC_mirror = instance_place(x, y, ob_CrosswayCMirror)	
		
	if (!_turned) {		
		if (_rail_direction != noone and !_started) { //if not collided before
			_started = true
			_turn_timer()
			direction = _rail_direction.direction	
		}	
	
		if (_crossA != noone) {
			_turn_timer()
			var _train_coming_dir = point_direction(x, y, _crossA.x, _crossA.y)
		
			//our crossway A has a two turns
			var _first_turn = _crossA.turns[0]
			var _second_turn = _crossA.turns[1]
		
			var _point_correction = _calculate_point_correction(_first_turn)
		
			if (_train_coming_dir == _point_correction) { // --> train comes from first turn
				direction = _second_turn
			} else { // --> train comes from second turn
				direction = _first_turn
			}

			x = _crossA.x
			y = _crossA.y
		}
	
		if (_crossB != noone) {
			_turn_timer()
			var _train_coming_dir = point_direction(x, y, _crossB.x, _crossB.y)
		
			//our crossway B has a three turns
			var _first_turn = _crossB.turns[0]
			var _second_turn = _crossB.turns[1]
			var _third_turn = _crossB.turns[2]
		
			var _point_correction = _calculate_point_correction(_first_turn)
		
			if (_train_coming_dir == _point_correction) { // --> train comes from first turn
				direction = _second_turn
			} 
		
			// --> train comes from second turn
			if (_train_coming_dir == _point_correction + 90 or
				_train_coming_dir == _point_correction - 90 or
				_train_coming_dir == _point_correction + 270) 
			{ 
				if (_crossB.status == 0) {
					direction = _first_turn
				} else {
					direction = _third_turn
				}
			} 
			// --> train comes from third turn
			if (_train_coming_dir == _point_correction + 180 or
				_train_coming_dir + 360 == _point_correction + 180) 
			{
				direction = _second_turn
			} 

			//correct train's posititon
			x = _crossB.x
			y = _crossB.y
		} 
	
		if (_crossC != noone) {
			_turn_timer()
			var _train_coming_dir = point_direction(x, y, _crossC.x, _crossC.y)
		
			//our crossway B has a three turns
			var _first_turn = _crossC.turns[0]
			var _second_turn = _crossC.turns[1]
			var _third_turn = _crossC.turns[2]
		
			var _point_correction = _calculate_point_correction(_first_turn)
			
			if (_train_coming_dir == _point_correction) { // --> train comes from first turn
				if (_crossC.status == 0) {
					direction = _third_turn
				} else {
					direction = _second_turn
				}
			} 
		
			// --> train comes from second turn
			if (_train_coming_dir == _point_correction + 90 or
				_train_coming_dir == _point_correction - 90 or
				_train_coming_dir == _point_correction + 270) 
			{ 
				direction = _first_turn
			} 
		
			// --> train comes from third turn
			if (_train_coming_dir == _point_correction + 180 or
				_train_coming_dir + 360 == _point_correction + 180) 
			{
				direction = _first_turn
			} 

			//correct train's posititon
			x = _crossC.x
			y = _crossC.y
		} 
	
		if (_crossC_mirror != noone) {
			_turn_timer()
			var _train_coming_dir = point_direction(x, y, _crossC_mirror.x, _crossC_mirror.y)
		
			//our crossway B has a three turns
			var _first_turn = _crossC_mirror.turns[0]
			var _second_turn = _crossC_mirror.turns[1]
			var _third_turn = _crossC_mirror.turns[2]
		
			var _point_correction = _calculate_point_correction(_first_turn)
		
			if (_train_coming_dir == _point_correction) { // --> train comes from first turn
				direction = abs(_third_turn)
			} 
		
			// --> train comes from second turn
			if (_train_coming_dir == _point_correction + 90 or
				_train_coming_dir == _point_correction - 90 or
				_train_coming_dir == _point_correction + 270) 
			{ 
				direction = _third_turn
			} 
		
			// --> train comes from third turn
			if (_train_coming_dir == _point_correction + 180 or
				_train_coming_dir + 360 == _point_correction + 180) 
			{
				if (_crossC_mirror.status == 0) {
					direction = _first_turn
				} else {
					direction = _second_turn
				}
			} 

			//correct train's posititon
			x = _crossC_mirror.x
			y = _crossC_mirror.y
		}
	}
}


/// @function           _turn_timer()	
/// @description        Starts turning refresh timer. Void.
function _turn_timer() {
	//prevent double turning
	_turned = true
	alarm[0] = 5
}


/// @function           _calculate_point_correction(turn)	
/// @description        Calculates point correction for railway. Returns correction
function _calculate_point_correction(turn) {
	var _point_correction = 0
	
	// we need to introduct correction according to specific work of point_direction() func
	// _point_correction -> _first_turn + 180 degrees
	switch (turn) {
		case 0:
			_point_correction = 180
			break
		case 90:
			_point_correction = 270
			break
		case 180:
			_point_correction = 0
			break
		case 270:
			_point_correction = 90
			break
	}
	
	return _point_correction
}


/// @function           _collision_handler()	
/// @description        Checks for all probably collisions. Void.
function _collision_handler() {	
	//if colliding another train
	if (direction == 0 || direction == 180)
		var _collide = collision_rectangle(x-30, y-22, x+30, y+22, ob_Train, true, true);
	else
		var _collide = collision_rectangle(x-22, y-30, x+22, y+30, ob_Train, true, true);
		
	if (_collide != self and _collide != noone) {
		audio_play_sound(sn_trainCrash, 1, false);
		GAME_CONTROLLER.game_over("collide")
	}
	
	//if reaching station
	_collide = instance_place(x, y, ob_Station) 
	if (_collide != noone) {
		_reach_station(_collide)
	}
	
	//if reaching outline
	var _collide = instance_place(x, y, ob_TrainOutline)
	if (_collide != noone) {
		instance_destroy(self)
	}
	
	//if leaving room
	if (x <= 0 or x >= room_width or y <= 0 or y >= room_height) {
		instance_destroy(self)	
	}		
}


/// @function           _reach_station(station)	
/// @description        Enging task and destroy train. Void.
function _reach_station(station) {	
	if (station.instance_type == target_station_type) {
		TASK_CONTROLLER.end_task(task_number, true)
	} else {
		TASK_CONTROLLER.end_task(task_number, false)
	}
	instance_destroy(self)
}


///

