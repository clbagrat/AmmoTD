extends Node2D

class_name CursorMover;

@export var NodeToMove: Node2D;

var lastCursorPosition: Vector2;

func _process(_delta) -> void:
	var cursorPosition = CursorMovementService.get_current_position();
	if (cursorPosition != lastCursorPosition):
		lastCursorPosition = cursorPosition
		var tween = create_tween();
		if(NodeToMove):
			tween.tween_property(NodeToMove, "position", cursorPosition, .05);
		else:
			tween.tween_property(self, "position", cursorPosition, .05);
		tween.play()


