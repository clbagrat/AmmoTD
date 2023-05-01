@tool

extends Node2D

@export var color: Color = Color.PURPLE;

func _process(_delta):
	if (Engine.is_editor_hint()):
		queue_redraw()

func _draw():
	if Engine.is_editor_hint():
		draw_circle(Vector2.ZERO, 3, color)
		draw_line(Vector2.ZERO, Vector2.UP * 5, color, 2);
