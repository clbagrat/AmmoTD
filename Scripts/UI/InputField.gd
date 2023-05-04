extends HFlowContainer

class_name  InputField;

@export var label: String;
@export var value: String;
@export var textEdit: TextEdit;
@export var labelUI: Label;


func _ready():
	textEdit.set_text(value);
	labelUI.set_text(label);


