extends Node2D

@export var BuildingUI: Node2D;
@export var BuildingPlacer: BuildingPlacer;

var availableBuildings: Array[BuildingResource] = [
	preload("res://Resources/Buildings/Belt.tres"),
	preload("res://Resources/Buildings/AmmoCollector.tres")
]

var isActive = false;

func _ready():
	var _subscription = GameModeService.connect("gameModeChanged",Callable(self,"_set_active"));
	_build_ui();
	pass

func _set_active(mode: GameModeService.GAME_MODES): 
	isActive = mode == GameModeService.GAME_MODES.Build;
	BuildingUI.visible = isActive;

func _build_ui():
	pass;



func _unhandled_input(event: InputEvent):
	if !isActive:
		return;
