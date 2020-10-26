/// @description <-->

self_width = 192
self_height = 308

card_width = 192
card_height = 96

MAX_CARDS = 3 //number of card that container can contain

content_padding_bot = 6

cards = [] //cards inside the container
for (var i = 0; i < MAX_CARDS; i++) {
	array_set(cards, i, undefined)
}

_cards_pos = [
			[x, y], 
			[x, y + card_height + content_padding_bot],
			[x, y + card_height * 2 + content_padding_bot * 2]
			]

/// @function						add_card(title, start_point, end_point, score_value)
/// @param {str}  title				Name of task
/// @param {str}  start_point		Name of start point
/// @param {int}  end_point			Type of end point
/// @param {str}  score_value		Score value for task
/// @param {str}  task_number		Number of task
/// @description					Adding a new card to panel. Void.
function add_card(title, start_point, end_point, score_value) {
	for (var i = MAX_CARDS - 1; i >= 0; i--) {
		if (i == 0) {
			cards[0] = _create_card(title, start_point, end_point, score_value, i)
		} else {
			cards[i] = cards[i-1]
		}		
	}
}


/// @function						_create_card(title, start_point, end_point, score_value, position)
/// @description					Creating a new card. Returns card id.
function _create_card(title, start_point, end_point, score_value, position) {
	var _card = instance_create_depth(_cards_pos[position][0], _cards_pos[position][1], 0, ob_Card)
	
	_card.title				 = title
	_card.start_point		 = start_point
	_card.end_point          = end_point
	_card.score_value		 = score_value
	_card.container_position = position
	
	return _card
}


/// @function						delete_card(position)
/// @param {int}  position			Card position in the container - from top to bottom, starts from zero.
/// @description					Deleting a card from panel. Void.
function delete_card(position) {
	cards[position] = undefined
}


/// @function						_card_move()
/// @description					Moving cards to right places. Void.
function _card_move() {
	// move card if it not at proper place
	for (var i = 0; i < MAX_CARDS; i++) {
		if (cards[i] != undefined) { //if card exists, give it parameters
			cards[i].y = _cards_pos[i][1]
			cards[i].set_style() //will refresh draw coords for the card
			cards[i].container_position = i
		}
	}
}


/// @function						_array_clean()
/// @description					Cleaning the array from old cards. Void.
function _array_clean() {
	var _in_array = false

	for (var i = 0; i < instance_number(ob_Card); i++) {
		var _check_card = instance_find(ob_Card, i)
		_in_array = false
	
		for (var j = 0; j < MAX_CARDS; j++) {
			if (_check_card == cards[j]) {
				_in_array = true
				break
			}
		}
		
		if (!_in_array) {
			instance_destroy(_check_card)
		}
	}
}


/// @function						_array_sort()
/// @description					Make array sorted and cleaned. Void.
function _array_sort() {
	for (var i = MAX_CARDS - 1; i >= 0; i--) {
		if (cards[i] != undefined and  i - 1 >= 0) {
			if (cards[i-1] == undefined) {
				cards[i-1] = cards[i]
				cards[i] = undefined
			}
		}
	}
	_card_move()
	_array_clean()
}


