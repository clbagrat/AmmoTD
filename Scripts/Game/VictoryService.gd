extends Node2D;

var currentLvl: int = 1;
var maxStreak: int = 5;
var currentStreak: int = 0;

func _ready():
	MonsterDeathService.connect("monsterDied", Callable(self, "_on_monster_died"));


func _on_monster_died(creature: AliveCreature):
	if creature.current_health > 0: # died not from weapon
		_reset();
	else:
		_increment();

func _increment():
	if (SceneConfig.is_polygon):
		return;

	currentStreak += 1;
	if (currentStreak == maxStreak):
		currentLvl += 1
		maxStreak = currentLvl * 5 
		currentStreak = 0;

func _reset():
	currentStreak = 0;

