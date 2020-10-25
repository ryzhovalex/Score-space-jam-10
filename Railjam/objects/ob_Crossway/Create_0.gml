/// @description <-->

direction = image_angle

//turns for each crossway's input - on clock's moving from twelfth hour
//turns -> [first_input, second_input, third input,  ...]
turns = [direction, direction - 90, direction - 180]


/// @function				change_status()
/// @description			Changing crossway's status. Void.
function change_status() {
	if (status == 0) {
		status = 1
	} else {
		status = 0
	}
}