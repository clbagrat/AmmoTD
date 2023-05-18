extends Node2D;

@export var IS_POLYGON: bool;

func _enter_tree():
	SceneConfig.is_polygon = IS_POLYGON;

