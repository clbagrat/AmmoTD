extends Node2D

class_name BaseTowerBehaviour

@export var ShooterPath := NodePath()
@export var InventoryPath := NodePath();
@export var DetectorPath := NodePath();
@export var CooldownPath := NodePath();

@onready var shooter: BaseShooter = get_node(ShooterPath);
@onready var inventory: Inventory = get_node(InventoryPath);
@onready var detector: BaseEnemyDetector = get_node(DetectorPath);
@onready var cooldown: BaseCooldown = get_node(CooldownPath);

func _ready():
	assert(shooter is BaseShooter) #,"provide proper shooter")
	assert(inventory is Inventory) #,"provide proper inventory")
	assert(detector is BaseEnemyDetector) #,"provide proper detector")
	assert(cooldown is BaseCooldown) #,"provide proper cooldown")

