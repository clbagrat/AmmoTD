class_name GridUtils

static func get_grid_coords(pos: Vector2) -> Vector2:
	var gridCoords = Vector2(pos.x / GlobalConfig.GRID_SIZE, pos.y / GlobalConfig.GRID_SIZE)
	return gridCoords

