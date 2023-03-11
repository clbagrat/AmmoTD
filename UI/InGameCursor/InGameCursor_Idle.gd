extends State

export var cursorServicePath := NodePath();
onready var cursorMovementService: CursorMovementService = get_node(cursorServicePath)


onready var lastCursorPosition: Vector2 = Vector2(-100, -100);

func update(_delta) -> void:
	var cursorPosition = cursorMovementService.get_current_position();
	if (cursorPosition != lastCursorPosition):
		lastCursorPosition = cursorPosition
		var tween = create_tween();
		tween.tween_property(owner, "position", cursorPosition, .05);
		tween.play()

func handle_input(event) -> void:
	if (event.is_action_pressed("pickup")):
		state_machine.transition_to("PickupAmmo")
	
	if (event.is_action_pressed("drop")):
		state_machine.transition_to("DropAmmo")

