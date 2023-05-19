extends Node2D

class_name BuffContainer;

@export var aliveCreature: AliveCreature;

var lastBuffId = 0;
var timePassed = 0;
var appliedBuffs: Array[AppliedBuff] = []

func apply_buff(buff: BuffObject) -> void:
	var appliedBuff = AppliedBuff.new();
	appliedBuff.timeWhenApplied = timePassed;
	appliedBuff.buffObject = buff;

	appliedBuffs.append(appliedBuff);
	add_child(buff);
	buff.start(aliveCreature, self);

	pass

func get_all_by_name(name: String) -> Array[AppliedBuff]:
	return appliedBuffs.filter(func(ab): return ab.name == name)

func remove_buffs(applied: Array[AppliedBuff]) -> void:
	for appliedBuff in applied:
		appliedBuff.buffObject.stop(aliveCreature, self)
		appliedBuffs.remove_at(appliedBuffs.find(appliedBuff));


func _physics_process(delta):
	timePassed += delta;
	for appliedBuff in appliedBuffs:
		if timePassed - appliedBuff.timeWhenApplied > appliedBuff.buffObject.duration:
			appliedBuff.buffObject.stop(aliveCreature, self)
			appliedBuffs.remove_at(appliedBuffs.find(appliedBuff));
