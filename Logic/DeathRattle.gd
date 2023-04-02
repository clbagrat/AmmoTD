extends Node2D

class_name DeathRattle

@export var AliveCreature := NodePath()

@onready var aliveCreature: AliveCreature = get_node(AliveCreature);

func _ready():
	var _connection = aliveCreature.connect("died",Callable(self,"_onDied"));

func _onDied(_creature: AliveCreature):
	pass;
