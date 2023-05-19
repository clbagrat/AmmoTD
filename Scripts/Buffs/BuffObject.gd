extends Node2D

class_name BuffObject;

@export var buffName: String
@export var duration: int;

func start(_creature: AliveCreature, _container: BuffContainer) -> void:
	pass;

func stop(_creature: AliveCreature, _container: BuffContainer) -> void:
	pass;
