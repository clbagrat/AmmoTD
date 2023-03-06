extends Node2D


const Ammo = preload("res://Ammo/Ammo.tscn");

export var activeByDefault = true;

onready var timer = $Cooldown;

signal ammo_create;

func _ready():
	if (activeByDefault):
		turn_on()

func _on_Timer_timeout():
	var ammo = Ammo.instance()
	get_tree().get_root().add_child(ammo);
	var ammoPos = Vector2(rand_range(-3, 3), rand_range(1, 5));
	ammoPos += ammoPos.normalized() * 8 + ammoPos
	ammo.global_position = self.global_position + ammoPos;
	emit_signal("ammo_create");


func turn_on():
	timer.start();

func turn_off():
	timer.stop();
