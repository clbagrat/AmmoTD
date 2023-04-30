extends TextureButton

class_name BuildingButton

@export var priceTag: RichTextLabel;
@export var buildingTexture: TextureRect;

var currentBuilding: BuildingResource;
func apply_building_resource(res: BuildingResource):
	currentBuilding = res;
	refresh()

func refresh():
	var price = "Free";
	var realPrice = EconomyService.get_building_price(currentBuilding);
	if (realPrice > 0):
		price = str(realPrice)

	priceTag.text = "[center]" + price;
	buildingTexture.set_texture(currentBuilding.sprite);
