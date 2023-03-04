extends Node2D


export var speed = 10;

signal target_reached(body)

var current_target;

func set_target(target):
	current_target = target;

func _physics_process(delta):
	if (is_instance_valid(current_target)):
		global_position = (current_target.global_position - global_position).normalized() * speed * delta + global_position


func _on_Area2D_body_entered(body:Node):
	emit_signal("target_reached", body);
	queue_free()
