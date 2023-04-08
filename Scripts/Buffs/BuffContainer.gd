extends Node2D

class_name BuffContainer;

@export var AliveCreaturePath := NodePath();

@onready var aliveCreature: AliveCreature = get_node(AliveCreaturePath);

var lastBuffId = 0;
var timePassed = 0;
var appliedBuffs: Array[AppliedBuff] = []

func apply_buff(buff: BuffObject) -> void:
	add_child(buff);
	buff.start(aliveCreature);
	var appliedBuff = AppliedBuff.new();
	appliedBuff.timeWhenApplied = timePassed;
	appliedBuff.buffObject = buff;

	appliedBuffs.append(appliedBuff);

	print(buff);
	pass


func _physics_process(delta):
	timePassed += delta;
	for appliedBuff in appliedBuffs:
		if timePassed - appliedBuff.timeWhenApplied > appliedBuff.buffObject.duration:
			appliedBuff.buffObject.stop(aliveCreature)
			appliedBuffs.remove_at(appliedBuffs.find(appliedBuff));
