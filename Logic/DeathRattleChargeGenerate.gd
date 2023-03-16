extends DeathRattle;

export(GlobalConfig.AmmoTypes) var type;
export var amount = 1

func _onDied(_creature: AliveCreature): 
	var finalAmount = rand_range(0, amount);
	for n in finalAmount:
		var charge = AmmoService.create_raw(type)
		get_tree().get_root().get_node("World").call_deferred("add_child", charge);
		charge.global_position = global_position + Vector2(rand_range(-4, 4), rand_range(-4, 4));



