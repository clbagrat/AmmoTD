extends PathFollow2D



export var speed = 10;
func _process(delta):
	set_offset(get_offset() + speed * delta);

