extends Node

class_name Draggable

export var body_to_drag := NodePath()

onready var body: Node2D = get_node(body_to_drag);
onready var timer: Timer = $Timer;

var current_handler: Node = null;

func set_handler(handler) -> void:
	current_handler = handler

func move_body(handler, newPos: Vector2) -> void:
	if handler != current_handler:
		return;
	body.global_position = newPos;
	timer.stop()
	timer.start()


func _on_Timer_timeout():
	body.queue_free()

