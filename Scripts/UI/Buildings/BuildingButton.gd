extends TextureButton

class_name BuildingButton

@export var priceTag: RichTextLabel;
@export var buildingTexture: TextureRect;

func apply_building_resource(res: BuildingResource):
	var price = "Free";

	if (res.price > 0):
		price = str(res.price)

	priceTag.text = "[center]" + price;
	buildingTexture.set_texture(res.sprite);
