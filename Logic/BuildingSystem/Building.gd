extends Node;

class_name Building


export(String) var buildingName;

export(PackedScene) var buildingScene;




func _ready():
	assert( buildingScene, "ERROR: You must give the asset a value.");
	assert( buildingName != "", "ERROR: You must give the name a value.");
