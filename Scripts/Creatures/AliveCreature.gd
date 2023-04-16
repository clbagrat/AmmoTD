extends Node2D

class_name AliveCreature

@export var health = 100;

signal died(aliveCreature);

@onready var health_bar = $ProgressBar;
@onready var current_health = health;
@onready var buff_container: BuffContainer = $BuffContainer;

func _ready():
	health_bar.value = 100;

func apply_damage(amount, buff: BuffObject = null):
	current_health -= amount
	if (current_health <= 0):
		die()
	else:
		health_bar.value = (float(current_health) / health) * 100
	
	if (buff != null):
		buff_container.apply_buff(buff);

func die():
	emit_signal("died", self)
	get_parent().queue_free()

func destroy():
	get_parent().queue_free()
