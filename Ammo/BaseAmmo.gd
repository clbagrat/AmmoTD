extends Node2D

class_name BaseAmmo

@export var type: GlobalConfig.AmmoTypes
@export var bulletDamage = 10;


func get_ammo_type() -> int:
	return type;
