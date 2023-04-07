extends BaseShooter


func shoot_creature(ammoType: int, creatureToFollow: AliveCreature):
	var bullet: Bullet = AmmoService.create_bullet(ammoType);
	bullet.position = self.position;
	bullet.set_target(creatureToFollow);
	get_parent().add_child(bullet);
	
func shoot_in_direction(_ammoType, _direction):
	print("NOT IMPLEMENTED YET")

func shoot_in_position(_ammoType, _direction):
	print("NOT IMPLEMENTED YET")
