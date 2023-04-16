extends Node2D

enum GAME_MODES {Play, Build}

signal gameModeChanged(GAME_MODES);

var _currentMode = GAME_MODES.Play

func _ready() -> void:
	self.set_process_mode(PROCESS_MODE_ALWAYS);

#func _unhandled_input(event: InputEvent):
#	if (event.is_action_pressed("building_mode")):
#		_toggle_building_mode();

func _toggle_building_mode():
	if _currentMode == GAME_MODES.Play:
		_currentMode = GAME_MODES.Build
	else:
		_currentMode = GAME_MODES.Play

	get_tree().paused = _currentMode == GAME_MODES.Build;
	PhysicsServer2D.set_active(true)

	emit_signal("gameModeChanged", _currentMode)

func get_mode():
	return _currentMode

func request_building_mode_toggle():
	if (_currentMode == GAME_MODES.Build):
		_toggle_building_mode()
