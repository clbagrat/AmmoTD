extends BaseCooldown

@export var cooldown = 0.5;

var time_passed = 0;
var last_hit_time = 0;

func _process(delta):
	time_passed += delta;

func has_passed() -> bool:
	return time_passed - last_hit_time >= cooldown

func start_cooldown():
	last_hit_time = time_passed
