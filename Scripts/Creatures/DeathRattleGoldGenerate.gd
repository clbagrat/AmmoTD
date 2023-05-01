extends DeathRattle;


func _onDied(creature: AliveCreature): 
	var finalAmount = EconomyService.get_bounty(creature);
	for n in finalAmount:
		var charge = AmmoService.create_raw(GlobalConfig.AmmoTypes.Gold)
		get_tree().get_root().get_node("World").call_deferred("add_child", charge);
		charge.global_position = global_position + Vector2(randf_range(-4, 4), randf_range(-4, 4));

