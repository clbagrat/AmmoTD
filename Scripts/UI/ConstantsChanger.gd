extends Control

@export var placeForConstants: VBoxContainer;
@export var inputPrefab: PackedScene;

func _unhandled_input(event: InputEvent):
	if (event.is_action_pressed("debug_ui")):
		visible = !visible
		if (visible):
			_render()

func _render():
	var list = GameConstants.C.get_property_list()
	var isFocused = false;
	for child in placeForConstants.get_children():
		child.queue_free()

	for prop in list:
		if (prop.usage != 4102): continue;
		var key = prop.name
		var value = GameConstants.C.get(key);
		var instance: InputField = inputPrefab.instantiate()
		instance.label = key;
		instance.value = str(value);
		placeForConstants.add_child(instance)
		if (!isFocused):
			instance.get_children()[0].grab_focus()
			isFocused = true
