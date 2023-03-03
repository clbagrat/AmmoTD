extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body:Node):
	body.get_parent().get_node("AliveCreature").apply_damage(3)




func _on_Area2D_body_exited(body:Node):
	body.get_parent().get_node("AliveCreature").apply_damage(300)

