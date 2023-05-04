extends Node;


var _defaultConstants: GameConstantsResource = preload("res://Resources/GameConstantsResource.tres")

var C: GameConstantsResource = _defaultConstants;

var _save_path = "user://gameCostants.tres"


func _init(): 
	if (ResourceLoader.exists(_save_path)):
		C = ResourceLoader.load(_save_path);

func save():
	ResourceSaver.save(C, _save_path);

func reset(): 
	C = _defaultConstants;
	save()

