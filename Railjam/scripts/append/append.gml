/// @function					append(array, value)
/// @param {array}	array		Array where need to append
/// @param {real}	value		Value to append
/// @description				Append value to the end of the given array. Returns array.
function append(array, value) {
	array[array_length(array)] = value
	return array
}