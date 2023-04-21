extends State

@export var CursorSprite: Sprite2D;
@export var HoverTexture: Texture2D;

var prevTexture: Texture2D;

func update(_delta):
	if !CursorMovementService.is_in_hover():
		state_machine.transition_to("Idle")	

func enter():
	prevTexture = CursorSprite.texture;
	CursorSprite.texture = HoverTexture;

func exit():
	CursorSprite.texture = prevTexture
