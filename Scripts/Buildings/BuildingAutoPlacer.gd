extends Node2D

class_name BuildingAutoPlacer


@export var Limiter: Node2D;
@export var Amount: int;
@export var BuildingToPlace: PackedScene;
@export var raycast: RayCast2D;

var was = 0
@onready var left = Amount;

func _physics_process(_delta):
	was += 1
	if was < 3: return;
	if left == 0: return;
	var minimum = global_position;
	var maximum = Limiter.global_position;

	while(true) :
		var dot = Vector2(randi_range(minimum.x, maximum.x), randi_range(minimum.y, maximum.y));
		dot = GridUtils.snap_to_grid(dot)

		raycast.global_position = dot;
		raycast.target_position = Vector2(16, 1);
		raycast.hit_from_inside = true;
		raycast.force_update_transform();
		raycast.force_raycast_update();

		if raycast.is_colliding():
			print("123123")
			continue
		print(dot)
		left-=1;

		var instance: Node2D = BuildingToPlace.instantiate();
		add_child(instance)
		instance.global_position = dot;
		return;

