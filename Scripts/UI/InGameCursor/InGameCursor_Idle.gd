extends State


func _process(_delta) -> void:
	if CursorMovementService.is_in_hover():
		state_machine.transition_to("Interactive")
