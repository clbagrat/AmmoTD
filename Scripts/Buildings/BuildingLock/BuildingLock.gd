extends Node2D

class_name BuildingLock;

@export var unlockedByDefault: bool;
@export var price: int;
@export var building: LockableBuilding;
@export var interractiveByCursor: InteractiveByCursor;

func _ready():
	interractiveByCursor.connect("on_interract", func (): try_to_unlock());

	if (unlockedByDefault):
		building.unlock()
	else:
		building.lock()

func try_to_unlock():
	if (EconomyService.can_spend(price)):
		EconomyService.spend(price)
		building.unlock()
	else:
		AlertService.alert("need " + str(price)) 

