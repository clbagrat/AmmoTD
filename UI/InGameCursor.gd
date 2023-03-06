extends Node2D

onready var AmmoCount = $AmmoCount;
onready var AmmoHolder = $AmmoHolder;
onready var AmmoSource = $AmmoSource;

var mouse_positon;
var cursor_position;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_process_pickup();
	_process_drop();
	mouse_positon = get_viewport().get_mouse_position()
	var new_cursor_position = (mouse_positon / 16).round() * 16;
	if (new_cursor_position != cursor_position):
		cursor_position = new_cursor_position
		var tween = create_tween();
		tween.tween_property(self, "position", cursor_position, .05);
		tween.play()



func _on_AmmoHolder_amount_change(amount):
	AmmoCount.text = str(amount);

func _on_AmmoSource_ammo_create():
	AmmoHolder.remove(1)
	if (AmmoHolder.currentAmount == 0):
		AmmoSource.turn_off();


func _process_pickup():
	if (Input.is_action_just_pressed("pickup")):
		print("press")
		AmmoHolder.turn_on()
	if (Input.is_action_just_released("pickup")):
		print("release")
		AmmoHolder.turn_off()

func _process_drop():
	if (Input.is_action_just_pressed("drop") && AmmoHolder.currentAmount > 0):
		AmmoSource.turn_on()
	if (Input.is_action_just_released("drop")):
		AmmoSource.turn_off()



