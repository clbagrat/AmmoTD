extends State


func handle_input(event) -> void:
	if (event.is_action_pressed("pickup")):
		state_machine.transition_to("PickupAmmo")
	
	if (event.is_action_pressed("drop")):
		state_machine.transition_to("DropAmmo")

