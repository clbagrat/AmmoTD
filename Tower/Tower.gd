extends Node

export var cooldown = 0.5;
export var damage = 10;

const BulletPath = preload("res://Tower/Bullet.tscn")

var target_alive_creature;

func _on_Area2D_body_entered(body:Node):
	if (body.is_in_group("enemy")):
		target_alive_creature = body.get_parent().get_node("AliveCreature");
		target_alive_creature.connect("died", self, "_on_target_died");



func _on_Area2D_body_exited(_body:Node):
	if(is_instance_valid(target_alive_creature)):
		target_alive_creature.disconnect("died", self, "_on_target_died");
		target_alive_creature = null;

func _on_target_reached(body:Node):
	body.get_parent().get_node("AliveCreature").apply_damage(damage)

func _on_target_died():
	target_alive_creature = null;


var time_passed = 0;
var last_hit_time = 0;
func _process(delta):
	time_passed += delta;
	if (target_alive_creature && (time_passed-last_hit_time) > cooldown):
		last_hit_time = time_passed
		var bullet = BulletPath.instance();
		bullet.position = self.position;
		bullet.set_target(target_alive_creature)
		bullet.connect("target_reached", self, "_on_target_reached")
		get_parent().add_child(bullet)
