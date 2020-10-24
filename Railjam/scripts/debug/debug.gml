/// @function					debug(str, parameter)
/// @param {string}	message		String to debug message	
/// @param {real}	parameter	Value to debug message
/// @description				Shows informative debug message. Void.
function debug(str, parameter) {
	show_debug_message(str + ": " + string(parameter))
}