extends Node


@export var cooldown = 1.5;
@export var batchSize = 3;
@export var inBatchCooldown = 0.5;
@export var path: Path2D;

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
	if (time_passed > cooldown/VictoryService.currentLvl):
		if (created_in_batch < VictoryService.currentLvl):
			if (in_batch_time_passed > inBatchCooldown):
				var newSkeleton = Skeleton.instantiate();
				var newPathFollower = PathFollower.instantiate();
				newSkeleton.get_node("AliveCreature").level = VictoryService.currentLvl
				newSkeleton.get_node("AliveCreature").base_health = GameConstants.C.skeletonBaseHealth
				newPathFollower.add_child(newSkeleton);
				path.add_child(newPathFollower);
				in_batch_time_passed = 0
				created_in_batch += 1
		else:
			time_passed = 0
			created_in_batch = 0
	


