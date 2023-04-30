extends Node2D

@export var TowersToPlace: Array[PackedScene];
@export var TowerAmount: int;

var spots: Array[Node2D] = []
func _ready():
	for node in get_children():
		spots.append(node as Node2D);
	assert(TowerAmount <= spots.size());
	_place_towers();

func _place_towers():
	spots.shuffle();
	for i in range(TowerAmount):
		var packedScene: PackedScene = TowersToPlace.pick_random()
		var instance: BaseBuilding = packedScene.instantiate();

		instance.set_initial_rotation(spots[i].rotation)
		instance.global_position = spots[i].global_position
		add_child(instance)
