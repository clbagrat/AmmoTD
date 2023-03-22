extends BaseAmmo

class_name BaseBomb

export var speed = 15;

export var maxHeight = 10;

onready var projectile: Node2D = $Projectile;

var explosionPrefab = preload("res://Ammo/Variations/Base/Explosion.tscn")

var target_position = Vector2(100, 100);
onready var _start_position = global_position;


func _physics_process(delta):
	if !target_position:
		return;
	global_position = global_position + global_position.direction_to(target_position) * speed * delta;

	var total = _start_position.distance_to(target_position)
	var current = total - global_position.distance_to(target_position)

	var newHeight = maxHeight * (1-pow(1-2*(current/total), 2))

	projectile.position = Vector2(0, -newHeight)

	if (global_position.distance_to(target_position) < 0.3):
		var inst = explosionPrefab.instance();
		get_parent().add_child(inst);
		inst.global_position = global_position
		queue_free();



func set_position(target: Vector2):
	_start_position = global_position
	target_position = target;

