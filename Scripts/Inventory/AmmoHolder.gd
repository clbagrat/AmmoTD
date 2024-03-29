extends Node2D

class_name AmmoHolder

@export var activeByDefault = true;
@export var showShape = false
@export var pickupTime = 0.3
@export var canPickOnlyStaleAmmo = false;
@export var ignoreAmmoProducedBy: AmmoSource;
@export var useAnimation: bool = false;
@export var arcCurve: Curve;

var inventory: Inventory;

@onready var collisionShape = $Area2D/CollisionShape2D
@onready var isActive = activeByDefault;

var activeAmmo:Array[BaseAmmo] = [];
var currentTime = 0;

func _ready():
	assert(get_parent() is Inventory) #,"Ammo holder should be direct child of inventory")
	inventory = get_parent();

func _on_Area2D_body_entered(body:Node2D):
	if (body.is_in_group("ammo")):
		activeAmmo.push_front(body);

func _on_LetGoArea_body_exited(body:Node2D):
	if (body.is_in_group("ammo")):
		var index = activeAmmo.find(body);
		if (index >= 0):
			activeAmmo.remove_at(index);
			var pullable: Pullable = body.get_node("Pullable");
			pullable.stopPull(self);


func _physics_process(delta):
	currentTime += delta;

	if (!isActive):
		return;

	for index in range(activeAmmo.size()):
		if !is_instance_valid(activeAmmo[index]):
			continue;
		var ammo = activeAmmo[index]
		var type = ammo.get_ammo_type();
		var pullable: Pullable = ammo.get_node("Pullable");

		if (!inventory.can_receive(1, type)):
			pullable.stopPull(self);
			continue;

		if (canPickOnlyStaleAmmo && !ammo.is_stale()):
			pullable.stopPull(self);
			continue
		
		if (ignoreAmmoProducedBy && ignoreAmmoProducedBy == ammo.producedBy):
			pullable.stopPull(self);
			continue


		if (pullable.isPullInProgress()):
			if (pullable.getTimeBeingPulled() > pickupTime):
				if inventory.can_receive(1, type):
					receive_ammo(ammo)
			continue;
		else:
			pullable.startPull(self);
			

func receive_ammo(ammo: BaseAmmo):
	if (useAnimation):
		var arcMovement: ArcMovement =  ammo.get_node("ArcMovement")
		ammo.get_node("Draggable").disable()
		arcMovement.start(
			ammo.global_position,
			global_position, 
			arcCurve,
			5,
			60,
			func(): _r_ammo(ammo),
		);
		pass
	else:
		_r_ammo(ammo);

func _r_ammo(ammo: BaseAmmo):
	var type = ammo.get_ammo_type();
	if inventory.can_receive(1, type):
		inventory.receive(1, type);
	ammo.queue_free();
func _draw():
	if !showShape:
		return
	draw_rect(Rect2(collisionShape.position - collisionShape.shape.size/2, collisionShape.shape.size), Color(255, 255, 255, 0.5), true)

func turn_on():
	print('here')
	isActive = true;
	for body in activeAmmo:
		if !is_instance_valid(body):
			continue
		var pullable: Pullable = body.get_node("Pullable");
		pullable.startPull(self)
		

func turn_off():
	print('off')
	isActive = false;



