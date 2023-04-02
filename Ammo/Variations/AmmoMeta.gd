extends Node

class_name AmmoMeta

@export var type: GlobalConfig.AmmoTypes;
@export var projectile: PackedScene;
@export var raw: PackedScene;
@export var bomb: PackedScene;

func get_type() -> int:
	return type;

func get_projectile_representation() -> PackedScene:
	return projectile

func get_raw_representation() -> PackedScene:
	return raw

func get_bomb_representation() -> PackedScene:
	return bomb;
