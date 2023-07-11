extends Node

class_name Draggable

@export var body_to_drag := NodePath()

@onready var body: BaseAmmo = get_node(body_to_drag);
@onready var timer: Timer = $Timer;

var isEnabled = false;
var current_handler: Node = null;

func enable():
	isEnabled = true;

func disable():
	isEnabled = false;

func is_being_dragged() -> bool:
	return current_handler != null

func set_handler(handler) -> void:
	if !isEnabled: return;
	current_handler = handler

func unset_handler(handler) -> void:
	if !isEnabled: return;
	if (handler != current_handler):
		return;
	current_handler = null

func move_body(handler, newPos: Vector2) -> void:
	if !isEnabled: return;
	if handler != current_handler:
		return;
	body.global_position = newPos;
	timer.stop()
	timer.start()


func _on_Timer_timeout():
	body.queue_free()

