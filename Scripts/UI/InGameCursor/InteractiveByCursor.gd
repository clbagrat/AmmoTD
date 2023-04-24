extends Area2D

class_name InteractiveByCursor

signal on_interract;

func set_hover_state(_value: bool):
	pass

		
func interract():
	emit_signal("on_interract")
