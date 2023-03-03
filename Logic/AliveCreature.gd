extends Node

export var health = 100;


func apply_damage(amount):
	print(amount)
	health -= amount
	if (health <= 0):
		die()

func die():
	get_parent().queue_free()

