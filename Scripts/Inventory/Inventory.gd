extends Node2D

class_name Inventory

signal amount_change(amount);

@export var ammoType: GlobalConfig.AmmoTypes;
@export var capacity: int;
@export var startAtFullCapacity: bool;
@export var canHoldAnyType: bool = true;

var _charges: Array[int] = [];

func _ready():
	if startAtFullCapacity:
		_current_amount = capacity;

var _current_amount = 0;


func get_current_charges() -> Array[int]:
	return _charges;

func get_current_amount() -> int:
	return  _current_amount;

func receive(amount: int, type: int) -> void:
	assert(amount > 0) #,"Amount should be positive")
	assert(_current_amount + amount <= capacity) #,"Can't fit")
	_charges.push_back(type);
	_current_amount += amount;
	_emit();

func spend(amount: int) -> int:
	assert(amount > 0) ;#,"Amount should be positive")
	assert(_current_amount - amount >= 0) ;#,"Not enough")
	_current_amount -= amount;
	_emit();
	if (_charges.size() > 0):
		return _charges.pop_front()
	return ammoType

func can_receive(amount: int, _type: int) -> bool:
	assert(amount > 0) ;#,"Amount should be positive")
	var hasCapacity  = _current_amount + amount <= capacity
	var isProperType = canHoldAnyType || _type == ammoType;
	return hasCapacity && isProperType;

func can_spend(amount: int) -> bool:
	assert(amount > 0) ;#,"Amount should be positive")
	return _current_amount - amount >= 0 
	
func _emit() -> void:
	emit_signal("amount_change", _current_amount);
