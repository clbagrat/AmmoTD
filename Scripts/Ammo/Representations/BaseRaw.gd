extends BaseAmmo

class_name BaseRaw;

@onready var sprite: Sprite2D = $Sprite2D;

func on_res_applied(res: AmmoResource):
	sprite.set_texture(res.rawSprite);
