extends BuffObject;

@export var damage = 1;
@export var interval = 0.3;

var target: AliveCreature;

func _ready():
	set_physics_process(false);

func start(creature: AliveCreature) -> void:
	target = creature;
	set_physics_process(true);

func stop(_creature: AliveCreature) -> void:
	target = null
	set_physics_process(false);
	
var lastTick = 0;
func _physics_process(delta):
	lastTick += delta;
	if (lastTick >= interval): 
		target.apply_damage(damage);
		lastTick = 0;
	
