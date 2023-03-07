extends Node

class_name AmmoHolder

export var capacity = 30;
export var activeByDefault = true;

onready var timer = $Cooldown;

signal amount_change(amount);

var currentAmount: int = 0;

var activeAmmo = [];


func _ready():
	if (activeByDefault):
		turn_on()

func _on_Area2D_body_exited(body:Node):
	if (body.is_in_group("ammo")):
		var index = activeAmmo.find(body);
		if (index >= 0):
			activeAmmo.remove(index);


func _on_Area2D_body_entered(body:Node):
	if (body.is_in_group("ammo")):
		activeAmmo.push_back(body);

func _on_Cooldown_timeout():
	if (currentAmount < capacity && activeAmmo.size() > 0): 
		activeAmmo.back().queue_free();
		add(1)

func add(amount):
	currentAmount += amount;
	emit_signal("amount_change", currentAmount);

func remove(amount):
	currentAmount -= amount;
	emit_signal("amount_change", currentAmount);


func turn_on():
	timer.start();

func turn_off():
	timer.stop();
	
