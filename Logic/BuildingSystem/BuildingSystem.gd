extends Node2D

var isActive = false
var availableBuilding = []
var activeBuilding = null;

onready var buildingUI = $BuildingUI;
onready var buildings = $Buildings;

func _unhandled_input(event):
	if !isActive:
		return

	if (event.is_action_pressed("building_accept")):
		activeBuilding = null
	if (event.is_action_pressed("building_rotate")):
		activeBuilding.rotate(PI/2);
	if (event.is_action_pressed("building_destroy")):
		var allBuildings = get_tree().get_nodes_in_group("building");
		for building in allBuildings:
			if (building.global_position.distance_to(CursorMovementService.get_current_position()) < 0.1 ):
				building.queue_free();
		GameModeService.request_building_mode_toggle()
		

func _set_active(mode):
	isActive = mode == GameModeService.GAME_MODES.Build;
	get_tree().paused = isActive;
	buildingUI.visible = isActive
	if (activeBuilding):
		activeBuilding.queue_free();
		activeBuilding = null

func _ready():
	var _subscription = GameModeService.connect("gameModeChanged", self, "_set_active");
	for node in buildings.get_children():
		if node is Building:
			availableBuilding.push_back(node)



func _process(_delta):
	if !isActive:
		return;
	if !activeBuilding:
		activeBuilding =  availableBuilding.front().buildingScene.instance()
		get_parent().get_parent().add_child(activeBuilding);
	
	activeBuilding.global_position = CursorMovementService.get_current_position();
