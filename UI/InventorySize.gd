extends Label

export var InventoryPath := NodePath();

onready var inventory: Inventory = get_node(InventoryPath);

func _ready():
	_updateAmmoCount(inventory.get_current_amount())
	var _connection = inventory.connect("amount_change", self, "_updateAmmoCount");


func _updateAmmoCount(amount: int):
	visible = amount > 0
	text = str(amount);
