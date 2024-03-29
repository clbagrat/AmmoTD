extends Node;

var cursorPosition = Vector2(0, 0);
var direction = Vector2(0, 0);
var isMouseControl = true;

var lastTimeControlFired = 0;
var currentTime = 0;
var isInHover = false;

var lastMouseCoordinates = Vector2(0, 0)


func get_current_position() -> Vector2:
	return cursorPosition

func set_hover(value: bool) -> void:
	isInHover = value

func is_in_hover() -> bool:
	return isInHover

func is_cursor_over_me(coord: Vector2) -> bool:
	if (coord.x < cursorPosition.x):
		return false
	if (coord.y < cursorPosition.y):
		return false
	if (coord.x > cursorPosition.x + GlobalConfig.GRID_SIZE):
		return false
	if (coord.y > cursorPosition.y + GlobalConfig.GRID_SIZE):
		return false
	return true

func _ready() -> void:
	self.set_process_mode(PROCESS_MODE_ALWAYS);

func _process(delta) -> void:
	currentTime += delta;
	var newCursorPosition = cursorPosition;
	var currentMouseCoordinates = CursorCoordinates.get_coordinates();

	if isMouseControl:
		newCursorPosition = GridUtils.snap_to_grid(currentMouseCoordinates)
	
	if not isMouseControl and currentTime - lastTimeControlFired > 0.15:
		newCursorPosition = cursorPosition + direction * GlobalConfig.GRID_SIZE;
		lastTimeControlFired = currentTime
		

	if (newCursorPosition != cursorPosition):
		cursorPosition = newCursorPosition
	
	if (currentMouseCoordinates != lastMouseCoordinates):
		isMouseControl = true;
	
	lastMouseCoordinates = currentMouseCoordinates;

func _unhandled_input(baseEvent) -> void:
	if (baseEvent is InputEvent):
		var event: InputEvent = baseEvent;
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


