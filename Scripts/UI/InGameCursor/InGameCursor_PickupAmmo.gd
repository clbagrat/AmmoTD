extends State


@export var ammoHolder: AmmoHolder;

func handle_input(event: InputEvent) -> void:
	if (event.is_action_released("pickup")):
		state_machine.transition_to("Idle")

func enter():
	print("ON", ammoHolder)
	ammoHolder.turn_on();

func exit():
	ammoHolder.turn_off();
