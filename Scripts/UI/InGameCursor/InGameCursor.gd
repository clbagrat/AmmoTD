extends Node2D

@onready var AmmoCount = $AmmoCount;
@onready var inventory:Inventory = $Inventory;

func _ready():
	var _subscription = GameModeService.connect("gameModeChanged",Callable(self,"_set_active"));
	_updateAmmoCount(inventory.get_current_amount())


func _on_Inventory_amount_change(amount: int):
	_updateAmmoCount(amount)

func _updateAmmoCount(amount: int):
	AmmoCount.visible = amount > 0
	AmmoCount.text = str(amount);

func _set_active(mode):
	self.visible = mode == GameModeService.GAME_MODES.Play;
