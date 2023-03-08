extends State

var cursorPosition;
var direction = Vector2(0, 0);
var isMouseControl = true;

var lastTimeControlFired = 0;
var currentTime = 0;

func update(delta) -> void:
	currentTime += delta;
	var newCursorPosition = cursorPosition;
	if isMouseControl:
		newCursorPosition = (get_viewport().get_mouse_position() / GlobalConfig.GRID_SIZE).round() * GlobalConfig.GRID_SIZE
	
	if not isMouseControl and currentTime - lastTimeControlFired > 0.15:
		newCursorPosition = cursorPosition + direction * GlobalConfig.GRID_SIZE;
		lastTimeControlFired = currentTime
		

	if (newCursorPosition != cursorPosition):
		cursorPosition = newCursorPosition
		var tween = create_tween();
		tween.tween_property(owner, "position", cursorPosition, .05);
		tween.play()

func handle_input(event) -> void:
	if (event.is_action_pressed("pickup")):
		state_machine.transition_to("PickupAmmo")
	
	if (event.is_action_pressed("drop")):
		state_machine.transition_to("DropAmmo")

	if (event is InputEventMouseMotion):
		isMouseControl = true
	
	if (event.is_action_pressed("move_left")):
		direction.x += -1;
		lastTimeControlFired = 0
		isMouseControl = false
	if (event.is_action_pressed("move_right")):
		direction.x += 1;
		lastTimeControlFired = 0
		isMouseControl = false
	if (event.is_action_pressed("move_up")):
		direction.y += -1;
		lastTimeControlFired = 0
		isMouseControl = false
	if (event.is_action_pressed("move_down")):
		direction.y += 1;
		lastTimeControlFired = 0
		isMouseControl = false
	
	if (direction.length() == 0):
		return

	if (event.is_action_released("move_left")):
		direction.x -= -1;
	if (event.is_action_released("move_right")):
		direction.x -= 1;
	if (event.is_action_released("move_up")):
		direction.y -= -1;
	if (event.is_action_released("move_down")):
		direction.y -= 1;

func enter() -> void:
	direction = Vector2(0, 0)

func exit() -> void:
	direction = Vector2(0, 0)

