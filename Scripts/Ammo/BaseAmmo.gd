extends Node2D

class_name BaseAmmo

@export var type: GlobalConfig.AmmoTypes
@export var bulletDamage = 10;

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

