extends Node2D

export var cooldown = 0.5;
export var damage = 10;

onready var inventory = $Inventory;
onready var AmmoCount = $AmmoCount;


var targets = [];


func _ready():
	_updateAmmoCount(inventory.get_current_amount())


func _on_Inventory_amount_change(amount: int):
	_updateAmmoCount(amount)

func _updateAmmoCount(amount: int):
	AmmoCount.visible = amount > 0
	AmmoCount.text = str(amount);
	

func _on_Area2D_body_entered(body:Node):
	if (body.is_in_group("enemy")):
		var target_alive_creature = body.get_parent().get_node("AliveCreature");
		targets.push_back(target_alive_creature)
		target_alive_creature.connect("died", self, "_on_target_died");

func _on_Area2D_body_exited(body:Node):
	if(is_instance_valid(body) && body.is_in_group("enemy")):
		var target_alive_creature = body.get_parent().get_node("AliveCreature");
		target_alive_creature.disconnect("died", self, "_on_target_died");
		var index = targets.find(target_alive_creature);
		if (index >= 0):
			targets.remove(index)

func _on_target_reached(body:Node):
	var aliveCreature: AliveCreature = body.get_parent().get_node("AliveCreature")

	aliveCreature.apply_damage(damage)

func _on_target_died(target_alive_creature):
		#target_alive_creature.disconnect("died", self, "_on_target_died");
		targets.remove(targets.find(target_alive_creature))

var time_passed = 0;
var last_hit_time = 0;
func _process(delta):
	time_passed += delta;
	
	if (targets.size() > 0 && (time_passed - last_hit_time) > cooldown):
		if (!inventory.can_spend(1)):
			return
		var spentAmmoType = inventory.spend(1)
		last_hit_time = time_passed
		var bullet = AmmoService.create_projectile(spentAmmoType);
		bullet.position = self.position;
		bullet.set_target(targets.front())
		bullet.connect("target_reached", self, "_on_target_reached")
		get_parent().add_child(bullet)
