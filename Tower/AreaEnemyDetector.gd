extends BaseEnemyDetector


var targets = [];

func get_targets():
	return targets;


func get_best_target():
	if (targets.size() == 0):
		return null
	return targets.front();


func _on_target_died(target_alive_creature):
		targets.remove(targets.find(target_alive_creature))


func _on_EnemyDetector_body_exited(body:Node):
	if(is_instance_valid(body) && body.is_in_group("enemy")):
		var target_alive_creature = body.get_parent().get_node("AliveCreature");
		target_alive_creature.disconnect("died", self, "_on_target_died");
		var index = targets.find(target_alive_creature);
		if (index >= 0):
			targets.remove(index)

func _on_EnemyDetector_body_entered(body:Node):
	if (body.is_in_group("enemy")):
		var target_alive_creature = body.get_parent().get_node("AliveCreature");
		targets.push_back(target_alive_creature)
		target_alive_creature.connect("died", self, "_on_target_died");

