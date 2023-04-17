extends Node2D;

signal monsterDied(creature: AliveCreature);

func register_death(creature: AliveCreature):
	emit_signal("monsterDied", creature)
	pass;
