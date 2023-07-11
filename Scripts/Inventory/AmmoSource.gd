extends Node2D

class_name AmmoSource

@export var activeByDefault = true;
@export var arcCurve: Curve;
@export var maxHeight: float;
@export var speed: float;

@onready var timer: Timer = $Cooldown;
@onready var dropArea: Node2D = $DropAreaRect;
@onready var _old_wait_time = timer.wait_time;

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
	get_tree().get_root().add_child(ammo);
	ammo.global_position = global_position;
	var arcMovement: ArcMovement =  ammo.get_node("ArcMovement")
	arcMovement.start(
		global_position, 
		_get_random_drop_position(), 
		arcCurve,
		maxHeight,
		speed,
		func(): on_ammo_stop(ammo),
	);

func on_ammo_stop(ammo: Node2D):
	ammo.get_node("Draggable").enable()
	pass;

func _get_random_drop_position() -> Vector2:
	var gridCoord = GridUtils.get_grid_coords(dropArea.global_position);
	return GridUtils.get_random_point(gridCoord, 2)


func turn_on():
	timer.start();

func turn_off():
	timer.stop();

func increase_speed(delimeter: int):
	timer.set_wait_time(_old_wait_time / delimeter)

func reset_speed():
	timer.set_wait_time(_old_wait_time)
