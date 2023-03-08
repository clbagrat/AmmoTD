extends Node2D

var isActive = false
var availableBuilding = []

onready var buildingUI = $BuildingUI;
onready var buildings = $Buildings;

func _unhandled_input(event):
	if (event.is_action_pressed("building_mode")):
		isActive = !isActive
		get_tree().paused = isActive;
		buildingUI.visible = isActive



func _ready():
	for node in buildings.get_children():
		if node is Building:
			availableBuilding.push_back(node)
	print(availableBuilding.size(), "asd");


func _physics_process(_delta):
	if !isActive:
		return;
