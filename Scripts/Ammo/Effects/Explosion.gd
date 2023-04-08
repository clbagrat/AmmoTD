extends Node2D

class_name Explosion;

@export var time_to_explode = 0.1

var _time_passed = 0
var _damage = 0;
var _buffScene: PackedScene;

func _physics_process(delta):
	_time_passed += delta;
	if (_time_passed > time_to_explode):
		deal_damage();
		queue_free();

var aliveCreatures:Array[AliveCreature] = []


func configure_explosion(res: AmmoResource) -> void:
	var sp: Sprite2D = get_node("ExplosionSprite")
	var sp2: Sprite2D = get_node("ExplosionSprite2")
	sp.set_texture(res.explosionSprite);
	sp2.set_texture(res.explosionSprite);
	_damage = res.explosionDamage;
	_buffScene = res.buff;

func deal_damage():
	for creature in aliveCreatures:
		if (!is_instance_valid(creature)):
			continue;
		creature.apply_damage(_damage, _buffScene.instantiate());


func _on_Area2D_body_entered(body:Node2D):
	if (body.is_in_group("enemy")):
		var target_alive_creature = body.get_parent().get_node("AliveCreature");
		aliveCreatures.push_back(target_alive_creature)

