extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var mouse_positon;
var cursor_position;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	mouse_positon = get_viewport().get_mouse_position()
	var new_cursor_position = (mouse_positon / 16).round() * 16;
	if (new_cursor_position != cursor_position):
		cursor_position = new_cursor_position
		var tween = create_tween();
		tween.tween_property(self, "position", cursor_position, .05);
		tween.play()

