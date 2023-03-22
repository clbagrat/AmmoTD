extends Node

class_name AmmoMeta

export(GlobalConfig.AmmoTypes) var type;
export(PackedScene) var projectile;
export(PackedScene) var raw;
export(PackedScene) var bomb;

func get_type() -> int:
	return type;

func get_projectile_representation() -> PackedScene:
	return projectile

func get_raw_representation() -> PackedScene:
	return raw

func get_bomb_representation() -> PackedScene:
	return bomb;
