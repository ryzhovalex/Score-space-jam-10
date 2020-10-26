/// @description draw self

if (TIMER.timer_proceed) {
	_timer_seconds = TIMER.timer_seconds
	_minutes = round(_timer_seconds / 60)
	_seconds = round(_timer_seconds % 60)
	_minute_pref = ""
	_second_pref = ""

	if (string_length(string(_minutes)) == 1) {
		_minute_pref = "0" 
	}
	
	if (string_length(string(_seconds)) == 1) {
		_second_pref = "0" 
	}	
	
	_timer_parsed = _minute_pref + string(_minutes) + " : " + _second_pref + string(_seconds)

	draw_set_font(fo_timer)
	draw_set_color(c_green)
	draw_text(x, y, _timer_parsed)
}