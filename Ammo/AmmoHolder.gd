extends Node

class_name AmmoHolder

export var activeByDefault = true;

var inventory: Inventory;

onready var timer = $Cooldown;

var activeAmmo = [];


func _ready():
	print(get_parent())
	assert(get_parent() is Inventory, "Ammo holder should be direct child of inventory")
	inventory = get_parent();

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
	if (inventory.can_receive(1) && activeAmmo.size() > 0): 
		activeAmmo.back().queue_free();
		inventory.receive(1)

func turn_on():
	timer.start();

func turn_off():
	timer.stop();
	
