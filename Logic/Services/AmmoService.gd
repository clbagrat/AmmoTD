extends Node;

var dict = {
	GlobalConfig.AmmoTypes.Common: preload("res://Ammo/Variations/Common/Common.tscn").instantiate(),
	GlobalConfig.AmmoTypes.Gold: preload("res://Ammo/Variations/Gold/Gold.tscn").instantiate()
}

func create_projectile(type: int) -> Node2D:
	assert(dict[type]) ;#,"There is no config set")
	return dict[type].get_projectile_representation().instantiate();

func create_raw(type: int) -> Node2D:
	assert(dict[type]) ;#,"There is no config set")
	return dict[type].get_raw_representation().instantiate();
	
func create_bomb(type: int) -> Node2D:
	assert(dict[type]) ;#,"There is no config set")
	return dict[type].get_bomb_representation().instantiate();
	
