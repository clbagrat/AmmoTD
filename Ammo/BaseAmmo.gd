extends Node2D

class_name BaseAmmo

export(GlobalConfig.AmmoTypes) var type;


func get_ammo_type() -> int:
	return type;
