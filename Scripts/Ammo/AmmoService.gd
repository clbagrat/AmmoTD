extends Node;


var ammoDict = {
	GlobalConfig.AmmoTypes.Common: preload("res://Resources/Ammo/CommonAmmo.tres"),
	GlobalConfig.AmmoTypes.Gold: preload("res://Resources/Ammo/GoldAmmo.tres"),
	GlobalConfig.AmmoTypes.Poison: preload("res://Resources/Ammo/PoisonAmmo.tres")
}

var representationsDict = {
	GlobalConfig.AmmoRepresentations.Bullet: preload("res://Scenes/Ammo/Representations/BaseBullet.tscn"),
	GlobalConfig.AmmoRepresentations.Bomb: preload("res://Scenes/Ammo/Representations/BaseBomb.tscn"),
	GlobalConfig.AmmoRepresentations.Raw: preload("res://Scenes/Ammo/Representations/BaseRaw.tscn")
}

func _get_representation_instance(type: int) -> BaseAmmo:
	assert(representationsDict[type]) ;#,"There is no config set")
	var representation: PackedScene = representationsDict[type];
	print(representation)
	var instance: BaseAmmo = representation.instantiate();
	return instance

func create_representation(ammoType: int, representationType: int) -> Node2D:
	assert(ammoDict[ammoType]) ;#,"There is no config set")
	var instance = _get_representation_instance(representationType);	
	instance.apply_resource(ammoDict[ammoType])
	return instance

	

func create_raw(type: int) -> Node2D:
	print(type);
	return create_representation(type, GlobalConfig.AmmoRepresentations.Raw);

func create_bullet(type: int) -> Node2D:
	return create_representation(type, GlobalConfig.AmmoRepresentations.Bullet);
	
func create_bomb(type: int) -> Node2D:
	return create_representation(type, GlobalConfig.AmmoRepresentations.Bomb);
	
