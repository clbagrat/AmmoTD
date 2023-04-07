extends BaseAmmo

class_name Bullet;

@export var speed = 10;
@onready var sprite: Sprite2D = $Sprite2D;

signal target_reached(body)

var current_target: AliveCreature;

func set_target(target):
	current_target = target;

func on_res_applied(res: AmmoResource):
	print(res);
	sprite.texture = res.bulletSprite;

func _physics_process(delta):
	if (is_instance_valid(current_target)):
		global_position = global_position.direction_to(current_target.global_position) * speed * delta + global_position
	
	if (current_target && !is_instance_valid(current_target)):
		queue_free()


func _on_Area2D_body_entered(body:Node):
	if (body.is_in_group("enemy") && current_target == body.get_parent().get_node("AliveCreature")):
		var aliveCreature: AliveCreature = current_target;
		aliveCreature.apply_damage(bulletDamage)
		emit_signal("target_reached", body);
		queue_free()
