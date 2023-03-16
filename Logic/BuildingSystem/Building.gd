extends Node;

class_name Building


export(String) var buildingName;
export(PackedScene) var buildingScene;
export var price = 10;


func _ready():
	assert( buildingScene, "ERROR: You must give the asset a value.");
	assert( buildingName != "", "ERROR: You must give the name a value.");
	assert(price > 0, "ERROR: Price should be positive")
