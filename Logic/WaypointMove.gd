extends Node2D

@onready var path_follow = get_parent();

@export var speed = 10;
func _process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta);
