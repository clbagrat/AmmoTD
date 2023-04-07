extends BaseTowerBehaviour

func _process(_delta):
	if (inventory.can_spend(1) && cooldown.has_passed() && detector.get_best_target()):
		var spentAmmoType = inventory.spend(1);
		shooter.shoot_creature(spentAmmoType, detector.get_best_target());
		cooldown.start_cooldown()
