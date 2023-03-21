extends Node2D

class_name AmmoHolder

export var activeByDefault = true;
export var showShape = false
export var pickupTime = 0.3

var inventory: Inventory;

onready var collisionShape = $Area2D/CollisionShape2D
onready var isActive = activeByDefault;

var activeAmmo = [];
var currentTime = 0;

func _ready():
	assert(get_parent() is Inventory, "Ammo holder should be direct child of inventory")
	inventory = get_parent();

func _on_Area2D_body_entered(body:Node):
	if (body.is_in_group("ammo")):
		activeAmmo.push_front(body);

func _on_LetGoArea_body_exited(body:Node):
	if (body.is_in_group("ammo")):
		var index = activeAmmo.find(body);
		if (index >= 0):
			activeAmmo.remove(index);
			var pullable: Pullable = body.get_node("Pullable");
			pullable.stopPull(self);


func _physics_process(delta):
	currentTime += delta;

	if (!isActive):
		return;

	for index in range(activeAmmo.size()):
		var ammo = activeAmmo[index]
		if (!is_instance_valid(ammo)):
			continue;
		var type = ammo.get_ammo_type();
		if (!inventory.can_receive(1, type)):
			continue;

		var pullable: Pullable = ammo.get_node("Pullable");
		if (pullable.isPullInProgress()):
			if (pullable.getTimeBeingPulled() > pickupTime):
				if inventory.can_receive(1, type):
					inventory.receive(1, type);
				activeAmmo[index].queue_free();
			continue;
		else:
			pullable.startPull(self);
			

func _draw():
	if !showShape:
		return
	draw_rect(Rect2(collisionShape.position - collisionShape.shape.extents, collisionShape.shape.extents * 2), Color(255, 255, 255, 0.5), true)

func turn_on():
	isActive = true;
	for body in activeAmmo:
		if !is_instance_valid(body):
			continue
		var pullable: Pullable = body.get_node("Pullable");
		pullable.startPull(self)
		

func turn_off():
	isActive = false;



