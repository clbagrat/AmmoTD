extends BaseTowerBehaviour

func _process(_delta):
	if (inventory.can_spend(1) && cooldown.has_passed() && detector.get_best_target()):
		var spendAmmoType = inventory.spend(1);
		var target = detector.get_best_target();
		shooter.shoot_in_position(spendAmmoType, target.get_parent().global_position);
		cooldown.start_cooldown();
