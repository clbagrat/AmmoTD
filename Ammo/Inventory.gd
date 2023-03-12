extends Node

class_name Inventory

signal amount_change(amount);

export var capacity: int;
export var startAtFullCapacity: bool;

func _ready():
	if startAtFullCapacity:
		_current_amount = capacity;

var _current_amount = 0;

func get_current_amount() -> int:
	return  _current_amount;

func receive(amount: int) -> void:
	assert(amount > 0, "Amount should be positive")
	assert(_current_amount + amount <= capacity, "Can't fit")
	_current_amount += amount;
	_emit();

func spend(amount: int) -> void:
	assert(amount > 0, "Amount should be positive");
	assert(_current_amount - amount >= 0, "Not enough");
	_current_amount -= amount;
	_emit();

func can_receive(amount: int) -> bool:
	assert(amount > 0, "Amount should be positive");
	return _current_amount + amount <= capacity

func can_spend(amount: int) -> bool:
	assert(amount > 0, "Amount should be positive");
	return _current_amount - amount >= 0 
	


func _emit() -> void:
	emit_signal("amount_change", _current_amount);
