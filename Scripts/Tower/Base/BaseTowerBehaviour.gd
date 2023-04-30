extends BaseBuilding;

class_name BaseTowerBehaviour

@export var shooter: BaseShooter
@export var inventory: Inventory
@export var detector: BaseEnemyDetector
@export var cooldown: BaseCooldown


func set_initial_rotation(degree: float):
	inventory.set_rotation(degree)
