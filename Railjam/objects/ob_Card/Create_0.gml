/// @description <-->

depth = -1

background = instance_create_depth(x, y, 1, ob_CardBack)

task_number = 0
container_position = 0

//contents
title = ""
start_point = ""
end_point = 0 // 0 == circle, 1 == square
score_value = ""

_start_wrapper = "Road "
_end_wrapper = "St. "
_separator = "-->"

/// @function           set_style()
/// @description        Setting style. Void.
function set_style() {
	//sizes
	self_width = CARDS_CONTAINER.card_width
	self_height = CARDS_CONTAINER.card_height
	_margin_top = 6
	_margin_left = 6
	_margin_bot = 25
	_line_space = 35
	_separator_padding_leftright = 70
	_figure_size = 10

	//coords
	_title_pos = [x + self_width / 2 - _margin_left * 6, y + _margin_top]

	_start_point_pos = [x + _margin_left, _title_pos[1] + _line_space]

	_separator_pos = [_start_point_pos[0] + _separator_padding_leftright, _title_pos[1] + _line_space]
						
	_end_point_pos = [_separator_pos[0] + _separator_padding_leftright / 2, _title_pos[1] + _line_space]

	_score_value_pos = [x + _margin_left, y + self_height - _margin_bot]

	_figure_x = _end_point_pos[0] + 40

	_figure_y = _end_point_pos[1] + _figure_size / 2

	_square_pos_correction = 7
}


/// @function           _draw_init()
/// @description        Drawing self as a card. Void.
function _draw_init() {
	draw_set_font(fo_card_content)
	
	draw_set_color(c_red)
	draw_text(_title_pos[0], _title_pos[1], title)
	
	draw_set_color(c_white)
	draw_text(_start_point_pos[0], _start_point_pos[1], _start_wrapper)
	draw_text(_start_point_pos[0] + 55, _start_point_pos[1], start_point)
	draw_text(_separator_pos[0], _separator_pos[1], _separator)	
	draw_text(_end_point_pos[0], _end_point_pos[1], _end_wrapper)
	
	if (end_point == 0) {
		draw_set_color(c_green)
		draw_circle(_figure_x, _figure_y, _figure_size, false)
	} else {
		draw_set_color(c_yellow)
		draw_rectangle	(
						_figure_x - _square_pos_correction, 
						_figure_y - _square_pos_correction, 
						_figure_x + _figure_size * 1.4 - _square_pos_correction, 
						_figure_y + _figure_size * 1.4 - _square_pos_correction, false
						)   	
	}
	
	draw_set_color(c_white)
	draw_text(_score_value_pos[0], _score_value_pos[1], score_value)	
}


///
set_style()








