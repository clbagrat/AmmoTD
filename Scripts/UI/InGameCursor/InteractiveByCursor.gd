extends Area2D

class_name InteractiveByCursor

signal on_interract;

func set_hover_state(value: bool):
	print(123123123, value)
	pass

		
func interract():
	emit_signal("on_interract")
