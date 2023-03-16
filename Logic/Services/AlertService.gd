extends Node

signal new_message(message);

func alert(message: String) -> void:
	emit_signal("new_message", message)
	
