extends Node2D

class_name AmmoSource

const Ammo = preload("res://Ammo/Ammo.tscn");

export var activeByDefault = true;

onready var timer = $Cooldown;

var inventory: Inventory;

func _ready():
	assert(get_parent() is Inventory, "Ammo holder should be direct child of inventory")
	inventory = get_parent();
	if (activeByDefault):
		turn_on()

func _on_Timer_timeout():
	print("asdasd", inventory.can_spend(1))
	if (!inventory.can_spend(1)):
		return;

	var ammo = Ammo.instance()
	get_tree().get_root().add_child(ammo);
	var ammoPos = Vector2(rand_range(1, 3), rand_range(1, 5));
	ammoPos += ammoPos.normalized() * 8 + ammoPos
	ammo.global_position = self.global_position + ammoPos;
	inventory.spend(1)


func turn_on():
	timer.start();

func turn_off():
	timer.stop();
