extends Node

class_name State

var state_machine: StateMachine;

func _ready():
	print("state machine", state_machine)
	pass;

func enter():
	pass;

func exit():
	pass;

func handle_input(_event: InputEvent) -> void:
	pass;

func update(_delta) -> void:
	pass;

func physics_update(_delta) -> void:
	pass;
