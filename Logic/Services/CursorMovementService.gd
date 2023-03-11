extends Node;

class_name CursorMovementService

var cursorPosition = Vector2(0, 0);
var direction = Vector2(0, 0);
var isMouseControl = true;

var lastTimeControlFired = 0;
var currentTime = 0;


func get_current_position() -> Vector2:
	return cursorPosition

func _process(delta) -> void:
	currentTime += delta;
	var newCursorPosition = cursorPosition;
	print(isMouseControl)
	if isMouseControl:
		print("here")
		newCursorPosition = (get_viewport().get_mouse_position() / GlobalConfig.GRID_SIZE).round() * GlobalConfig.GRID_SIZE
	
	if not isMouseControl and currentTime - lastTimeControlFired > 0.15:
		newCursorPosition = cursorPosition + direction * GlobalConfig.GRID_SIZE;
		lastTimeControlFired = currentTime
		

	if (newCursorPosition != cursorPosition):
		cursorPosition = newCursorPosition

func _unhandled_input(event) -> void:
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
