class_name GridUtils

static func get_grid_coords(pos: Vector2) -> Vector2:
	var gridCoords = Vector2(int(pos.x / GlobalConfig.GRID_SIZE), int(pos.y / GlobalConfig.GRID_SIZE))
	return gridCoords

static func snap_to_grid(pos: Vector2) -> Vector2:
	return get_grid_coords(pos) * GlobalConfig.GRID_SIZE;

static func get_random_point(gridCoord: Vector2, offset: int) -> Vector2:
	var size = GlobalConfig.GRID_SIZE  - offset;

	var randX = randf_range(-size  / 2, size / 2)

	var randY = randf_range(-size / 2, size / 2)
	return Vector2(randX, randY) + gridCoord * GlobalConfig.GRID_SIZE;
