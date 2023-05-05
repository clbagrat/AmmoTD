extends Node;

var _current_coords: Vector2 = Vector2.ZERO;
var _handling_joypad: bool = false;
var _direction: Vector2 = Vector2.ZERO
var SPEED = 100 

func get_coordinates() -> Vector2:
	return _current_coords

func _process(delta) -> void:
	if (!_handling_joypad): return;
	
	var dir = Vector2.ZERO

	if (abs(_direction.x) > 0.1):
		dir.x = _direction.x
	if (abs(_direction.y) > 0.1):
		dir.y = _direction.y

	var move: Vector2 = dir * SPEED * delta;
	_current_coords += move

func _unhandled_input(event) -> void:
	if (event is InputEventMouseMotion):
		var mouseEvent: InputEventMouseMotion = event;
		_current_coords = mouseEvent.position;
		_handling_joypad = false
	
	if (event is InputEventJoypadMotion):
		var joypadEvent: InputEventJoypadMotion = event;
		if (joypadEvent.axis == 0):
			_direction.x = joypadEvent.axis_value
		if (joypadEvent.axis == 1):
			_direction.y = joypadEvent.axis_value
		_handling_joypad = true

