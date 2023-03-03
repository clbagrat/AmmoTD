extends Node2D


export var health = 10
onready var prev_pos = global_position;
onready var animation_tree = $AnimationTree;

func play_run_animation ():
	var animation_direction =  global_position - prev_pos;
	animation_tree.set("parameters/Run/blend_position", animation_direction.normalized())
	prev_pos = global_position;

func _process(_delta):
	play_run_animation()

