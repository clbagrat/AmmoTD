extends Node

signal amount_change(amount)
var startGold = 100
@onready var currentGold = startGold;


func get_current_gold() -> int:
	return  currentGold;

func receive(amount: int) -> void:
	assert(amount >= 0) #,"Amount should be positive")
	currentGold += amount;
	_emit();

func spend(amount: int) -> void:
	assert(amount >= 0) ;#,"Amount should be positive")
	assert(currentGold - amount >= 0) ;#,"Not enough")
	currentGold -= amount;
	_emit();

func can_spend(amount: int) -> bool:
	assert(amount >= 0) ;#,"Amount should be positive")
	return currentGold - amount >= 0 
	
func _emit() -> void:
	emit_signal("amount_change", currentGold);
