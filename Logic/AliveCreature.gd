extends Node

class_name AliveCreature

@export var health = 100;

signal died(aliveCreature);

@onready var health_bar = $ProgressBar;
@onready var current_health = health;

func _ready():
	health_bar.value = 100;

func apply_damage(amount):
	current_health -= amount
	if (current_health <= 0):
		die()
	else:
		health_bar.value = (float(current_health) / health) * 100

func die():
	emit_signal("died", self)
	get_parent().queue_free()

