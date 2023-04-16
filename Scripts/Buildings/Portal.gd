extends Node2D

func _on_area_2d_body_entered(body:Node2D):
	if (body.is_in_group("enemy")):
		var aliveCreature: AliveCreature = body.get_parent().get_node("AliveCreature");
		aliveCreature.destroy();
