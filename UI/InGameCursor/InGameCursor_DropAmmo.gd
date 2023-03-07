extends State

onready var ammoHolder: AmmoHolder = owner.get_node("AmmoHolder")
onready var ammoSource: AmmoSource = owner.get_node("AmmoSource")


func _ready() -> void:
	var a = ammoSource.connect("ammo_create", self, "_on_ammo_create");
	print(a);

func _on_ammo_create() -> void:
	ammoHolder.remove(1)	;

func handle_input(event: InputEvent) -> void:
	if (event.is_action_released("drop")):
		state_machine.transition_to("Idle")

func update(_delta) -> void:
	if (ammoHolder.currentAmount <= 0):
		state_machine.transition_to("Idle")

func enter():
	print("enter ammo source")
	ammoSource.turn_on();

func exit():
	print("exit ammor source")
	ammoSource.turn_off();
