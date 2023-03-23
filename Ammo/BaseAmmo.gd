extends Node2D

class_name BaseAmmo

@export var type: GlobalConfig.AmmoTypes


func get_ammo_type() -> int:
	return type;
