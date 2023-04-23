extends BaseBuilding


@export var inventory: Inventory;
@export var ammoSource: AmmoSource;

func set_initial_rotation(degree: float):
	ammoSource.set_rotation(degree)

