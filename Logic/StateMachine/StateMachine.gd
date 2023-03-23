extends Node

class_name StateMachine

@export var initial_state := NodePath()

@onready var state: State = get_node(initial_state);

func _ready() -> void:
	await owner.ready
	for child in get_children():
		child.state_machine = self;
	state.enter();


func transition_to(stateName: String) -> void:
	if (!has_node(stateName)):
		return;
	state.exit();
	state = get_node(stateName);
	state.enter();

func _unhandled_input(event) -> void:
	state.handle_input(event);

func _process(delta) -> void:
	state.update(delta);

func _physics_process(delta) -> void:
	state.physics_update(delta);

