/// @description <-->

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