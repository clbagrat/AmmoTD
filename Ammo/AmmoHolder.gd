extends Node2D

class_name AmmoHolder

export var activeByDefault = true;
export var showShape = false

var inventory: Inventory;

onready var timer = $Cooldown;
onready var collisionShape = $Area2D/CollisionShape2D

var activeAmmo = [];


func _ready():
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
	if (activeAmmo.size() > 0): 
		var type = activeAmmo.back().get_ammo_type();
		if inventory.can_receive(1, type):
			activeAmmo.back().queue_free();
			inventory.receive(1, type);

func _draw():
	if !showShape:
		return
	draw_rect(Rect2(collisionShape.position - collisionShape.shape.extents, collisionShape.shape.extents * 2), Color(255, 255, 255, 0.5), true)

func turn_on():
	timer.start();

func turn_off():
	timer.stop();
	
