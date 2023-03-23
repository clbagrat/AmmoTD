extends BaseShooter


func shoot_in_position(ammoType: int, position: Vector2):
	var bomb: BaseBomb  = AmmoService.create_bomb(ammoType);
	get_parent().add_child(bomb);
	bomb.global_position = self.global_position;
	bomb.set_target_position(position)

func shoot_in_direction(_ammoType, _direction):
	print("NOT IMPLEMENTED YET")

func shoot_creature(_ammoType, _direction):
	print("NOT IMPLEMENTED YET")
