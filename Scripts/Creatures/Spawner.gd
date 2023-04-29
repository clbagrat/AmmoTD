extends Node


@export var cooldown = 1.5;
@export var batchSize = 3;
@export var inBatchCooldown = 0.5;

const Skeleton = preload("res://Scenes/Creatures/Skeleton.tscn")
const PathFollower = preload("res://Scenes/Creatures/Utils/PathFollower.tscn")

func _ready():
	pass # Replace with function body.

var time_passed = cooldown;
var in_batch_time_passed = inBatchCooldown;
var created_in_batch = 0;

func _process(delta):
	time_passed += delta;
	in_batch_time_passed += delta
	if (time_passed > cooldown):
		if (created_in_batch < batchSize):
			if (in_batch_time_passed > inBatchCooldown):
				var newSkeleton = Skeleton.instantiate();
				var newPathFollower = PathFollower.instantiate();
				newPathFollower.add_child(newSkeleton);
				get_node("Path3D/Path2D").add_child(newPathFollower);
				in_batch_time_passed = 0
				created_in_batch += 1
		else:
			time_passed = 0
			created_in_batch = 0
	


