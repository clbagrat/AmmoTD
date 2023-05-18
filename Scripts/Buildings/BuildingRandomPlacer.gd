extends Node2D

@export var BuildingsToPlace: Array[PackedScene];
@export var BuildingAmout: int;

var spots: Array[Node2D] = []
func _ready():
	for node in get_children():
		spots.append(node as Node2D);
	assert(BuildingAmout <= spots.size());
	_place_towers();

func _place_towers():
	spots.shuffle();
	for i in range(BuildingAmout):
		var packedScene: PackedScene = BuildingsToPlace.pick_random()
		var instance: BaseBuilding = packedScene.instantiate();

		instance.set_initial_rotation(spots[i].rotation)
		add_child(instance)
		instance.global_position = spots[i].global_position
