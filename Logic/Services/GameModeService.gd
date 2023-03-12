extends Node

enum GAME_MODES {Play, Build}

signal gameModeChanged(GAME_MODES);

var _currentMode = GAME_MODES.Play

func _ready() -> void:
	self.set_pause_mode(PAUSE_MODE_PROCESS);

func _unhandled_input(event):
	if (event.is_action_pressed("building_mode")):
		_toggle_building_mode();

func _toggle_building_mode():
	if _currentMode == GAME_MODES.Play:
		_currentMode = GAME_MODES.Build
	else:
		_currentMode = GAME_MODES.Play
	emit_signal("gameModeChanged", _currentMode)

func get_mode():
	return _currentMode

func request_building_mode_toggle():
	if (_currentMode == GAME_MODES.Build):
		_toggle_building_mode()