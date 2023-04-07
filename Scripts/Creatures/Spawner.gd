extends Node


@export var cooldown = 1.5;

const Skeleton = preload("res://Scenes/Creatures/Skeleton.tscn")
const PathFollower = preload("res://Scenes/Creatures/Utils/PathFollower.tscn")

func _ready():
	pass # Replace with function body.

var time_passed = cooldown;
func _process(delta):
	time_passed += delta;
	if (time_passed > cooldown):
		var newSkeleton = Skeleton.instantiate();
		var newPathFollower = PathFollower.instantiate();
		newPathFollower.add_child(newSkeleton);
		get_node("Path3D/Path2D").add_child(newPathFollower);
		time_passed = 0
	


