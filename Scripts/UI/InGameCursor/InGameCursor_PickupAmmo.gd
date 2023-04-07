extends State


@onready var ammoHolder: AmmoHolder = owner.get_node("Inventory/AmmoHolder");

func handle_input(event: InputEvent) -> void:
	if (event.is_action_released("pickup")):
		state_machine.transition_to("Idle")

func enter():
	print(ammoHolder)
	ammoHolder.turn_on();

func exit():
	ammoHolder.turn_off();