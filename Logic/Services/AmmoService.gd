extends Node;

var dict = {
	GlobalConfig.AmmoTypes.Common: preload("res://Ammo/Variations/Common/Common.tscn").instance(),
	GlobalConfig.AmmoTypes.Gold: preload("res://Ammo/Variations/Gold/Gold.tscn").instance()
}

func create_projectile(type: int) -> Node2D:
	assert(dict[type], "There is no config set");
	return dict[type].get_projectile_representation().instance();

func create_raw(type: int) -> Node2D:
	assert(dict[type], "There is no config set");
	return dict[type].get_raw_representation().instance();
	
func create_bomb(type: int) -> Node2D:
	assert(dict[type], "There is no config set");
	return dict[type].get_bomb_representation().instance();
	
