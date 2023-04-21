extends Node2D

class_name LockableBuilding

@export var LockVisual: Sprite2D;

func lock() -> void:
	LockVisual.visible = true
	pass;

func unlock() -> void:
	LockVisual.visible = false
	pass;
