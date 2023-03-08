extends Node2D

onready var AmmoCount = $AmmoCount;

func _on_AmmoHolder_amount_change(amount):
	AmmoCount.text = str(amount);
