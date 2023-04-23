extends BuildingDummy

@export var nodeToRotate: Node2D;

func set_building_rotation(degree: float):
	nodeToRotate.set_rotation(degree);

