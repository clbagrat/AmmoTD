extends Node2D

class_name AmmoSource

@export var activeByDefault = true;

@onready var timer: Timer = $Cooldown;
@onready var dropArea: Node2D = $DropAreaRect;

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

	var ammo = AmmoService.create_raw(ammoType, self);
	get_tree().get_root().get_node("World").add_child(ammo);

	var ammoPos = _get_random_drop_position();
	ammo.global_position = ammoPos;

func _get_random_drop_position() -> Vector2:
	var gridCoord = GridUtils.get_grid_coords(dropArea.global_position);
	return GridUtils.get_random_point(gridCoord)


func turn_on():
	timer.start();

func turn_off():
	timer.stop();
