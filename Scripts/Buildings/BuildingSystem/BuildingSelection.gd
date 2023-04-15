extends Node2D

class_name BuildingSelection

signal selected(bRes: BuildingResource);

@export var BuildingButtonPrefab: PackedScene;

@export var AvailableBuildingsBlock: Control;

@export var AvailableBuildings: Array[BuildingResource];

func start_selecting():
	self.visible = true;
	AvailableBuildingsBlock.get_children()[0].grab_focus();

func stop_selecting():
	self.visible = false;

func _ready():
	_create_ui_elements();
	pass


func _create_ui_elements():
	for res in AvailableBuildings:
		var buttonInstance: BuildingButton = BuildingButtonPrefab.instantiate();
		var r: BuildingResource = res;
		print(r.name, buttonInstance)
		#buttonInstance.apply_resource(res)
		buttonInstance.apply_building_resource(res);
		buttonInstance.connect("pressed", func(): _on_building_select(res));
		AvailableBuildingsBlock.add_child(buttonInstance)


func _on_building_select(res: BuildingResource):
	emit_signal("selected", res)

