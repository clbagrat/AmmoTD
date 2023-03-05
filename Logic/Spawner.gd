extends Node


export var cooldown = 1.5;

const Skeleton = preload("res://Skeleton/Skeleton.tscn")
const PathFollower = preload("res://Logic/PathFollower.tscn")

func _ready():
	pass # Replace with function body.

var time_passed = cooldown;
func _process(delta):
	time_passed += delta;
	if (time_passed > cooldown):
		var newSkeleton = Skeleton.instance();
		var newPathFollower = PathFollower.instance();
		newPathFollower.add_child(newSkeleton);
		get_node("Path/Path2D").add_child(newPathFollower);
		time_passed = 0
	


