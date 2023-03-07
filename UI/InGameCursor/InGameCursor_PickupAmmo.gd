extends State


onready var ammoHolder: AmmoHolder = owner.get_node("AmmoHolder");

func handle_input(event: InputEvent) -> void:
	if (event.is_action_released("pickup")):
		state_machine.transition_to("Idle")

func enter():
	print("enter ammo holder")
	ammoHolder.turn_on();

func exit():
	print("exit ammor holder")
	ammoHolder.turn_off();
