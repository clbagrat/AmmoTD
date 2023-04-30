extends Area2D

class_name CursorHover


var current: InteractiveByCursor;
var isInterracting = false;

func _on_area_entered(area:InteractiveByCursor):
	current = area;
	area.set_hover_state(true)
	CursorMovementService.set_hover(true)
	pass;


func _on_area_exited(area:InteractiveByCursor):
	if (isInterracting && is_instance_valid(current)):
		current.interract_stop()

	current = null
	isInterracting = false;
	area.set_hover_state(false)
	CursorMovementService.set_hover(false)

func _unhandled_input(event: InputEvent):
	if !is_instance_valid(current):
		return;
	if event.is_action_pressed('ui_interract'):
		isInterracting = true;
		current.interract()

	if event.is_action_released('ui_interract') && isInterracting:
		current.interract_stop()
