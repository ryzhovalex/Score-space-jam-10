/// @description <-->

key = string(logic_number)

_pressed = false


/// @function				_click_handler()
/// @description			Call button handler and change press status. Void.
function _click_handler() {
	GAME_CONTROLLER.button_handler(logic_number)
	_change_press_status()
}


/// @function				_change_press_status()
/// @description			Changing press status to opposite. Void.
function _change_press_status() {
	if (!_pressed) {
		_pressed = true
	} else {
		_pressed = false
	}
}


/// @function				_change_sprite()
/// @description			Changing sprite index of button according to status. Void.
function _change_sprite() {
	if (!_pressed) {
		sprite_index = sp_LogicButton
	} else {
		sprite_index = sp_LogicButtonActive
	}
}


