extends Node2D

class_name AmmoSource

@export var activeByDefault = true;

@onready var timer = $Cooldown;

var inventory: Inventory;

func _ready():
	assert(get_parent() is Inventory) #,"Ammo holder should be direct child of inventory")
	inventory = get_parent();
	if (activeByDefault):
		turn_on()

func _on_Timer_timeout():
	if (!inventory.can_spend(1)):
		return;
	var ammoType = inventory.spend(1)

	var ammo = AmmoService.create_raw(ammoType);
	get_tree().get_root().get_node("World").add_child(ammo);
	var ammoPos = Vector2(randf_range(1, 3), randf_range(1, 5));
	ammoPos += ammoPos.normalized() * 8 + ammoPos
	ammo.global_position = self.global_position + ammoPos;


func turn_on():
	timer.start();

func turn_off():
	timer.stop();
