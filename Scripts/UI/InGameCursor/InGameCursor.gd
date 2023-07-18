extends Node2D

func _ready():
	var _subscription = GameModeService.connect("gameModeChanged",Callable(self,"_set_active"));


func _set_active(mode):
	self.visible = mode == GameModeService.GAME_MODES.Play;
