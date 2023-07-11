extends BaseAmmo

class_name BaseBomb

@export var speed = 15;

@export var maxHeight = 10;

@export var explosionPrefab: PackedScene; 

@export var arcMovement: ArcMovement;

@onready var projectile: Sprite2D = $Projectile;


var target_position = Vector2(100, 100);
@onready var _start_position = global_position;


func _physics_process(_delta):
	if (global_position.distance_to(target_position) < 0.5):
		var inst: Explosion = explosionPrefab.instantiate();
		inst.configure_explosion(_res);
		get_parent().add_child(inst);
		inst.global_position = global_position
		queue_free();

func on_res_applied(res: AmmoResource):
	projectile.texture = res.bombSprite;
	

func set_target_position(target: Vector2):
	_start_position = global_position
	target_position = target;
	arcMovement.start(_start_position, target);


