extends State


func handle_input(event: InputEvent) -> void:
	if (event.is_action_pressed("pickup")):
		state_machine.transition_to("PickupAmmo")
	
	if (event.is_action_pressed("drop")):
		state_machine.transition_to("DropAmmo")

func _process(_delta) -> void:
	if CursorMovementService.is_in_hover():
		state_machine.transition_to("Interactive")
