extends Node2D

class_name BuildingSystem

@export var BuildingSelection: BuildingSelection;
@export var BuildingPlacer: BuildingPlacer;
@export var StartButton: BaseButton;
@export var StopButton: BaseButton;


var _isActive: bool = false;

func _ready():
	BuildingSelection.connect("selected", func(res): _on_selected(res));
	_stop_all()

func _unhandled_input(event: InputEvent):
	if (event.is_action_pressed("building_mode")):
		if _isActive:
			_stop_all();
		else:
			_on_start_building_pressed()

func _on_selected(res: BuildingResource): 
	BuildingSelection.stop_selecting();
	BuildingPlacer.start_placing(res);

func _stop_all():
	_isActive = false;
	BuildingSelection.stop_selecting()
	BuildingPlacer.stop_placing()
	StartButton.visible = true;
	StopButton.visible = false;
	
func _on_cancel_building_pressed():
	_stop_all();



func _on_start_building_pressed():
	_isActive = true;
	BuildingSelection.start_selecting()
	StartButton.visible = false;
	StopButton.visible = true;

