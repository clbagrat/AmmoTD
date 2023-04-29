extends Node2D

class_name LockableBuilding

@export var LockVisual: Sprite2D;
@export var UnlockedByDefault: bool;

var isLocked: bool;


func lock() -> void:
	LockVisual.visible = true
	isLocked = true;
	pass;

func unlock() -> void:
	LockVisual.visible = false
	isLocked = false;
	pass;
