extends BaseShooter


func _on_target_reached(body:Node):
	var aliveCreature: AliveCreature = body.get_parent().get_node("AliveCreature")

	aliveCreature.apply_damage(10)

func shoot_creature(ammoType: int, creatureToFollow: AliveCreature):
	var bullet = AmmoService.create_projectile(ammoType);
	bullet.position = self.position;
	bullet.set_target(creatureToFollow);
	bullet.connect("target_reached", self, "_on_target_reached");
	get_parent().add_child(bullet);
	
func shoot_in_direction(_ammoType, _direction):
	print("NOT IMPLEMENTED YET")

func shoot_in_position(_ammoType, _direction):
	print("NOT IMPLEMENTED YET")
