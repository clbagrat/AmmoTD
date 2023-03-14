extends Node

class_name AmmoMeta

export(GlobalConfig.AmmoTypes) var type;
export(PackedScene) var projectile;
export(PackedScene) var raw;

func get_type() -> int:
	return type;

func get_projectile_representation() -> PackedScene:
	return projectile

func get_raw_representation() -> PackedScene:
	return raw
