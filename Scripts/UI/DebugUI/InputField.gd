extends HFlowContainer

class_name  InputField;

@export var label: String;
@export var value: String;
@export var textEdit: TextEdit;
@export var labelUI: Label;

signal text_updated(text: String);


func _ready():
	textEdit.set_text(value);
	labelUI.set_text(label);
	textEdit.connect("text_changed", func(): _on_text_changed());


func _on_text_changed():
	text_updated.emit(textEdit.get_text())

