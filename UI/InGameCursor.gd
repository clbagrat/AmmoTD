extends Node2D

onready var AmmoCount = $AmmoCount;

func _ready():
	var _subscription = GameModeService.connect("gameModeChanged", self, "_set_active");

func _set_active(mode):
	self.visible = mode == GameModeService.GAME_MODES.Play;


func _on_Inventory_amount_change(amount: int):
	AmmoCount.text = str(amount);

