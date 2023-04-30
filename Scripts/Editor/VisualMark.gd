@tool

extends Node2D


func _process(_delta):
	if (Engine.is_editor_hint()):
		queue_redraw()

func _draw():
	if Engine.is_editor_hint():
		draw_circle(Vector2.ZERO, 3, Color.PURPLE)
		draw_line(Vector2.ZERO, Vector2.UP * 5, Color.PURPLE, 2);
