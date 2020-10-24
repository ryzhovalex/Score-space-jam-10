/// @description <-->

/// @function           fullscreen_switch()
/// @param {real}  val  The value to calculate the square of	
/// @description        Changing fullscreen mode. Void.
function fullscreen_switch() {
	window_set_fullscreen(!window_get_fullscreen())
}
