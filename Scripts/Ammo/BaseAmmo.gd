extends Node2D

class_name BaseAmmo

@export var type: GlobalConfig.AmmoTypes

var _res: AmmoResource;

func _ready():
	if _res:
		on_res_applied(_res);

func apply_resource(res: AmmoResource):
	_res = res;

func get_ammo_type() -> int:
	assert(_res != null); 
	return _res.type;

func on_res_applied(_ammoRes: AmmoResource) -> void:
	printerr("Method on_res_applied is not implemented")
	get_tree().quit();

var producedBy: Node2D;

var staleTime = 0.5;
var lastPosition: Vector2;
var lastMoveTime: float;
var currentTime: float;

func is_stale() -> bool:
	return currentTime - lastMoveTime > staleTime

func _process(delta) -> void:
	var pos = global_position;
	currentTime += delta;

	if pos != lastPosition:
		lastPosition = pos
		lastMoveTime = currentTime;
