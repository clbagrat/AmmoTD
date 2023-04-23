class_name GridUtils

static func get_grid_coords(pos: Vector2) -> Vector2:
	var gridCoords = Vector2(int(pos.x / GlobalConfig.GRID_SIZE), int(pos.y / GlobalConfig.GRID_SIZE))
	return gridCoords

static func get_random_point(gridCoord: Vector2) -> Vector2:
	var randX = randf_range(-GlobalConfig.GRID_SIZE / 2, GlobalConfig.GRID_SIZE / 2)
	var randY = randf_range(-GlobalConfig.GRID_SIZE / 2, GlobalConfig.GRID_SIZE / 2)
	return Vector2(randX, randY) + gridCoord * GlobalConfig.GRID_SIZE;
