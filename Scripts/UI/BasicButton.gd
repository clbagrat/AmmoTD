@tool
extends TextureButton

@onready var textLabel: RichTextLabel = $Text;
@onready var textureRect: TextureRect = $Texture

@export var text: String;
@export var texture: Texture2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	textLabel.text = "[center]" + text;
	textureRect.set_texture(texture);

func _process(_delta):
	if Engine.is_editor_hint():
		_ready();
