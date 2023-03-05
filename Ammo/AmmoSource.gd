extends Node2D



const Ammo = preload("res://Ammo/Ammo.tscn");


func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	var ammo = Ammo.instance()
	get_tree().get_root().add_child(ammo);
	var ammoPos = Vector2(rand_range(-3, 3), rand_range(1, 5));
	ammoPos += ammoPos.normalized() * 8 + ammoPos
	ammo.global_position = self.global_position + ammoPos;

