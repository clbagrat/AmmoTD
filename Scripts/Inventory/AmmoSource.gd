extends Node2D

class_name AmmoSource

@export var activeByDefault = true;

@onready var timer: Timer = $Cooldown;
@onready var dropArea: ReferenceRect = $DropAreaRect;

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
	print(ammoType)

	var ammo = AmmoService.create_raw(ammoType);
	get_tree().get_root().get_node("World").add_child(ammo);

	var ammoPos = _get_random_drop_position();
	ammo.global_position = ammoPos;

func _get_random_drop_position() -> Vector2:
	var gp = dropArea.global_position;
	return Vector2(randf_range(gp.x, gp.x+dropArea.size.x), randf_range(gp.y, gp.y + dropArea.size.y))


func turn_on():
	timer.start();

func turn_off():
	timer.stop();
