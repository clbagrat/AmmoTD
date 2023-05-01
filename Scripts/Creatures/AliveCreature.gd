extends Node2D

class_name AliveCreature

@export var base_health = 100;
@export var mapId = 1;
@export var level = 1;

signal died(aliveCreature);

@onready var health_bar = $ProgressBar;
@onready var health = base_health * (GameConstants.C.perLevelHealthPercent * level)
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
	destroy()

func destroy():
	MonsterDeathService.register_death(self);
	get_parent().queue_free()
