extends Node2D

class_name BuildingPlacer;

@export var CursorSprite: Sprite2D;
@export var ActiveBuildingSprite: Sprite2D;
@export var NoBuildAreaDetector: Area2D;

var isActive = false;
var canBuild = false;
var activeBuilding: BuildingResource;


func start_placing(res: BuildingResource):
	isActive = true;
	self.visible = true;
	activeBuilding = res;
	ActiveBuildingSprite.texture = res.sprite
	pass;

func stop_placing():
	isActive = false;
	self.visible = false;


func _unhandled_input(event: InputEvent):
	if !isActive:
		return

	if (event.is_action_pressed("building_destroy")):
		var allBuildings: Array[Node] = get_tree().get_nodes_in_group("building");
		for building in allBuildings:
			if ((building as Node2D).global_position.distance_to(CursorMovementService.get_current_position()) < 0.1 ):
				building.queue_free();


	if (event.is_action_pressed("building_rotate")):
		ActiveBuildingSprite.rotate(PI/2);


	if (event.is_action_pressed("building_accept")):
		if !canBuild:
			AlertService.alert("Can't build here");
			return

		if (EconomyService.can_spend(activeBuilding.price)):
			_actually_build();
			EconomyService.spend(activeBuilding.price);
		else:
			AlertService.alert("No money")
		
func _actually_build():
	var buildingInstance: Node2D = activeBuilding.scene.instantiate();
	buildingInstance.global_position = CursorMovementService.get_current_position();
	buildingInstance.set_rotation(ActiveBuildingSprite.get_rotation())
	get_tree().get_root().get_node("World").add_child(buildingInstance);

func _adjust_can_build_visual():
	if canBuild:
		CursorSprite.modulate = Color(0, 255, 0)
	else:
		CursorSprite.modulate = Color(255, 0, 0)

func _physics_process(_delta):
	if !isActive:
		return;

	var newCanBuild = !NoBuildAreaDetector.has_overlapping_bodies() && !NoBuildAreaDetector.has_overlapping_areas();
	if newCanBuild != canBuild:
		canBuild = newCanBuild;
		_adjust_can_build_visual();
