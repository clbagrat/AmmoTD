extends Node2D;

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
	currentStreak += 1;
	if (currentStreak == maxStreak):
		AlertService.alert("You won");
		get_tree().paused = true

func _reset():
	currentStreak = 0;
	AlertService.alert("Streak reset");

