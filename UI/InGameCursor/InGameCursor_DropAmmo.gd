extends State

@onready var ammoSource: AmmoSource = owner.get_node("Inventory/AmmoSource")


func handle_input(event: InputEvent) -> void:
	if (event.is_action_released("drop")):
		state_machine.transition_to("Idle")

func enter():
	ammoSource.turn_on();

func exit():
	ammoSource.turn_off();
