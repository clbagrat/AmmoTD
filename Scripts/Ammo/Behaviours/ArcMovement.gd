extends Node2D

class_name ArcMovement

@export var FallbackCurve: Curve;
@export var Sprite: Sprite2D;
@export var Shadow: Sprite2D;
@export var maxHeight: float = 20;

var ogDistance: float = Vector2(0, 0).distance_to(Vector2(100, 100));
var targetPos: Vector2 = Vector2(100, 100);
var isStarted = true

func start(startPos: Vector2, target: Vector2):
	ogDistance = startPos.distance_to(target)
	targetPos = target
	isStarted = true

func _physics_process(_delta):
	if (!isStarted): return
	var curDistance = global_position.distance_to(targetPos)
	var progress = 1 - curDistance / ogDistance;
	var heightSample = FallbackCurve.sample_baked(progress);
	Sprite.position = Vector2(0, -heightSample * maxHeight);
	Shadow.scale = Vector2.ONE * max(heightSample, 0.1);
