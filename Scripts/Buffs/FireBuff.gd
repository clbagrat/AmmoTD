extends BuffObject;

@export var stacksRequired = 3
@export var damage = 50;

var target: AliveCreature;


func start(creature: AliveCreature, container: BuffContainer) -> void:
	var applied: Array[AppliedBuff] = container.get_all_by_name(buffName);
	if (applied.size() >= stacksRequired):
		creature.apply_damage(damage);
		container.remove_buffs(applied)
	
