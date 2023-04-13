extends Node2D


# on area entry
	# check if ammo
	# drag it over to the destination

# ammo should be draggable
	# active dragger


@export var speed = 20;

@onready var destination: Node2D = $Destination;

var bodies_to_move: Array[Draggable] = []


func _on_Area2D_body_entered(body:Node):
	if not body.is_in_group("ammo"):
		return;

	var draggable: Draggable = body.get_node("Draggable")
	draggable.set_handler(self);
	bodies_to_move.push_back(draggable);

func _physics_process(delta):
	for i in range(bodies_to_move.size() - 1, -1, -1):
		var draggable = bodies_to_move[i]
		if !is_instance_valid(draggable):
			bodies_to_move.remove_at(i)
			continue
		if draggable.current_handler != self:
			bodies_to_move.remove_at(i)
			continue
		var draggablePos = draggable.body.global_position;
		var newPos = (destination.global_position - draggablePos).normalized() * delta * speed + draggablePos;
		if (newPos.distance_to(destination.global_position) > 0.2):
			draggable.move_body(self, newPos)
		else:
			draggable.unset_handler(self)

