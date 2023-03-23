extends Node2D

@export var damage = 10;
@export var time_to_explode = 0.1

var _time_passed = 0

func _physics_process(delta):
	_time_passed += delta;
	if (_time_passed > time_to_explode):
		deal_damage();
		queue_free();

var aliveCreatures = []



func deal_damage():
	for creature in aliveCreatures:
		if (!is_instance_valid(creature)):
			continue;
		creature.apply_damage(damage)


func _on_Area2D_body_entered(body:Node2D):
	if (body.is_in_group("enemy")):
		var target_alive_creature = body.get_parent().get_node("AliveCreature");
		aliveCreatures.push_back(target_alive_creature)

